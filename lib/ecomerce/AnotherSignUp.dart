import 'package:flutter/material.dart';
import 'package:task1/ecomerce/widget/customTextField.dart';

class AnotherSignUp extends StatefulWidget {
  const AnotherSignUp({super.key});

  @override
  State<AnotherSignUp> createState() => _AnotherSignUpState();
}

class _AnotherSignUpState extends State<AnotherSignUp> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool? check = false;

  @override
  Widget build(BuildContext context) {
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
                            height: 15,
                          ),
                          customTextField(
                            controller: _nameController,
                            name: "NAME",
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
                          Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {}
                              },
                              child: Text("Get Started"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                            ),
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
