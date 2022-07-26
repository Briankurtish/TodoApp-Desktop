import 'package:flutter/material.dart';
import 'package:todo_desktop_app/main.dart';
import 'package:todo_desktop_app/models/task_model.dart';
import 'package:todo_desktop_app/objectbox.g.dart';

class TaskEditorScreen extends StatefulWidget {
  const TaskEditorScreen({Key? key}) : super(key: key);

  @override
  State<TaskEditorScreen> createState() => _TaskEditorScreenState();
}

class _TaskEditorScreenState extends State<TaskEditorScreen> {
  Box<TaskModel> taskBox = objectBox.store.box<TaskModel>();

  TextEditingController _taskTitleController = TextEditingController();
  TextEditingController _taskDescriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        elevation: 0.0,
        title: const Text(
          "Create a new Task",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(24),
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Task Title",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: _taskTitleController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  fillColor: Colors.black12,
                  hintText: "Type your Task Title eg: Buy Some Milk",
                  hintStyle: TextStyle(color: Colors.white12),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "Task Description",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: _taskDescriptionController,
                minLines: 5,
                maxLines: 10,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  fillColor: Colors.black12,
                  hintText: "Type your Task description",
                  hintStyle: TextStyle(color: Colors.white12),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    onPressed: () {
                      // here we will save the task to the database

                      String taskTitle = _taskTitleController.text;
                      String taskDescription = _taskDescriptionController.text;
                      TaskModel model = TaskModel(
                          task_title: taskTitle,
                          task_description: taskDescription,
                          creation_date: DateTime.now());
                      taskBox.put(model);
                      Navigator.pop(context);
                    },
                    color: Colors.blueAccent,
                    child: Text("Save Task",
                        style: TextStyle(color: Colors.white)),
                    elevation: 0.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
