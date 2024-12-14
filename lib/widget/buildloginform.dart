import 'package:flutter/material.dart';

class BuildLoginForm{
  Widget buildLoginForm(GlobalKey formkey,emailEditorController,passwordEditorController) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please Enter Valid E-mail";
              }
              return null;
            },
            controller: emailEditorController,
            style: const TextStyle(color: Colors.white),
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Create a password";
              }
              return null;
            },
            controller: passwordEditorController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                hintText: "Enter your password",
                labelText: "password",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.remove_red_eye)),
          ),
        ],
      ),
    );
  }
}