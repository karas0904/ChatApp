import 'dart:developer';

import 'package:chapapp/screens.dart/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  @override
  _EmailPageState createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  bool _isSigningIn = false; // Add a flag to track signing-in status

  // Method to handle Google sign-in button click
  _handleGoogleButtonClick() async {
    setState(() {
      _isSigningIn = true; // Disable the button while signing in
    });

    try {
      // Attempt to sign in with Google
      UserCredential user = await _signInWithGoogle();

      if (user.user != null) {
        log('\nUser: ${user.user}');
        log('\nUser Additional Info: ${user.additionalUserInfo}');

        // Navigate to the home screen if sign-in is successful
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HoneScreen()));
      }
    } catch (e) {
      // Handle any errors (like user canceling the sign-in)
      log('Google Sign-In Error: $e');
    } finally {
      // Re-enable the button after the sign-in process
      setState(() {
        _isSigningIn = false;
      });
    }
  }

  // Google Sign-In logic
  Future<UserCredential> _signInWithGoogle() async {
    try {
      // Trigger the Google sign-in flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // If the user cancels the sign-in, throw an exception
      if (googleUser == null) {
        throw FirebaseAuthException(
            code: 'ERROR_ABORTED_BY_USER', message: 'Sign in aborted by user');
      }

      // Get authentication details from Google
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Check for accessToken or idToken
      if (googleAuth.accessToken == null && googleAuth.idToken == null) {
        throw FirebaseAuthException(
            code: 'ERROR_MISSING_GOOGLE_AUTH_TOKENS',
            message: 'Missing Google Auth Tokens');
      }

      // Create a new credential using the tokens
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with Firebase
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      // Print any errors during the sign-in process
      print('Google Sign-In Error: $e');
      rethrow;
    }
  }

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
                onPressed: _isSigningIn
                    ? null
                    : () {
                        _handleGoogleButtonClick();
                      }, // Disable the button if already signing in
                icon: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Image.asset(
                    'assets/images/google.png',
                    height: mediaQuery.size.height * 0.03,
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
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 80.0, vertical: 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              // Add a loading indicator while signing in
              if (_isSigningIn)
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
