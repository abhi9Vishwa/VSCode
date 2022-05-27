import 'package:flutter/material.dart';

Padding mainButtonMaker(String buttonName, Color buttonColor,
    String pressAction, BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 16.0),
    child: Material(
      color: buttonColor,
      borderRadius: BorderRadius.circular(30.0),
      elevation: 5.0,
      child: MaterialButton(
        onPressed: () {
          //Go to registration screen.
          Navigator.pushNamed(context, pressAction);
        },
        minWidth: 200.0,
        height: 42.0,
        child: Text(
          buttonName,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
