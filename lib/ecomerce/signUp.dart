// import 'package:flutter/material.dart';
// import 'package:task1/ecomerce/widget/customTextField.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({super.key});

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _phoneController = TextEditingController();

//   bool? obsecure = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 229, 228, 228),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 100.0, right: 100, left: 50),
//             child: Text(
//               "welcome to our grocery shop",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//           ),
//           SizedBox(
//             height: 50,
//           ),
//           Expanded(
//             child: Container(
//               margin: EdgeInsets.all(20),
//               color: Colors.white,
//               width: double.infinity,
//               child: Form(
//                 key: _formKey,
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                       top: 80, bottom: 80, left: 40, right: 40),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Name",
//                         style: TextStyle(color: Colors.grey.shade500),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       customTextField(
//                           controller: _emailController,
//                           validator: (value) {
//                             bool emailValid = RegExp(
//                                     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                                 .hasMatch(value ?? "");
//                             if (emailValid == false) {
//                               return "Email didn't match";
//                             }
//                             if (value!.isEmpty) {
//                               return "The Field is empty";
//                             } else if (value!.length < 11) {
//                               return "the numbers in less than 11 digits";
//                             }
//                             return null;
//                           }),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "phone",
//                         style: TextStyle(color: Colors.grey.shade500),
//                       ),
//                       customTextField(
//                         controller: _phoneController,
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "Password",
//                         style: TextStyle(color: Colors.grey.shade500),
//                       ),
//                       customTextField(
//                         controller: _passwordController,
//                         isPassword: obsecure,
//                       ),
//                       ElevatedButton(
//                           onPressed: () {
//                             if (_formKey.currentState!.validate()) {}
//                           },
//                           child: Text("signUp"))
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
