import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class HiveHelper {
  static String BoxName = "BoxName";
  static List<String> Notes = [];
  static var box;
  static void addNote(String value) async {
    box = await Hive.openBox(BoxName);

    Notes.add(value);

    await box.put("message", Notes);
    print(box.values.toString() + "    ollllllllllllll");
  }

  static var box2;
  static void GetNotes() async {
    box2 = await Hive.openBox(BoxName);
    box2.get("message");

    print(box.get("message"));
  }
}
