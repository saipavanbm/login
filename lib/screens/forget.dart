import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class forget extends StatefulWidget {
  const forget({Key? key}) : super(key: key);

  @override
  State<forget> createState() => _forgetState();
}

class _forgetState extends State<forget> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailcontroller = new TextEditingController();
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
            .sendPasswordResetEmail(email: emailcontroller.text);
      },
      child: const Text(
        'Submit',
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xffF4F4F9),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Form(
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
                          'Forgot your passsword?',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: emailField,
                    ),
                    loginbutton,
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
