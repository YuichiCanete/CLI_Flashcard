import 'package:flashcard_app/services/card_quiz.dart';
import 'package:riverpod/riverpod.dart';
import './services/card_editor.dart';
import './services/card_list.dart';

// Easy way to do dependency injection
// And manage global instances of cardList, cardEditor and cardQuiz

final cardListServiceProvider = Provider((ref) {
  // maintains list of flashcards
  return CardList();
});


final cardEditorServiceProvider = Provider((ref) {
  // depends of cardList
  // modifies the contents of cardList
  return CardEditor(ref);
});

final cardQuizServiceProvider = Provider((ref) {
  // depends of cardList
  // allow user to take quiz based on stored data  in cardList
  return CardQuiz(ref);
});
