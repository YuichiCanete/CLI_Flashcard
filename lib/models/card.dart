import 'dart:math';

class Card {
  String question;
  String answer;

  Card({
    required this.question,
    required this.answer,
  });

  // Draws a square that acts as a flash card
  void display({bool showAnswer = false, int? idx}) {
    int maxLength = 'Question: $question'.length;
    if (idx != null) {
      maxLength = max(maxLength, 'Question ID: $idx'.length);
    }
    if (showAnswer) {
      maxLength = max(maxLength, 'Answer: $answer'.length);
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

    print('+${'-' * maxLength}+');
  }
}
