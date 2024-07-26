// lib/screens/home_screen/widgets/group_widget.dart

import 'package:flutter/material.dart';

class GroupWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final int count;

  const GroupWidget({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black),
        ),
        child: Row(
          children: [
            Image.asset(imagePath, width: 40, height: 40),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
            ),
            Text(count.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
