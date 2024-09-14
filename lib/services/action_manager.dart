import '../tools.dart';
import '../models/action.dart';

// "easy" way to manage actions
// Why not use switch case to handle input?
class ActionManager{
  List<Action> actionList = [];

  // Manually add action
  void addAction({required String key, required String message, required Function callback}){
    actionList.add(Action(key: key, message: message, callback: callback));
  }

  // Add reusable action
  void useAction({required Action action}){
    actionList.add(action);
  }

  // handles the display and input
  void ask(){
    print('Select action');
    for (var action in actionList) {
      action.display();
    }
    String? input = getInput(message: 'Enter your action: ');
    bool isFind = false;
    if (input != null){
      for (var action in actionList) {
        if (action.key.toUpperCase() == input.toUpperCase()){
          action.callback();
          isFind = true;
        }
      }
    }
    if (!isFind){
      print('Cannot find action: $input');
    }
  }
}