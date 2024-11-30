import 'package:authentication_exam/Repository/Model_Class/Signin_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  final String Email;
  const HomePage({super.key, required this.Email});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Welcome Screen',
          style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 25.sp,
              fontWeight: FontWeight.w500,
              height: 0.10),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              widget.Email.toString(),
              style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  height: 0.10),
            ),
          )
        ],
      ),
    );
  }
}
