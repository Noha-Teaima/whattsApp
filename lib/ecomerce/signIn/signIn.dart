import 'package:flutter/material.dart';
import 'package:task1/ecomerce/Categories.dart';
import 'package:task1/ecomerce/signIn/cubit/cubit/sign_in_cubit.dart';
import 'package:task1/ecomerce/signUp/cubit/cubit/sign_up_cubit.dart';
import 'package:task1/ecomerce/widget/customTextField.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../NoteApp/cube/cubit/note_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class signIn extends StatefulWidget {
  const signIn({super.key});

  @override
  State<signIn> createState() => _AnotherSignUpState();
}

class _AnotherSignUpState extends State<signIn> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool? check = false;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignInCubit>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 84, 174),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(100.0),
              child: Text(
                "Your Logo",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              // height: 545,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: Colors.white),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 60),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Create an account",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Sign up to continue",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          customTextField(
                              controller: _emailController,
                              name: "EMAIL",
                              validator: (value) {
                                if (value == null || value.length == 0) {
                                  return 'validators.requiredField';
                                }

                                if (value == null || !value.contains("@")) {
                                  return 'validators.invalidEmail';
                                } else
                                  check = true;
                              },
                              check: check),
                          SizedBox(
                            height: 10,
                          ),
                          customTextField(
                            controller: _passwordController,
                            name: "PASSWORD",
                            isPassword: true,
                          ),
                          BlocBuilder<SignInCubit, SignInState>(
                            builder: (context, state) {
                              if (state is SignInLoading) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return Container(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      cubit.SignInData(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                      );
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Categories()),
                                        (Route<dynamic> route) => false,
                                      );
                                    }
                                  },
                                  child: Text(AppLocalizations.of(context)!
                                      .get_Started),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                  ),
                                ),
                              );
                            },
                          ),
                          Row(
                            children: [
                              Text(
                                "Already have an account?",
                                style: TextStyle(color: Colors.grey),
                              ),
                              TextButton(
                                child: Text("Login"),
                                onPressed: () {},
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
