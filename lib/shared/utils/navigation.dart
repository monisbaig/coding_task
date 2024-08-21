import 'package:flutter/material.dart';

void pushAndRemove(context, page) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => page),
    (route) => false,
  );
}
