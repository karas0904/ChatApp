import 'package:flutter/material.dart';

class EmailPage extends StatelessWidget {
  const EmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize global MediaQuery object
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Enter your Email ID"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Enter your Email ID",
                style: TextStyle(fontSize: 24.0),
              ),
              const SizedBox(height: 20.0),
              const Text(
                "ChitChat would need your email to verify",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 40.0),
              ElevatedButton.icon(
                onPressed: () {
                  // Add Google login logic here
                },
                icon: Padding(
                  padding: const EdgeInsets.only(
                      right: 16.0), // Add space between icon and text
                  child: Image.asset(
                    'assets/images/google.png', // Ensure the Google logo image is added to your assets folder
                    height: mediaQuery.size.height *
                        0.03, // Adjust logo size based on screen size
                  ),
                ),
                label: const Text(
                  "Login with Google",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Google button color
                  padding: const EdgeInsets.symmetric(
                      horizontal: 80.0, vertical: 10.0), // Long button
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // Rounded corners
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
