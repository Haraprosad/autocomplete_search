import 'package:autocomplete_search/features/searching_items/data/data_repository/repository_impl.dart';
import 'package:autocomplete_search/features/searching_items/data/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SearchingItemsPage extends StatefulWidget {
  const SearchingItemsPage({Key? key}) : super(key: key);

  @override
  _SearchingItemsPageState createState() => _SearchingItemsPageState();
}

class _SearchingItemsPageState extends State<SearchingItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: TypeAheadFormField(
              hideSuggestionsOnKeyboardHide: false,
              textFieldConfiguration: const TextFieldConfiguration(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  hintText: 'Search Username',
                ),
              ),
              noItemsFoundBuilder: (context) => const SizedBox(
                height: 100,
                child:  Center(
                  child: Text(
                    'No Users Found.',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              itemBuilder: (context, Item? suggestion) {
                final item = suggestion!;
                return ListTile(
                  title: Text(item.name),
                );
              },
              minCharsForSuggestions: 3,
              onSuggestionSelected: (suggestion) {  },
              suggestionsCallback: UserApi.getUserSuggestions,
            ),
          ),
        )
    );
  }
}
