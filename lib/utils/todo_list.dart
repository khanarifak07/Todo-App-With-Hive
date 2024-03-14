import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  final String taskName;
  final Function(bool?)? onChanged;
  final bool isTodoCompleted;
  final Function(BuildContext)? deleteTask;
  const TodoList(
      {super.key,
      required this.taskName,
      required this.isTodoCompleted,
      required this.onChanged,
      required this.deleteTask});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                value: isTodoCompleted,
                onChanged: onChanged,
              ),
              Text(
                taskName,
                style: TextStyle(
                  decoration: isTodoCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
