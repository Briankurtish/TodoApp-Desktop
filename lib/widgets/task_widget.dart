import 'package:flutter/material.dart';
import 'package:todo_desktop_app/main.dart';
import 'package:todo_desktop_app/models/task_model.dart';
import 'package:todo_desktop_app/objectbox.g.dart';

class TaskWidget extends StatefulWidget {
  TaskWidget(this.task, {Key? key}) : super(key: key);
  TaskModel task;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  Box<TaskModel> taskBox = objectBox.store.box<TaskModel>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Checkbox(
            side: BorderSide(color: Colors.white),
            value: widget.task.task_done,
            onChanged: (value) {
              widget.task.task_done = value!;
              taskBox.put(widget.task);
            },
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  widget.task.task_title!,
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.task.task_description!,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                taskBox.remove(widget.task.id);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}
