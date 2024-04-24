import 'package:flutter/material.dart';
import 'package:todolist/model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final Function(ToDo) onToDoChanged;
  final Function(String) onDeleteItem;

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),  // Set margin
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);  // Call callback function when tapped
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),  // Set content padding
        tileColor: Colors.white,  // Set tile color
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,  // Set leading icon based on todo status
          color: Colors.blue,  // Set icon color
        ),
        title: Text(
          todo.todoText,  // Set todo text
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,  // Apply decoration if todo is done
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            onPressed: () {
              onDeleteItem(todo.id);  // Call callback function when delete button is pressed
            },
            icon: Icon(
              Icons.delete,
              size: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
