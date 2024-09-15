import 'package:flashcard_app/models/card.dart';
import 'package:flashcard_app/tools.dart';
import 'package:riverpod/riverpod.dart';
import '../global_providers.dart';

// Handles the selection and randomization of asking a flash card question
// service, controller
class CardQuiz{
  final Ref container;
  CardQuiz(this.container);

  void ask(){
    final cardList = container.read(cardListServiceProvider);
    Card? card = cardList.randomCard();
    if (card != null){
      card.display();
      getInput(message: '[ Press Enter to reveal the answer ]');
      card.display(showAnswer: true);
    }
  }

  void selectQuestion(){
    final cardList = container.read(cardListServiceProvider);
    String? idInput = getInput(message: 'Select question Id to answer:');
    if (idInput != null){
      int? id = int.tryParse(idInput);
      if (id != null){
        print(id);
        Card? card = cardList.findCard(idx: id - 1);
        if (card != null){
          card.display();
          getInput(message: '[ Press Enter to reveal the answer ]');
          card.display(showAnswer: true);
        } else {
          print('There is no card with that Id');
        }
      } else {
        print('invalid input');
      }
    } else {
      print('invalid input');
    }
    
  }
}