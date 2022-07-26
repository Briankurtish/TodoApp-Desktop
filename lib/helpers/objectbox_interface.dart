import 'package:objectbox/objectbox.dart';
import 'package:todo_desktop_app/objectbox.g.dart';

class ObjectBox {
  // Declare the store

  late final Store store;
  ObjectBox._create(this.store) {}

  static Future<ObjectBox> create() async {
    // Create the store
    final store = await openStore();
    return ObjectBox._create(store);
  }
}
