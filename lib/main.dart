import 'package:barber_booking/pages/home.dart';
import 'package:barber_booking/pages/login.dart';
import 'package:barber_booking/pages/onboarding.dart';
import 'package:barber_booking/pages/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          filled:  true,
          fillColor: Colors.black,
          hintStyle: const TextStyle(
            color: Colors.white60
          ),
          labelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.deepOrange, // Border color when focused
              width: 2.0,
            ),
          ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.white60, // Default border color
                width: 1.5,
              ),
            )

        ),
      ),
      home: const Onboarding(),
    );
  }
}


