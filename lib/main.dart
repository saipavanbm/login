import 'package:flutter/material.dart';
import 'package:myapp/screens/login.dart';
import 'package:myapp/screens/radiobutton.dart';
import 'package:myapp/screens/registration.dart';
import 'package:myapp/screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/screens/registration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MystatefulWidget(),
    );
  }
}
