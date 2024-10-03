import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatUserCard extends StatefulWidget {
  const ChatUserCard({super.key});

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    // Getting screen width using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        InkWell(
          onTap: () {
            // Handle tap
          },
          child: Container(
            // Full width of the screen with no gap
            width: screenWidth,
            color: Colors.white, // Background color (if needed)
            child: ListTile(
              leading: CircleAvatar(child: Icon(CupertinoIcons.person)),
              title: Text('Demo User'),
              subtitle: Text('Hi how are you'),
              trailing: Text('12:00 AM', style: TextStyle(color: Colors.grey)),
            ),
          ),
        ),
        // Add a light grey divider after each tile
        Padding(
          padding: const EdgeInsets.only(
            left: 75,
          ), // Set padding on both sides
          child: Container(
            height: 1.0,
            color: Colors.grey.shade300, // Light grey line
          ),
        ),
      ],
    );
  }
}
