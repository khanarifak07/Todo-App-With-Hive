import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/screens/home_page.dart';

void main() async {
  //init the hive
  await Hive.initFlutter();
  //open a box
  await Hive.openBox("myBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Colors.yellow),
          primarySwatch: Colors.yellow,
          useMaterial3: true,
        ),
        home: const HomePage());
  }
}
