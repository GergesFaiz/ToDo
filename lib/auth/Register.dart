import 'package:flutter/material.dart';
import 'package:todo/Firebase/firebase_functions.dart';

class Register extends StatelessWidget {
  static const String routName = "Auth";

  Register({super.key});

  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextFormField(
            controller: userNameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              label: Text("UserName"),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: 12),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              label: Text("Email"),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: 12),
          TextFormField(
            controller: phoneController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              label: Text("Phone"),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: 12),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              label: Text("Password"),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: 12),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                FirebaseFunctions.createUserAccount(
                  userNameController.text,
                  emailController.text,
                  phoneController.text,
                  passwordController.text,
                );
              },
              child: Text(
                "Register",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
