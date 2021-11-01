import 'dart:ui';

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  bool fontWeight=false;
  final Alignment alignment;
  final int maxLine;
  final double height;

  CustomText({
    this.height=2,
    this.maxLine=2,
    this.color=Colors.black,
    this.fontSize=16,
    this.text='',
    this.fontWeight=false,
    this.alignment=Alignment.topLeft

});
  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: alignment,
      child: Text('$text',style: TextStyle(
          fontSize: fontSize,
          fontWeight:fontWeight?FontWeight.bold:FontWeight.normal ,
          color: color
      ),
      ),
    ) ;
  }
}
