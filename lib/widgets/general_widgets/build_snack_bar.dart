import 'package:flutter/material.dart';

SnackBar buildSnackBar(String content, bool status) {
  if (status) {
    return SnackBar(
      content: Text(
        content,
        style: TextStyle(color: Colors.white),
      ),
      duration: Duration(seconds: 2),
      backgroundColor: status ? Colors.green : Colors.red,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    );
  } else {
    return SnackBar(
        content: Text(
          content,
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)));
  }
}
