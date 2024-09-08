import 'dart:io';
import 'dart:math';

String? getInput({String? message, bool nextLine = false}) {
  if (message != null) {
    if (nextLine) {
      print(message);
    } else {
      stdout.write(message);
    }
  }
  String? input = stdin.readLineSync();
  if (input == null || input.trim().isEmpty) {
    return null;
  }
  return input;
}

dynamic randomElement({List<dynamic>? list}){
  final rand = Random();
  return list?[rand.nextInt(list.length)];
}

void printLine({int len = 10}){
  print('-' * len);
}