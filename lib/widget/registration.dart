import 'package:barber_booking/services/shared_preference.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import '../pages/home.dart';
import '../services/database.dart';

class Registration{
  registration(context,password,name,mail) async {
    if (password != null && name != null && mail != null) {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: mail!, password: password!);
        String id=randomAlphaNumeric(10);


        await SharedPreferenceHelper().saveUserName(name);
        await SharedPreferenceHelper().saveUserEmail(mail);
        await SharedPreferenceHelper().saveUserImage("");
        await SharedPreferenceHelper().saveUserId(id);


        Map<String, dynamic> userInfoMap={
          "Name":name,
          "Email":mail,
          "Id": id,
          "Image": ""
        };
        await DatabaseMethod().addUserDetails(userInfoMap, id);


        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Registered SUccessfully",
              style: TextStyle(fontSize: 24),
            ),
          ),
        );
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
              (route) => false,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == "weak-password") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Password is too weak",
                style: TextStyle(fontSize: 24),
              ),
            ),
          );
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Account already exists",
                style: TextStyle(fontSize: 24),
              ),
            ),
          );
        }
      }
    }
  }
}