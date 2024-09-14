import 'package:flashcard_app/global_providers.dart';
import './services/action_manager.dart';
import './models/action.dart';
import 'package:flashcard_app/tools.dart';
import 'package:riverpod/riverpod.dart';

final container = ProviderContainer();
final cardList = container.read(cardListServiceProvider);
final cardEditorService = container.read(cardEditorServiceProvider);  
final cardQuizService = container.read(cardQuizServiceProvider);

bool isRunning = true;
ActionManager? currentScene;

// Declare "scenes" / ActionManagers
ActionManager editorActions = ActionManager();
ActionManager quizActions = ActionManager();
ActionManager menuActions = ActionManager();

// Reusable Actions
Action exitAction = Action(key: 'X', message: 'Exit app', callback: exitApp);
Action backAction = Action(key: 'B', message: 'Back to menu', callback: switchScene(scene: menuActions));
Action viewCardAction = Action(key: 'V', message: 'View all cards', callback: cardEditorService.viewCards);

void main(){

  // Adding Dummy Flash Cards
  cardList
    ..addCard(question: 'What is the official Dart package manager?', answer: 'pub', showMessage: false)
    ..addCard(question: 'Which keyword is used to create asynchronous functions in Dart?', answer: 'async', showMessage: false)
    ..addCard(question: 'What is the file extension for Dart files?', answer: '.dart', showMessage: false)
    ..addCard(question: 'Is Dart a statically or dynamically typed language?', answer: 'Statically typed', showMessage: false)
    ..addCard(question: 'Which company developed Dart?', answer: 'Google', showMessage: false)
  ;

  // Setup Actions
  editorActions
    ..addAction(key: 'A', message: 'Add a new card', callback: cardEditorService.addCard)
    ..useAction(action: viewCardAction)
    ..addAction(key: 'E', message: 'Edit a card', callback: cardEditorService.editCard)
    ..addAction(key: 'D', message: 'Delete a card', callback: cardEditorService.deleteCard)
    ..useAction(action: backAction)
    ..useAction(action: exitAction)
  ;

  quizActions
    ..useAction(action: viewCardAction)
    ..addAction(key: 'R', message: 'Ask random question', callback: cardQuizService.ask)
    ..addAction(key: 'S', message: 'Select question by ID', callback: cardQuizService.selectQuestion)
    ..useAction(action: backAction)
    ..useAction(action: exitAction)
  ;

  menuActions
    ..addAction(key: 'F', message: 'Flashcard editor', callback: switchScene(scene: editorActions))
    ..addAction(key: 'Q', message: 'Take quiz', callback: switchScene(scene: quizActions))
    ..addAction(key: 'A', message: 'About', callback: printAbout)
    ..useAction(action: exitAction)
  ;

  // Set initial "scene"
  currentScene = menuActions;

  //Main Loop
  print('Flash Card App!');
  while (isRunning){
    printLine(len: 30);
    currentScene?.ask();
    if (isRunning){
      getInput(message: '[ Press Enter to proceed ]');
    }
  }

}

// Returns a function of switching scene because i dont like the look of arrow function
Function switchScene({required ActionManager scene}){
  return (){
    currentScene = scene;
  };
}

// Prints the about section of the app that is definately not written by chatGPT
void printAbout(){
  printLine(len: 100);
  print('''
CLI Flash Card App
By: Yuichi Canete

This is a Command-Line Interface (CLI) Flashcard application built using Dart. 
It helps users create, view, edit, and delete flashcards, making it useful for studying or memorizing key concepts.

Key Features:
- Flashcard Editor: Create new cards, edit existing ones, and remove cards when no longer needed.
- Quiz Mode: Test your knowledge by answering random or specific flashcards.
- Easy Navigation: Navigate between different sections of the app using simple key commands.

The app is designed to be lightweight, fast, and customizable for any topic, from programming to general knowledge.

Happy learning!
''');
  printLine(len: 100);
}

// exits the app
void exitApp(){
  isRunning = false;
  print('Exiting the app.');
}
