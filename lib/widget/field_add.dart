import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FieldAdd extends StatelessWidget {
  FieldAdd(
      {super.key,
      required this.controller,
      required this.hintText,
      this.maxLines});

  var controller = TextEditingController();
  var hintText;
  var maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
      ),
      maxLines: maxLines,
    );
  }
}
