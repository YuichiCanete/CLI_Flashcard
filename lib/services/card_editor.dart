import 'package:flashcard_app/global_providers.dart';
import 'package:flashcard_app/models/card.dart';
import 'package:riverpod/riverpod.dart';
import '../tools.dart';

// Allow add, view, editing and deletion of cards with user input
// service, controller
class CardEditor{
  final Ref container;
  CardEditor(this.container);

  void addCard(){
    final cardList = container.read(cardListServiceProvider);
    String? newQuestion = getInput(message: 'Type in the question: ');
    String? newAnswer = getInput(message: 'Type in the answer: ');
    if (newQuestion != null && newAnswer != null){
      cardList.addCard(question: newQuestion, answer: newAnswer);
    } else {
      print('Failed to add new card');
    }
  }

  void viewCards(){
    final cardList = container.read(cardListServiceProvider);
    for (var i = 0; i < cardList.cards.length; i++) {
      Card card = cardList.cards[i];
      card.display(showAnswer: true, idx: i+1);
    }
  }

  void deleteCard(){
    final cardList = container.read(cardListServiceProvider);
    String? inputId = getInput(message: 'Type Card Id to delete: ');
    if (inputId != null){
      int? idx = int.tryParse(inputId);
      if (idx != null){
        cardList.deleteCard(idx: idx - 1);
      } else {
        print('Failed to add new card');
      }
    } else {
      print('Invalid Id');
    }
  }

  void editCard(){
    final cardList = container.read(cardListServiceProvider);
    String? inputId = getInput(message: 'Type Card Id to edit: ');
    if (inputId != null){
      int? idx = int.tryParse(inputId);
      String? newQuestion = getInput(message: 'Type in the question: ');
      String? newAnswer = getInput(message: 'Type in the answer: ');
      if (idx != null && newQuestion != null && newAnswer != null){
        cardList.editCard(idx: idx - 1, question: newQuestion, answer: newAnswer);
      } else {
        print('Failed to edit card');
      }
    } else {
      print('Id cannot be empty.');
    }
  }

}