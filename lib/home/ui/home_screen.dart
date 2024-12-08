import 'package:flutter/material.dart';
import 'package:tng_assessment/details/recipe_details.dart';
import 'package:tng_assessment/home/bloc/home_repository.dart';
import 'package:tng_assessment/home/models/recipe_response_model.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  final HomeRepository repository = HomeRepository();

  List<RecipeData>? filteredRecipes;

  List<RecipeData>? allRecipes;

  @override
  void initState() {
    super.initState();
    _fetchRecipes();
    _controller.addListener(_filterRecipes);
  }

  Future<void> _fetchRecipes() async {
    final recipes = await repository.fetchRecipes();
    setState(() {
      allRecipes = recipes;
      filteredRecipes = recipes;
    });
  }

  void _filterRecipes() {
    final query = _controller.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredRecipes = allRecipes;
      } else {
        filteredRecipes = allRecipes
            ?.where((recipe) => recipe.name!.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_filterRecipes);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff191919),
        leading: null,
        automaticallyImplyLeading: false,
        title: Text(
          "ChefWizz",
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: TextFormField(
                onTapOutside: (PointerDownEvent event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                controller: _controller,
                cursorColor: const Color(0xff75778F),
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  filled: true,
                  isCollapsed: true,
                  hintText: "Search recipes",
                  hintStyle: TextStyle(
                    color: Color(0xff75778F),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              child: filteredRecipes == null
                  ? const Center(child: CircularProgressIndicator())
                  : filteredRecipes!.isEmpty
                      ? const Center(child: Text('No recipes found!'))
                      : ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          itemBuilder: (context, index) {
                            final recipe = filteredRecipes![index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => RecipeDetailsScreen(recipeData: recipe)));
                              },
                              child: Card(
                                elevation: 0,
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Container(
                                              height: 100,
                                              width: 100,
                                              child:
                                                  Image.network(recipe.image!))),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              recipe.name!,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              recipe.description!,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: Colors.black
                                                      .withOpacity(0.55)),
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                              // Enables text wrapping.
                                              maxLines: 2,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 15),
                          itemCount: filteredRecipes!.length,
                        ),
            )
          ],
        ),
      ),
    );
  }
}
