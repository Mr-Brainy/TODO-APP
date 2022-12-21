import 'package:flutter/material.dart';
import 'package:show_app/model/task.dart';
import '../model/creates.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<Todo> _todos = [];
  final TextEditingController _todoController = TextEditingController();
  // _buildItems() {}
  _toggleTodo(Todo todo, bool isChecked) {
    setState(() {
      todo.isDone = isChecked;
    });
  }

  Widget _buildIems(BuildContext context, int index) {
    final todo = _todos[index];
    return CheckboxListTile(
      value: todo.isDone,
      title: Text(todo.name),
      onChanged: (bool? isChecked) {
        _toggleTodo(todo, isChecked!);
      },
    );
  }

  Future<void> _displayDialog(BuildContext context) async {
    final todo = await showDialog<Todo>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add Your Task'),
            content: TextField(
              autofocus: true,
              controller: _todoController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8.0),
                hintText: 'Enter your new task.',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    width: 5.0,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('CANCEL'),
              ),
              TextButton(
                onPressed: () {
                  _addTodoItems(_todoController.value.text);
                  Navigator.of(context).pop();
                },
                child: const Text('ADD'),
              ),
            ],
          );
        });
  }

  void _addTodoItems(String name) {
    setState(() {
      _todos.add(
        Todo(name: name),
      );
      _todoController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO APP'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: _buildIems,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayDialog(context),
        child: const Icon(Icons.add),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(color: Colors.brown),
              child: Text(
                'Drawer List',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.amber,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.message_outlined),
              title: Text('Messages'),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const MyInfo();
                    },
                  ),
                );
              },
              leading: const Icon(Icons.person_add_alt_1_outlined),
              title: const Text('Profile'),
            ),
            const ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
              },
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Exit'),
            ),
            const ListTile(
              leading: Icon(Icons.attach_money_rounded),
              title: Text('Income'),
            ),
          ],
        ),
      ),
    );
  }
}
