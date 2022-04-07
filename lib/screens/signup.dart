import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Signupscreen extends StatefulWidget {
  Signupscreen({Key? key}) : super(key: key);

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  //form key
  final _formKey = GlobalKey<FormState>();

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  final _auth = FirebaseAuth.instance;

  //editing controller
  final TextEditingController namecontroller = new TextEditingController();
  final TextEditingController emailcontroller = new TextEditingController();
  final TextEditingController passwordcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //name
    final name = Container(
        height: 50,
        width: 312,
        color: Colors.white,
        child: TextFormField(
          autofocus: false,
          controller: namecontroller,
          keyboardType: TextInputType.emailAddress,
          //validator: () {},
          onSaved: (value) {
            emailcontroller.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: "Name",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ));

    //emailfield
    final emailField = Container(
        height: 50,
        width: 312,
        color: Colors.white,
        child: TextFormField(
          autofocus: false,
          controller: emailcontroller,
          keyboardType: TextInputType.emailAddress,
          //validator: () {},
          onSaved: (value) {
            emailcontroller.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: "Email Address",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ));
    //paswd
    final passwordField = Container(
        height: 50,
        width: 312,
        color: Colors.white,
        child: TextFormField(
          autofocus: false,
          controller: passwordcontroller,
          obscureText: true,
          onSaved: (value) {
            passwordcontroller.text = value!;
          },
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ));
    final loginbutton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 15,
        ),
        primary: Color(0xffFFC76C),
        onPrimary: Colors.black,
        minimumSize: Size(312, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
      ),
      onPressed: () {
        FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailcontroller.text, password: passwordcontroller.text)
            .then((res) => print('sign in'));
      },
      child: const Text(
        'Create an account',
      ),
    );
    return Scaffold(
      backgroundColor: Color(0xffF4F4F9),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          child: Image.asset('assets/logo.png'),
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        )),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Create an account',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: name,
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: emailField,
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: passwordField,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: loginbutton,
                    ),
                    Padding(
                        padding: EdgeInsets.all(15),
                        child: GestureDetector(
                          onTap: () {
                            print('Don\'t have a account?');
                          },
                          child: Text(
                            'Already have an account?',
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
