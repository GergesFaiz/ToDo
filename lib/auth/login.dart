import 'package:flutter/material.dart';
import 'package:todo/Firebase/firebase_functions.dart';

class Login extends StatelessWidget {
  static const String routName = "Auth";

   Login({super.key});
  var emailController =TextEditingController();
  var passwordController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
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
                FirebaseFunctions.login(emailController.text, passwordController.text);
              },
              child: Text("Login", style: TextStyle(fontSize: 25,color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
