import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase {
  List todos = [];
  //reference the hive box
  final _myBox = Hive.box("myBox");

  //opne the apps for the first time ever
  void createInitialData() {
    todos = [
      ['Complete Homework', false],
      ['Do Exercise', false],
    ];
  }

  //load the data from the databse
  void loadData() {
    todos = _myBox.get("TODOLIST");
  }

  //update the databse
  void updatData() {
    _myBox.put("TODOLIST", todos);
  }
}
