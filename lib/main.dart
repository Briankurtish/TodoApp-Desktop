import 'package:flutter/material.dart';
import 'package:todo_desktop_app/Screens/home_Screen.dart';
import 'package:todo_desktop_app/helpers/objectbox_interface.dart';

late ObjectBox objectBox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.create();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HonmeScreen(),
    );
  }
}
