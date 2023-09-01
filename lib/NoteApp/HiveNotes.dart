import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class HiveHelper {
  static String BoxName = "BoxName";
  static List<String> Notes = [];
  static var box = Hive.box(BoxName);

  static void addNote(String value) async {
    Notes.add(value);

    await box.put("message", Notes);
    // print(box.values.toString() + "    ollllllllllllll");
  }

  static void GetNotes() async {
    if (box.isNotEmpty) {
      Notes = box.get("message");
    }
  }

  static void removeItem(int index) async {
    Notes.removeAt(index);
    await box.put("message", Notes);
  }

  static void removeAll() async {
    Notes.clear();
    await box.put("message", Notes);
  }

  static void updateNotes(int index, String text) async {
    Notes[index] = text;
    await box.put("message", Notes);
  }
}
