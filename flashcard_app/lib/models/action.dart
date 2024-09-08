class Action{
  String key;
  String message;
  Function callback = () {
    print('Nothing Happened');
  };

  Action({
    required this.key,
    required this.message,
    required this.callback
  });

  void display(){
    print('[$key] $message');
  }
}