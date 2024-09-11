import '../models/card.dart';
import '../tools.dart';


class CardList {
  List<Card> cards = [];

  Card? findCard({required int idx}) {
    if (idx >= 0 && idx < cards.length) {
      return cards[idx];
    }
    return null;
  }

  Card? randomCard(){
    return randomElement(list: cards);
  }

  void addCard({String? question, String? answer, bool showMessage = true}) {
    String? message;
    if (question != null && answer != null) {
      cards.add(Card(
        question: question,
        answer: answer
        )
      );
      message = 'Card added successfully!';
    } else {
      message = 'Failed to add the card. Please provide both a question and an answer.';
    }
    if(showMessage){
      print(message);
    }
  }

  void deleteCard({int? idx, bool showMessage = true}) {
    String? message;
    if (idx != null) {
      Card? card = findCard(idx: idx);
      if (card != null) {
        cards.remove(card);
        message = 'Card removed successfully!';
      } else {
        message = 'Sorry, a card with that ID does not exist.';
      }
    } else {
     message = 'Invalid card number provided. Please enter a valid card ID.';
    }
    if(showMessage){
      print(message);
    }
  }

  void viewCards() {
    if (cards.isNotEmpty) {
      print('Here are your flashcards:');
      for (var card in cards) {
        card.display(showAnswer: true);
      }
    } else {
      print('You don\'t have any cards yet.');
    }
  }

  void editCard({int? idx, String? question, String? answer, bool showMessage = true}) {
    String? message;
    if (cards.isNotEmpty && idx != null && question != null && answer != null) {
      Card? card = findCard(idx: idx);
      if (card != null) {
        card.question = question;
        card.answer = answer;
        message = 'Card successfully updated!';
      } else {
        message = 'Sorry, a card with that ID does not exist.';
      }
    } else {
      message = 'Couldn\'t edit the card. Make sure you have cards and provide valid input.';
    }
    if (showMessage){
      print(message);
    }
  }
}
