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
  final _textEditingController = TextEditingController();
  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: TypeAheadFormField(
              hideSuggestionsOnKeyboardHide: false,
              textFieldConfiguration: TextFieldConfiguration(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  hintText: 'Search Username',
                ),
              ),
              noItemsFoundBuilder: (context) => const SizedBox(
                height: 60,
                child:  Center(
                  child: Text(
                    'No Users Found.',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              itemBuilder: (context, ItemsModel? suggestion) {
                final item = suggestion!;
                return ListTile(
                  title: Text(item.name!),
                );
              },
              minCharsForSuggestions: 3,
              onSuggestionSelected: (ItemsModel suggestion) {
                _textEditingController.text = suggestion.name!;
              },
              suggestionsCallback: UserApi.getUserSuggestions,
            ),
          ),
        )
    );
  }
}
