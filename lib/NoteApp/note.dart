import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/NoteApp/model/notesModel.dart';
import 'HiveNotes.dart';
import 'cube/cubit/note_cubit.dart';

class NoteApp extends StatefulWidget {
  const NoteApp({super.key});

  @override
  State<NoteApp> createState() => _NoteAppState();
}

class _NoteAppState extends State<NoteApp> {
  final _textController = TextEditingController();

  @override
  void initState() {
    // HiveHelper.GetNotes();

    // print(HiveHelper.box2[0].toString() + "box22222222222222222222222222");
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NoteCubit>();
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
                cubit.removeAll();
                setState(() {});
              },
              child: Icon(CupertinoIcons.delete))
        ],
      ),
      body: BlocBuilder<NoteCubit, NoteState>(
        builder: (context, state) {
          if (state is NoteLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return BlocBuilder<NoteCubit, NoteState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: HiveHelper.Notes.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: BlocBuilder<NoteCubit, NoteState>(
                    builder: (context, state) {
                      if (state is NoteLoadingItem &&
                          cubit.updateIndex == index) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return InkWell(
                        onTap: () {
                          _textController.text = HiveHelper.Notes[index];
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        if (_textController.text.isNotEmpty) {
                                          Navigator.of(context).pop();
                                          cubit.updateIndex = index;
                                          cubit.updateItem(
                                              index, _textController.text);
                                          _textController.text = "";
                                          setState(() {});
                                        }
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
                          BlocBuilder<NoteCubit, NoteState>(
                            builder: (context, state) {
                              return Container(
                                width: double.infinity,
                                height: 60,
                                child: Center(
                                    child: Text(HiveHelper.Notes[index])),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: index % 2 == 0
                                      ? Color.fromARGB(255, 193, 135, 230)
                                      : const Color.fromARGB(255, 250, 60, 60),
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 10.0, left: 300, top: 10, bottom: 10),
                            child: InkWell(
                              onTap: () {
                                cubit.removeItem(index);
                                setState(() {});
                              },
                              child: Icon(
                                Icons.delete_forever_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ]),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
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
                        cubit.addNotes(_textController.text);
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
