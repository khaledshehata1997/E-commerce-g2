import 'package:ecommerce_g2/view/widgets/custom_button.dart';
import 'package:ecommerce_g2/view/widgets/custom_social_button.dart';
import 'package:ecommerce_g2/view/widgets/custom_text.dart';
import 'package:ecommerce_g2/view/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import 'sign_up.dart';

class SignIn extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                color: Colors.white,
                child: Form(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Welcome,',
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: true,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                            child: CustomText(
                              text: 'Sign Up',
                              fontSize: 20,
                              color: mainColor,
                              fontWeight: true,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomText(
                        text: 'Sign in to continue ',
                        color: Colors.grey,
                        fontWeight: false,
                      ),
                      SizedBox(
                        height: h * .07,
                      ),
                      CustomText(
                        text: 'Email',
                      ),
                      CustomTextForm(
                        controller: emailController,
                        hint: 'example@gmail.com',
                        onSave: (val) {
                          emailController.text = val;
                        },
                        validate: (val) {
                          if (val.isEmpty) {
                            return 'email is empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: h * .05,
                      ),
                      CustomText(
                        text: 'Password',
                      ) ,
                      CustomTextForm(
                        controller: passwordController,
                        validate: (val) {
                          if (val.isEmpty) {
                            return 'password is empty';
                          }
                        },
                        hint: '*******',
                        onSave: (val) {
                          passwordController.text = val;
                        },
                      ),
                      SizedBox(
                        height: h * .025,
                      ),
                      Row(
                        children: [Text('lfnelfefefo')],
                      ),
                      CustomText(
                        alignment: Alignment.topRight,
                        text: 'Forget password? ',
                        fontWeight: true,
                        fontSize: 19,
                      ),
                      SizedBox(
                        height: h * .025,
                      ),
                      CustomButton(
                        color: mainColor,
                        onPressed: () async {
                          try {
                            var user = await auth.signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text);
                            print(user);
                          } catch (e) {
                            Get.snackbar('Error', e.toString(),
                                snackPosition: SnackPosition.BOTTOM);
                          }
                        },
                        text: 'SIGN IN',
                      )
                    ],
                  ),
                ),
              ),
              CustomText(
                text: '-OR-',
                alignment: Alignment.center,
                fontSize: 20,
                fontWeight: true,
              ),
              SizedBox(
                height: 15,
              ),
              CustomSocialButton(
                onPressed: () {},
                text: 'sign in with facebook',
                link:
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Facebook_icon_2013.svg/1024px-Facebook_icon_2013.svg.png',
              ),
              SizedBox(
                height: 10,
              ),
              CustomSocialButton(
                onPressed: () {},
                text: 'sign in with google',
                link: 'https://image.pngaaa.com/686/3043686-middle.png',
              )
            ],
          ),
        ),
      ),
    );
  }
}
