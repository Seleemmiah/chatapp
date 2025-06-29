import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  // textfiel controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  // login method
  void login() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(Icons.message, size: 50),

            SizedBox(height: 40),

            // welcome back message
            Text(
              "Welcome back, you've been missed!",
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 40),

            // email textfield
            MyTextfield(
              hinttext: 'Email',
              obscureText: false,
              controller: _emailController,
            ),

            SizedBox(height: 10),

            // password textfield
            MyTextfield(
              hinttext: 'Password',
              obscureText: true,
              controller: _passwordController,
            ),

            SizedBox(height: 25),

            // login button
            MyButton(text: 'Login', onTap: login),

            SizedBox(height: 25),

            //  register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member? ',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text(
                  'Register now',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
