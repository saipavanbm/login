import 'package:flutter/material.dart';

class MystatefulWidget extends StatefulWidget {
  const MystatefulWidget({Key? key}) : super(key: key);

  @override
  State<MystatefulWidget> createState() => _MystatefulWidgetState();
}

class _MystatefulWidgetState extends State<MystatefulWidget> {
  int value = 0;

  Widget CustomRadioButton(String text, int index) {
    String gender = text.toString();
    Color defaultcolor = Colors.pink;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          value = index;
        });
        print(defaultcolor);
        print(value);
      },
      child: Text('$gender'),
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 15),
        primary: defaultcolor,
        onPrimary: Colors.black,
        minimumSize: Size(40, 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CustomRadioButton("Male", 1),
        CustomRadioButton("Female", 2),
        CustomRadioButton("Other", 3)
      ],
    );
  }
}
