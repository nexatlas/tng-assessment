import 'package:chefwizz/core/utils/extensions/theme_extensions.dart';
import 'package:chefwizz/core/utils/svg_paths.dart';
import 'package:chefwizz/core/widgets/render_svg.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchBarWidget extends HookConsumerWidget {
  final TextEditingController searchTextController;
  /// Callback when the search query changes.
  final ValueChanged<String> onChanged;

  const SearchBarWidget({
    super.key,
    required this.searchTextController,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SizedBox(
              height: 40,
              child: TextField(
                autofocus: true,
                controller: searchTextController,
                onChanged: onChanged,
                decoration: InputDecoration(
                  suffixIconConstraints: const BoxConstraints(
                    minHeight: 22,
                    minWidth: 22,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: 'Search for recipes',
                  hintStyle: context.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      searchTextController.clear();
                      onChanged('');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(
                          size: 16,
                          Icons.clear,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                    child: RenderSvg(
                      svgPath: SvgPath.search,
                      color: context.bodyLargeColor,
                    ),
                  ),
                  prefixIconConstraints: const BoxConstraints(
                    minHeight: 22,
                    minWidth: 22,
                  ),
                ),
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            FocusScope.of(context).unfocus();
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
