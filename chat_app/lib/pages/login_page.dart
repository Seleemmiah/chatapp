import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  // textfield controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  // login method
  void login(BuildContext context) async {
    // auth service
    final authService = AuthService();

    // try login
    try {
      //  get text from email and password controllers
      await authService.signInWithEmailAndPassword(
        _emailController.text,
        _passwordController.text,
      );
    } 
      // handle error
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
          ),
      );
      // print("Login failed: $e");
      // You can show a snackbar or dialog to inform the user about the error
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
            MyButton(text: 'Login', onTap: () => login(context)),

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
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Register now',
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
