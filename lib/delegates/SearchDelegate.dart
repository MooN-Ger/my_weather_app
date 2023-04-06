import 'package:flutter/material.dart';

class MySearchDelegate extends SearchDelegate {
  String selectedResult = '';
  final Function callback;

  MySearchDelegate(this.callback);

  //метод возвращает компонент, который отображается справа строки поиска. У нас это кнопка удаление текущего ввода:
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close),
      ),
    ];
  }

  //метод возвращает компонент, который отображается слева шапки (например, стрелка назад):
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back),
    );
  }

  //метод вызывается, когда был вызван метод showResults:
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult),
      ),
    );
  }

  @override
  void showResults(BuildContext context) {
    selectedResult = query;
    callback(query);
    close(context, query);
  }

  //метод обрабатывает то, что вводит пользователь:
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> searchResults = ["Helsinki", "Moscow", "Berlin", "New York", "Saint Petersburg", query].where((element) => element.contains(query)).toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index]),
          onTap: () {
            selectedResult = searchResults[index];
            callback(selectedResult);
            Navigator.pop(context);
          },
        );
      },
    );
  }
}