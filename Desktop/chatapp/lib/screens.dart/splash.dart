import 'package:chapapp/screens.dart/Auth/login.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (_) => const LoginPage()), // Navigate to HomeScreen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Replace Lottie animation with the chat icon (use the same icon as in the LoginPage)
            Icon(
              Icons.chat_bubble_outline,
              size: 100,
              color: Colors.blue,
            ),
            const SizedBox(height: 20), // Space between logo and text
            const Text(
              'ChitChat', // Display "ChitChat"
              style: TextStyle(
                color: Color(0xFF4E92A8), // Same color as the original text
                fontSize: 30,
                fontWeight: FontWeight.w900,
                fontFamily: 'Montserrat', // Keep the font consistent
              ),
            ),
          ],
        ),
      ),
    );
  }
}
