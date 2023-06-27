import 'package:first/model/todo.dart';
import 'package:first/widget/todo_item.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TODo> todoList = TODo.todoList();
  List<TODo> _found = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _found = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFEEEFF5),
        appBar: _buildApp(),
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 90),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  searchBox(),
                  Expanded(
                      child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                          'All Works',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      ),
                      for (TODo toDo in _found.reversed)
                        TodoItem(
                          toDo: toDo,
                          onToDoChanged: _handleTODo,
                          onDeleteItem: _deleteToDoItem,
                        ) ,
                    ],
                  ))
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(10.0, 10.0),
                          blurRadius: 10.0,
                          spreadRadius: 10.0,
                          blurStyle: BlurStyle.normal),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                        hintText: 'Add a New', 
                        border: InputBorder.none),
                  ),
                )),
                Container(
                  margin: EdgeInsets.only(right: 20, bottom: 20),
                  child: ElevatedButton(
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 40),
                    ),
                    onPressed: () {
                      _addToDoItem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                      minimumSize: Size(60, 60),
                      elevation: 10,
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ));
  }

  void _handleTODo(TODo toDo) {
    setState(() {});
    toDo.isDone = !toDo.isDone;
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todoList.add(TODo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoTExt: toDo));
    });
    _todoController.clear();
  }

  void _runFilter(String enterkey) {
    List<TODo> result = [];
    if (enterkey.isEmpty) {
      result = todoList;
    } else {
      result = todoList
          .where((item) =>
              item.todoTExt!.toLowerCase().contains(enterkey.toLowerCase()))
          .toList();
    }

    setState(() {
      _found = result;
    });
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
          border: InputBorder.none,
          hintText: 'Search',
        ),
      ),
    );
  }

  AppBar _buildApp() {
    return AppBar(
        backgroundColor: Color(0xFFEEEFF5),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: Color(0xFF3A3A3A),
              size: 30,
            ),
            Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                // child: Image.asset('assests/avtar.png'),
                borderRadius: BorderRadius.circular(20),
              ),
            )
          ],
        ));
  }
}
