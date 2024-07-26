import 'package:flutter/material.dart';
import '../widgets/setcards.dart'; // Update the import to match the file name

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample data for demonstration purposes
    final cardGroups = [
      {
        'imagePath': '.../assets/images/biology.png',
        'title': 'Biology',
        'subtitle': 'This is a lil body lol',
        'count': 30,
      },
      {
        'imagePath': 'assets/images/science.png',
        'title': 'Science of Whatever',
        'subtitle': 'This is a lil body lol',
        'count': 10,
      },
      {
        'imagePath': 'assets/images/physics.png',
        'title': 'Balls',
        'subtitle': 'This is a lil body lol',
        'count': 2,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Card Groups'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Setcards(cardGroups: cardGroups), // Corrected widget name
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
