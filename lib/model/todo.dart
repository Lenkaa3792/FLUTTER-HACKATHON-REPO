class ToDo {
  String id;
  String todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '1', todoText: 'Buy groceries', isDone: true),
      ToDo(id: '2', todoText: 'Go shopping', isDone: true),
      ToDo(id: '3', todoText: 'Call mom', isDone: true),
      ToDo(id: '4', todoText: 'Call dad'),
      ToDo(id: '5', todoText: 'Call brother'),
      ToDo(id: '6', todoText: 'Call sister'),
    ];
  }
}
