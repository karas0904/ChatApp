import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'email_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.chat_bubble_outline,
              size: 100.0,
              color: Colors.blue,
            ),
            const SizedBox(height: 20.0),
            const Text(
              "Welcome to ChitChat",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              "Press the button to agree to the terms and conditions",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Same color as the icon
                padding: const EdgeInsets.symmetric(
                    horizontal: 150.0, vertical: 15.0), // Makes the button long
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
                elevation: 5, // Add some shadow effect
              ),
              onPressed: () {
                // Navigate to EmailPage when button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EmailPage()),
                );
              },
              child: const Text(
                "Agree",
                style: TextStyle(
                  color: Colors.white, // White text
                  fontWeight: FontWeight.bold, // Bold text
                  fontSize: 16.0, // Font size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
