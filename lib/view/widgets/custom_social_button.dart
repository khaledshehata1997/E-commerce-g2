
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomSocialButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final String link;

  CustomSocialButton({
    this.text='',
     required this.onPressed,
    this.link=''
});
  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            color: Colors.grey
          )
        ]

      ),
      child: TextButton(
          onPressed: (){
            onPressed();
          },
          style: TextButton.styleFrom(
            primary: Colors.white,
            padding: EdgeInsets.all(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // SizedBox(width: 20,),
              Image.network('$link',
                width: 50,
                height: 35,
              ),
              CustomText(
                text: '$text',
                alignment: Alignment.center,
              ),
              SizedBox(width: 25,)
              // CustomText(
              //   text: '1',
              //   alignment: Alignment.center,
              //   color: Colors.white,
              // ),
            ],
          )),
    );
  }
}
