import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class HiveHelper {
  static String BoxName = "BoxName";
  static List<String> Notes = [];

  static void addNote(value) async {
    var box = await Hive.openBox(BoxName);

    Notes.add(value);

    await box.put("message", Notes);
  }

  static void GetNotes() async {
    var box = await Hive.openBox(BoxName);
    box.get("message");
  }
}
