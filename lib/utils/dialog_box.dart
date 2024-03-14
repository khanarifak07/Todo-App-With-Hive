import 'package:flutter/material.dart';
import 'package:todo_app/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onAdd;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onAdd,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 130,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //save button
                MyButton(name: "Add", ontap: onAdd),
                MyButton(name: "Cancel", ontap: onCancel)

                //cancel button
              ],
            )
          ],
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.yellow[400],
    );
  }
}
