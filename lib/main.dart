import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'UI/Bloc/auth_cubit.dart';
import 'UI/Pages/Splashscreen UI/splashscreenUI.dart';
import 'package:rename_app/rename_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(
          134, 188, 66, 1), // Change the status bar color here
    ));

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BKIICT Student App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromRGBO(134, 188, 66, 1)),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
