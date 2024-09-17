import 'package:flutter/material.dart';
import 'loginscreen.dart'; // Import your login screen here

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Navigate to the LoginScreen after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          'assets/images/lucidlog.png', // Replace with your splash screen logo
          width: 300, // Adjust size as needed
          height: 300,
        ),
      ),
    );
  }
}
