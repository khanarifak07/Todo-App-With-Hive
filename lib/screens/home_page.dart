import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/database/db.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  final _myBox = Hive.box("myBox");

  @override
  void initState() {
    // if user opens the app for first time ever create default todos
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  TextEditingController taskController = TextEditingController();

  TodoDataBase db = TodoDataBase();

  //check box cheanged
  void checkBoxChanged(int index, bool? value) {
    setState(() {
      db.todos[index][1] = !db.todos[index][1];
    });
    db.updatData();
  }

  //add task to todos array
  void addNewTask() {
    if (taskController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Write something to add")));
    } else {
      setState(() {
        //save the task to todos list
        db.todos.add([taskController.text, false]);
        //clear the controller
        taskController.clear();
      });

      db.updatData();
      //back to the homepage
      Navigator.pop(context);
    }
  }

  //cancel task
  void cancelTask() {
    Navigator.pop(context);
  }

  //create Task
  void createTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: taskController,
            onAdd: addNewTask,
            onCancel: cancelTask,
          );
        });
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      db.todos.removeAt(index);
    });
    db.updatData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text(
          "TODO",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: db.todos.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoList(
              taskName: db.todos[index][0],
              isTodoCompleted: db.todos[index][1],
              onChanged: (value) => checkBoxChanged(index, value),
              deleteTask: (context) => deleteTask(index));
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: createTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
