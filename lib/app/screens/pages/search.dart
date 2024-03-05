import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  void search() async {
    searchFocusNode.unfocus();
    if (searchController.text.trim().isEmpty) return;

    //! perform query
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          focusNode: searchFocusNode,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search_rounded,
              color: Theme.of(context).colorScheme.primary,
            ),
            hintText: 'Search music',
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
            filled: true,
            contentPadding: const EdgeInsets.all(0),
            fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
