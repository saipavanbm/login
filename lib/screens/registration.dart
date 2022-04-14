import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController namecontroller = new TextEditingController();
  final TextEditingController emailcontroller = new TextEditingController();
  final TextEditingController phonecontroller = new TextEditingController();
  final TextEditingController addresscontroller = new TextEditingController();
  final TextEditingController emergencycontroller1 =
      new TextEditingController();
  final TextEditingController emergencycontroller2 =
      new TextEditingController();

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
    final phoneField = Container(
        height: 50,
        width: 312,
        color: Colors.white,
        child: TextFormField(
          autofocus: false,
          controller: phonecontroller,
          keyboardType: TextInputType.phone,
          //validator: () {},
          onSaved: (value) {
            emailcontroller.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: "Phone Number",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ));
    final addressField = Container(
        height: 50,
        width: 312,
        color: Colors.white,
        child: TextFormField(
          autofocus: false,
          controller: addresscontroller,
          keyboardType: TextInputType.streetAddress,
          //validator: () {},
          onSaved: (value) {
            emailcontroller.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: "Address",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ));
    final emergencyfield1 = Container(
        height: 50,
        width: 312,
        color: Colors.white,
        child: TextFormField(
          autofocus: false,
          controller: emergencycontroller1,
          keyboardType: TextInputType.phone,
          //validator: () {},
          onSaved: (value) {
            emailcontroller.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: "Emergency Contact 1",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ));
    final emergencyfield2 = Container(
        height: 50,
        width: 312,
        color: Colors.white,
        child: TextFormField(
          autofocus: false,
          controller: emergencycontroller2,
          keyboardType: TextInputType.phone,
          //validator: () {},
          onSaved: (value) {
            emailcontroller.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: "Emergency Contact 2",
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
      onPressed: () {},
      child: const Text(
        'Submit',
      ),
    );
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/profile_bg.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                          child: Text(
                            'A little more about you,\n          person_name',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            child: Image.asset('assets/bg.png'),
                          )),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: name,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: emailField,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: phoneField,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: addressField,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: emergencyfield1,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: emergencyfield2,
                      ),
                      loginbutton,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
