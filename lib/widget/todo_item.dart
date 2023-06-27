import 'package:first/model/todo.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final TODo toDo;
  final onToDoChanged;
  final onDeleteItem;

  const TodoItem(
      {Key? key,
      required this.toDo,
      required this.onToDoChanged,
      required this.onDeleteItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        onTap: () {
          onToDoChanged(toDo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          toDo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.blueAccent,
        ),
        title: Text(
          toDo.todoTExt!,
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              decoration: toDo.isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 32,
          decoration: BoxDecoration(
              color: Colors.redAccent, borderRadius: BorderRadius.circular(5)),
          child: IconButton(
            color: Colors.white,
            icon: Icon(Icons.delete),
            iconSize: 16,
            onPressed: () {
              onDeleteItem(toDo.id);
            },
          ),
        ),
      ),
    );
  }
}
