import 'package:flutter/cupertino.dart';

class TODo {
  String? id;
  String? todoTExt;
  bool isDone;

  TODo({
    required this.id,
    required this.todoTExt,
    this.isDone = false,
  });
  static List<TODo> todoList() {
    return [
      TODo(id: '1', todoTExt: 'First Task',isDone: true),
      TODo(id: '2', todoTExt: 'Second Task',isDone: true),
      TODo(id: '3', todoTExt: 'Third Task',),
      TODo(id: '4', todoTExt: 'Fourth Task',isDone: true),
      TODo(id: '5', todoTExt: 'Fiifth Task',isDone: true),
      TODo(id: '6', todoTExt: 'Sixth Task',),
      TODo(id: '7', todoTExt: 'Seventh Task',isDone: true),
      TODo(id: '8', todoTExt: 'Eight Task',isDone: true),
      TODo(id: '9', todoTExt: 'Nineth Task',),
        ];
    
  }
}
