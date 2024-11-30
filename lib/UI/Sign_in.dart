import 'package:authentication_exam/Bloc/Sign_in/signin_bloc.dart';
import 'package:authentication_exam/Repository/Model_Class/Signin_model.dart';
import 'package:authentication_exam/UI/Home_page.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late SigninModel signin;
  final Email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var isobscure;
  bool ischecked = false;
  @override
  void initState() {
    isobscure = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Text('Sign In',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 35.sp,
                        fontWeight: FontWeight.w600,
                        height: 0.10,
                      )),
                  SizedBox(
                    height: 50.h,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: Email,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF262626))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF262626))),
                        labelText: 'Email',
                        labelStyle: GoogleFonts.poppins(
                          color: Color(0xFF7C7C7C),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          height: 0.10,
                        )),
                    validator: (email) {
                      if (email!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(email)) {
                        return 'Enter a valid email!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    controller: password,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF262626))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF262626)),
                            borderRadius: BorderRadius.circular(8.r)),
                        labelText: 'Enter password  ',
                        labelStyle: GoogleFonts.poppins(
                          color: Color(0xFF7C7C7C),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          height: 0.10,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isobscure = !isobscure;
                              });
                            },
                            icon: isobscure
                                ? Icon(
                                    BootstrapIcons.eye,
                                    color: Colors.black,
                                    size: 20.sp,
                                  )
                                : Icon(
                                    BootstrapIcons.eye_slash,
                                    color: Colors.black,
                                    size: 20.sp,
                                  ))),
                    obscureText: isobscure,
                    validator: (password) {
                      if (password!.isEmpty || password.length < 6) {
                        return 'Enter a valid password!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                  BlocListener<SigninBloc, SigninState>(
                    listener: (context, state) {
                      if (state is Signinblocloading) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        );
                      }
                      if (state is SigninblocError) {
                        Navigator.of(context).pop();
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Center(
                              child: Text(
                                'Something Wrong',
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          },
                        );
                      }
                      if (state is Signinblocloaded) {
                        signin =
                            BlocProvider.of<SigninBloc>(context).signinModel;
                        Navigator.of(context).pop();
                        Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) => HomePage(Email: signin.email.toString())),
                                          (Route<dynamic> route) => false);
                      }
                  
                    },
                    child: GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<SigninBloc>(context).add(
                              FetchsigninEvent(
                                  Email: Email.text, password: password.text));
                        }
                      },
                      child: Container(
                        height: 50.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Color(0xFF7E57C2)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Sign In',
                                style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    height: 0.10),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Icon(
                                BootstrapIcons.arrow_right,
                                color: Colors.white,
                                size: 20.sp,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
