import 'package:authentication_exam/Bloc/Sign_in/signin_bloc.dart';
import 'package:authentication_exam/Bloc/Sign_up/signup_bloc.dart';
import 'package:authentication_exam/UI/Sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 845),
        builder: (BuildContext context, Widget? child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => SignupBloc()),
              BlocProvider(create: (context) => SigninBloc()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: SignUp(),
            ),
          );
        });
  }
}
