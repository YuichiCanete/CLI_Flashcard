import 'package:flashcard_app/services/card_quiz.dart';
import 'package:riverpod/riverpod.dart';
import './services/card_editor.dart';
import './services/card_list.dart';

final cardListServiceProvider = Provider((ref) {
  return CardList();
});

final cardEditorServiceProvider = Provider((ref) {
  return CardEditor(ref);
});

final cardQuizServiceProvider = Provider((ref) {
  return CardQuiz(ref);
});
