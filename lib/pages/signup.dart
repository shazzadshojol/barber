import 'package:barber_booking/pages/home.dart';
import 'package:barber_booking/pages/login.dart';
import 'package:barber_booking/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? name, mail, password;
  TextEditingController fullname_editor_controller =
      new TextEditingController();
  TextEditingController email_editor_controller = new TextEditingController();
  TextEditingController password_editor_controller =
      new TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(color: Colors.black),
              child: const Text(
                "Create your\nAccount",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.white60,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(20),
                height: screen.height * 0.75 -
                    MediaQuery.of(context).viewInsets.bottom,
                width: screen.width,
                decoration: const BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildSignupForm(),
                      InkWell(
                          onTap: () {
                           if(_formkey.currentState!.validate()){
                             setState(() {
                               mail=email_editor_controller.text;
                               name=fullname_editor_controller.text;
                               password=password_editor_controller.text;
                             });
                           }
                           registration();
                          },
                          child: CustomButton(
                              screen: screen, button_text: "SIGN UP")),
                      const SizedBox(
                        height: 30,
                      ),
                      buildLoginSection(context)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSignupForm() {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            style: const TextStyle(color: Colors.white),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please Enter Your Full-Name";
              }
              return null;
            },
            controller: fullname_editor_controller,
            decoration: const InputDecoration(
              hintText: "Enter Your full-name",
              labelText: "Name",
              prefixIcon: Icon(Icons.person),

            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            style: const TextStyle(color: Colors.white),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please Enter Valid E-mail";
              }
              return null;
            },
            controller: email_editor_controller,
            decoration: const InputDecoration(
              hintText: "yourname@email.com",
              labelText: "Email",
              prefixIcon: Icon(Icons.email),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            style: const TextStyle(color: Colors.white),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "password must be 6 digit or upper";
              }
              return null;
            },
            controller: password_editor_controller,
            decoration: const InputDecoration(
                hintText: "Create your password",
                labelText: "password",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.remove_red_eye)),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

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

  registration() async {
    if (password != null && name != null && mail != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: mail!, password: password!);
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
        ;
      }
    }
  }
}
