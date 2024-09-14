import 'dart:io';
import 'dart:math';

// Easier way to get input
// includes message and returns error when the input is empty
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

// returns a random element within a list
dynamic randomElement({List<dynamic>? list}){
  final rand = Random();
  return list?[rand.nextInt(list.length)];
}

// prints a line
void printLine({int len = 10}){
  print('-' * len);
}