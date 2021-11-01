
import 'package:ecommerce_g2/view/widgets/custom_button.dart';
import 'package:ecommerce_g2/view/widgets/custom_text.dart';
import 'package:ecommerce_g2/view/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class SignUp extends StatelessWidget {
FirebaseAuth auth=FirebaseAuth.instance;
TextEditingController emailController =TextEditingController();
TextEditingController passwordController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
                  child: Column(
                      children: [
                        SizedBox(height: 40,),
                        Container(

                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.all(20),
                          color: Colors.white,
                          child: Column(
                            children: [
                              CustomText(
                                text: 'Sign Up',
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: true,
                              ),

                              SizedBox(height: h*.1,),
                              CustomText(
                                text: 'Name',
                              ),
                              CustomTextForm(
                                hint: 'Khaled sallam',
                                onSave: (val){
                                },
                                validate: (val){
                                  if(val==null){
                                    return 'name is empty';
                                  }
                                },

                              ),
                              SizedBox(height: h*.05,),
                              CustomText(
                                text: 'Email',
                              ),
                              CustomTextForm(
                                controller:emailController ,
                                hint: 'example@gmail.com',
                                onSave: (val) {
                                  emailController.text=val;
                                },
                                validate: (val) {
                                  if (val == null) {
                                    return 'email is empty';
                                  }

                                },
                              ),
                              SizedBox(
                                height: h * .05,
                              ),
                              CustomText(
                                text: 'Password',
                              ),
                              CustomTextForm(
                                controller: passwordController,
                                hint: '*******',
                                onSave: (val) {
                                  passwordController.text=val;
                                },
                                validate: (val){
                                  if(val==null){
                                    return 'password is empty';
                                  }
                                },
                              ),
                              SizedBox(height: h*.025,),

                              SizedBox(height: h*.025,),
                              CustomButton(
                                onPressed: () {
                                 auth.createUserWithEmailAndPassword(
                                     email: emailController.text,
                                     password: passwordController.text);
                                },

                                text: 'SIGN Up',
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

            ),

    );
  }
}