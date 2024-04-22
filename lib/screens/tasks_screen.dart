import 'package:flutter/material.dart';
import 'package:todolist/widgets/todo_items.dart';

import '../model/todo.dart';

class TasksScreen extends StatefulWidget {
  TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _runFilter(String enteredkeyword) {
    List<ToDo> results = [];
    if (enteredkeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredkeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: Icon(
                  Icons.assignment,
                ),
              ), // Task icon
              SizedBox(
                  width: 8), // Add some spacing between the icon and the title
              Text(
                'Tasks App',
                style: TextStyle(color: Colors.white),
              ), // Title text
            ],
          ),
          backgroundColor: Color.fromARGB(255, 136, 48, 7),
          iconTheme: IconThemeData(color: Colors.white)),
      drawer: Drawer(
        elevation: 0,
        child: Column(
          children: const [
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage("plp.jpeg"),
              ),
              accountName: Text("Kamash"),
              accountEmail: Text("kamash@gmail.com"),
            ),
            const ListTile(
              title: Text("Dashboard"),
              leading: Icon(Icons.menu_outlined),
            ),
            const ListTile(
              title: Text("Pending Task"),
              leading: Icon(Icons.incomplete_circle),
            ),
            const ListTile(
              title: Text("Completed Task"),
              leading: Icon(Icons.check_box),
            ),
            const ListTile(
              title: Text("Help"),
              leading: Icon(Icons.help_center),
            ),
            ListTile(
              title: const Text("Logout"),
              leading: const Icon(Icons.logout),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Container(
          child: Column(
            children: [
              Container(
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
                        color: const Color.fromARGB(255, 39, 38, 38),
                        size: 20,
                      ),
                      prefixIconConstraints:
                          BoxConstraints(maxHeight: 20, minWidth: 25),
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30, bottom: 20),
                    child: Text(
                      "All ToDos",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ),
                  for (ToDo todo in _foundToDo)
                    ToDoItem(
                      todo: todo,
                      onToDoChanged: _handleToDoChange,
                      onDeleteItem: _deleteToDoItem,
                    ),
                ],
              ))
            ],
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 206, 202, 183),
    );
  }
}
