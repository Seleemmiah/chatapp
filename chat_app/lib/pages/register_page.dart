import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  // textfiel controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  // register method
  void register(BuildContext context) {
    // get auth service
    final _auth = AuthService();

    if (_passwordController.text == _confirmpasswordController.text) {
      try {
        _auth.signUpWithEmailPassword(
          _emailController.text,
          _passwordController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text(e.toString())),
        );
      }
    }
    // if  passwords dont match -> show error
    else {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: Text(
                "Passwords don't match!",
                style: TextStyle(fontSize: 20),
              ),
            ),
      );
    }
  }

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
            Text("Let's get you signed up!", style: TextStyle(fontSize: 16)),

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

            SizedBox(height: 10),

            // confirm password textfield
            MyTextfield(
              hinttext: 'Confirm Password',
              obscureText: true,
              controller: _confirmpasswordController,
            ),

            SizedBox(height: 25),

            // login button
            MyButton(text: 'Register', onTap: () => register(context)),

            SizedBox(height: 25),

            //  register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Aleready have an account? ',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Login now',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
