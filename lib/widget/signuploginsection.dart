import 'package:flutter/material.dart';

import '../pages/login.dart';

class SignupLoginSection {
  Widget buildLoginSection(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/googlelogo.png",
              height: 40,
            ),
            const SizedBox(
              width: 15,
            ),
            Image.asset(
              "assets/images/facebooklogo.png",
              height: 40,
            ),
            const SizedBox(
              width: 15,
            ),
            Image.asset(
              "assets/images/linkdinlogo.png",
              height: 40,
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "have an account?",
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 16,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ),
                    (Route<dynamic> route) => false);
              },
              child: const Text(
                " sign in",
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
