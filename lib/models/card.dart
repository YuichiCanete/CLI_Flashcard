import 'dart:math';

class Card {
  String question;
  String answer;
  List<String> categories;

  Card({
    required this.question,
    required this.answer,
    required this.categories
  });

  void display({bool showAnswer = false, bool showCategory = false, int? idx}) {
    int maxLength = 'Question: $question'.length;
    if (idx != null) {
      maxLength = max(maxLength, 'Question ID: $idx'.length);
    }
    if (showAnswer) {
      maxLength = max(maxLength, 'Answer: $answer'.length);
    }
    if (showCategory && categories.isNotEmpty) {
      String categoriesText = 'Categories: ${categories.join(', ')}';
      maxLength = max(maxLength, categoriesText.length);
    }
    maxLength += 4;

    print('+${'-' * maxLength}+');

    if (idx != null) {
      print('| ${'Question ID: $idx'.padRight(maxLength - 1)}|');
    }

    print('| ${'Question: $question'.padRight(maxLength - 1)}|');

    if (showAnswer) {
      print('| ${'Answer: $answer'.padRight(maxLength - 1)}|');
    }

    if (showCategory && categories.isNotEmpty) {
      print('| ${'Categories: ${categories.join(', ')}'.padRight(maxLength - 1)}|');
    }

    print('+${'-' * maxLength}+');
  }
}
