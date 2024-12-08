import 'package:flutter/material.dart';
import 'package:tng_assessment/database/session_manager.dart';
import 'package:tng_assessment/home/models/recipe_response_model.dart';
import 'package:tng_assessment/main/main_screen.dart';

class RecipeDetailsScreen extends StatefulWidget {
  static const String id = 'details_screen';

  final RecipeData? recipeData;

  const RecipeDetailsScreen({super.key, required this.recipeData});

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  bool isLiked = false;
  var scrollController = ScrollController();

  @override
  void initState() {
    _checkFavorites();
    super.initState();
  }
  Future<void> _checkFavorites() async {
    var isRecipeLiked = SessionManager.instance.isLiked(widget.recipeData!.id.toString());
    setState(() {
      isLiked = isRecipeLiked;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              iconTheme: IconThemeData(
                color: innerBoxIsScrolled ? Colors.black : Colors.white,
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : Colors.white,
                  ),
                  onPressed: () {
                   setState(() {
                     isLiked = !isLiked;
                     SessionManager.instance.toggleLike(widget.recipeData!.id.toString());
                     favoritesNotifier.value = !favoritesNotifier.value;
                   });
                  },
                )
              ],
              pinned: true,
              elevation: 0.5,
              expandedHeight: 271,
              backgroundColor: Colors.black,
              flexibleSpace:
              FlexibleSpaceBar(
                  background: Stack(children: [Positioned.fill(child: Image.network(widget.recipeData?.image ?? '',fit: BoxFit.cover,))])),
            )
          ];
        },
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.recipeData?.name ?? '',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 24),
              const Text(
                "Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              Text(
                widget.recipeData?.description ?? '',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 24),
              const Text(
                "Ingredients",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              Column(
                children:
                  widget.recipeData!.ingredients!.map((ingredient){
                    return Row(
                      children: [
                        Text(String.fromCharCode(0x2022),
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(width: 5),
                        Expanded(child: Text(ingredient,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                        ))
                      ],
                    );
                  }).toList()
                ,
              ),
              SizedBox(height: 24),
              const Text(
                "Instructions",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 12),
              Column(
                children:
                  widget.recipeData!.instructions!.map((instruction){
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(String.fromCharCode(0x2013),
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(width: 5),
                        Expanded(child: Text(instruction,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                        ))
                      ],
                    );
                  }).toList()
                ,
              )
            ],
          ),
        ),
      ),
    );
  }
}
