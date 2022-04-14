import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  //form key
  final _formKey = GlobalKey<FormState>();
  String _error = '';

  //editing controller
  final TextEditingController emailcontroller = new TextEditingController();
  final TextEditingController passwordcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        textStyle: const TextStyle(fontSize: 15),
        primary: Color(0xffFFC76C),
        onPrimary: Colors.black,
        minimumSize: Size(312, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
      ),
      onPressed: () async {
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailcontroller.text, password: passwordcontroller.text);
        } on FirebaseAuthException catch (e) {
          print('Failed with error code: ${e.code}');
          setState(() {
            _error = e.message.toString();
          });
        }
      },
      child: const Text(
        'Login now',
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
                          margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                        )),
                    Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'Login to your account',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: emailField,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: passwordField,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '$_error',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  print('Forgot Password!');
                                },
                                child: Text(
                                  'Forget Password?',
                                  textAlign: TextAlign.end,
                                ),
                              )),
                        ],
                      ),
                    ),
                    loginbutton,
                    Padding(
                        padding: EdgeInsets.all(15),
                        child: GestureDetector(
                          onTap: () {
                            print('Don\'t have a account?');
                          },
                          child: Text(
                            'Don\'t have a account?',
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
