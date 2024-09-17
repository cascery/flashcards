import 'package:flutter/material.dart';
import 'rotatingImage.dart'; // Import the new widget

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFF4C4DB),
          style: BorderStyle.solid,
        ),
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RotatingImage(size: 140.0), // Use the new RotatingImage widget
          SizedBox(height: 10),
          Text(
            '  Julian  ', // Text to display
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontFamily: 'Ckhans',
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Color(0xFFF4C4DB),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.black),
            ),
            child: Text(
              '  log out  ', // Text to display
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Ckhans',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
