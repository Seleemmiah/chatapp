import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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

            //password textfield

            // login button

            //  register now
          ],
        ),
      ),
    );
  }
}
