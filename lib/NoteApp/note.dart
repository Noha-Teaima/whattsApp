import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task1/NoteApp/HiveNotes.dart';

class NoteApp extends StatefulWidget {
  const NoteApp({super.key});

  @override
  State<NoteApp> createState() => _NoteAppState();
}

class _NoteAppState extends State<NoteApp> {
  final _textController = TextEditingController();
  List<String> Notes = [];
  @override
  void initState() {
    // HiveHelper.GetNotes();
    // print(HiveHelper.box2[0].toString() + "box22222222222222222222222222");
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 155, 51, 219),
        title: Text(
          "Note",
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          Icon(Icons.search),
          SizedBox(
            width: 10,
          ),
          InkWell(
              onTap: () {
                Notes = [];
                setState(() {});
              },
              child: Icon(CupertinoIcons.delete))
        ],
      ),
      body: ListView.builder(
        itemCount: Notes.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              _textController.text = Notes[index];
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Notes[index] = _textController.text;
                            _textController.text = "";
                            setState(() {});
                          },
                          child: Text(
                            "Ok",
                          ),
                          // c: Color.fromARGB(255, 155, 51, 219),
                        ),
                      ],
                      title: Text("Add Your Note"),
                      content: TextFormField(
                        controller: _textController,
                      ),

                      // content: Text("Please Enter The Correct Id"),
                    );
                  });
            },
            child: Stack(children: [
              Container(
                width: double.infinity,
                height: 60,
                child: Center(child: Text(HiveHelper.Notes[index])),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: index % 2 == 0
                      ? Color.fromARGB(255, 193, 135, 230)
                      : const Color.fromARGB(255, 250, 60, 60),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 10.0, left: 300, top: 10, bottom: 10),
                child: InkWell(
                  onTap: () {
                    Notes.removeAt(index);
                    setState(() {});
                  },
                  child: Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 155, 51, 219),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  actions: [
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Notes.add(_textController.text);
                        _textController.text = "";
                        setState(() {});
                      },
                      child: Text(
                        "Ok",
                      ),
                      backgroundColor: Color.fromARGB(255, 155, 51, 219),
                    ),
                  ],
                  title: Text("Add Your Note"),
                  content: TextFormField(
                    controller: _textController,
                  ),

                  // content: Text("Please Enter The Correct Id"),
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
