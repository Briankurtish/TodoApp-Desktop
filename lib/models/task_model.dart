import 'package:objectbox/objectbox.dart';

@Entity()
class TaskModel {
  int id = 0;
  String? task_title;
  String? task_description;
  bool task_done = false;
  DateTime? creation_date;

  TaskModel({this.task_title, this.task_description, this.creation_date});
}
