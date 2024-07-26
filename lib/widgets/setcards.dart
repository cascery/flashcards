import 'package:flutter/material.dart';
import '../widgets/groupWidget.dart';

class Setcards extends StatelessWidget {
  final List<Map<String, dynamic>> cardGroups;

  const Setcards({Key? key, required this.cardGroups}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cardGroups.length,
      itemBuilder: (context, index) {
        final cardGroup = cardGroups[index];
        return GroupWidget(
          imagePath: cardGroup['imagePath'],
          title: cardGroup['title'],
          subtitle: cardGroup['subtitle'],
          count: cardGroup['count'],
        );
      },
    );
  }
}
