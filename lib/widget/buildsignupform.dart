import 'package:flutter/material.dart';

class BuildSignupForm {
  Widget buildSignupForm(
      GlobalKey formkey,
      TextEditingController fullnameEditorController,
      TextEditingController emailEditorController,
      TextEditingController passwordEditorController) {
    return Form(
      key: formkey,
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
            controller: fullnameEditorController,
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
            controller: emailEditorController,
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
            controller: passwordEditorController,
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
}
