import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:todo_desktop_app/Screens/task_editor_screen.dart';
import 'package:todo_desktop_app/main.dart';
import 'package:todo_desktop_app/models/task_model.dart';
import 'package:todo_desktop_app/widgets/task_widget.dart';

class HonmeScreen extends StatefulWidget {
  const HonmeScreen({Key? key}) : super(key: key);

  @override
  State<HonmeScreen> createState() => _HonmeScreenState();
}

class _HonmeScreenState extends State<HonmeScreen> {
  Box<TaskModel>? taskBox;
  //okay lets create a stream to stream all the tasks in the database

  Stream<List<TaskModel>>? fetchAllTask;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    taskBox = objectBox.store.box<TaskModel>();
    print(taskBox!.count());
    setState(() {
      fetchAllTask = taskBox!
          .query()
          .watch(triggerImmediately: true)
          .map((event) => event.find());
    });
  }

  @override
  void dispose() {
    objectBox.store.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(18),
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "👋 Welcome Sir",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Today's Tasks",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TaskEditorScreen()));
                    },
                    icon: Icon(Icons.add),
                    label: Text("Add a new Task"),
                  ),
                ],
              ),
              Divider(
                color: Colors.white,
              ),
              // Building a stream builder to display all the tasks in the database
              StreamBuilder<List<TaskModel>>(
                stream: fetchAllTask,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasData) {
                      return SingleChildScrollView(
                        child: Column(
                            children: snapshot.data!
                                .map((e) => TaskWidget(e))
                                .toList()),
                      );
                    }
                  }
                  return Center();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
