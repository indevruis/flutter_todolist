import 'package:flutter/material.dart';
import 'package:todolist/models/todo.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final List<Todo> _todoList = [];
  final List<TextEditingController> _controllers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
      body: ListView.builder(
        primary: false,
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: _todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        _todoList[index].isDone = !_todoList[index].isDone;
                      });
                    },
                    icon: _todoList[index].isDone
                        ? const Icon(Icons.check_circle_outline_outlined)
                        : const Icon(Icons.circle_outlined)),
                Expanded(
                    child: _todoList[index].isEditing
                        ? TextField(
                            controller: _controllers[index],
                            onChanged: ((value) {
                              _todoList[index].content =
                                  _controllers[index].text;
                            }),
                          )
                        : Text(
                            _todoList[index].content,
                            style: TextStyle(
                                decoration: _todoList[index].isDone
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none),
                          )),
                IconButton(
                    onPressed: () {
                      setState(() {
                        _todoList[index].isEditing =
                            !_todoList[index].isEditing;
                        _controllers[index].text = _todoList[index].content;
                      });
                    },
                    icon: _todoList[index].isEditing
                        ? const Icon(Icons.check)
                        : const Icon(Icons.edit)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        _todoList.removeAt(index);
                        _controllers.removeAt(index);
                      });
                    },
                    icon: const Icon(Icons.delete)),
              ],
            ),
          ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _todoList.add(Todo()..content = "New Todo");
            _controllers.add(TextEditingController());
          });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
