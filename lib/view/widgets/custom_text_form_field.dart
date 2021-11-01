import 'dart:ui';

import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String hint;
   var controller;
  final Function validate;
  final Function onSave;

  CustomTextForm({
    this.hint='',
    this.controller,
 required this.validate(val),
     required this.onSave(val),
});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (val1){
        validate(val1);
      },
      onSaved:(val2){
        onSave(val2);
      },
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
          filled: true,
          fillColor: Colors.white
      ),
    );
  }
}
