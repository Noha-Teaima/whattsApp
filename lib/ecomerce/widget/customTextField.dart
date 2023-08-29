import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class customTextField extends StatefulWidget {
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool? isPassword;
  final String name;
  final bool? check;

  const customTextField(
      {super.key,
      this.validator,
      required this.controller,
      this.isPassword,
      required this.name,
      this.check});

  @override
  State<customTextField> createState() => _customTextFieldState();
}

class _customTextFieldState extends State<customTextField> {
  bool obsecure = true;
  @override
  Widget build(BuildContext context) {
    print(widget.check);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.name,
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            suffixIcon: widget.check == true
                ? Icon(
                    CupertinoIcons.check_mark_circled,
                    color: Colors.green,
                  )
                : widget.isPassword != null
                    ? InkWell(
                        onTap: () {
                          obsecure = !obsecure;
                          setState(() {});
                        },
                        child: Icon(obsecure
                            ? CupertinoIcons.eye_fill
                            : CupertinoIcons.eye_slash_fill),
                      )
                    : null,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Colors.grey.shade200), //<-- SEE HERE
            ),
          ),
          validator: widget.validator,
          obscureText: widget.isPassword != null ? obsecure : false,
        ),
      ],
    );
  }
}
