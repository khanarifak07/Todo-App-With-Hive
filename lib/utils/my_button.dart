import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function() ontap;
  final String name;
  const MyButton({super.key, required this.name, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.yellow,
      onPressed: ontap,
      child: Text(name),
    );
  }
}
