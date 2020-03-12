


import 'dart:async';

final List<String> contact = ["User1","User2","User3","User4","User5","User7","User8","User9","User10","User11","UserN"];

class BLocManager{

  Stream<List<String>> get contactsListNow async* {
    for (var i = 0; i < contact.length; i++) {
      await Future.delayed(Duration(seconds: 2));
      yield contact.sublist(0, (i + 1));
    }
  }

    final StreamController<int> counterController =  StreamController<int>();

     Stream<int> get countValue {
       return counterController.stream;
    }

    BLocManager(){
      contactsListNow.listen((list){
        return counterController.add(list.length);
      });
    }


}
