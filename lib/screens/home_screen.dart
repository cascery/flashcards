import 'dart:ui';
import 'package:flashcardsapp/widgets/rotatingImage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'add_dream.dart';
import '../widgets/groupwidget.dart';
import '../widgets/Profile.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dreamEntries = [
      DreamEntry(
        title: 'Flying Over Mountains',
        subtitle: 'A vivid dream of flying over snowy mountains.',
        date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
      ),
      DreamEntry(
        title: 'Talking Animals',
        subtitle: 'Animals were talking and guiding me through a forest.',
        date: DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: 1))),
      ),
      DreamEntry(
        title: 'Underwater Adventure',
        subtitle: 'Exploring an underwater city with mermaids.',
        date: DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: 2))),
      ),
       DreamEntry(
        title: 'the cat dream',
        subtitle: 'cats tried attacking me wtf.',
        date: DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: 2))),
      ),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        toolbarHeight: 80,
        
        title: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'HELLO JULIAN!',
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'Ckhans',
                    fontFamilyFallback: ['Ckhans2'],
                    color: Color(0xFFF4C4DB),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Stack(
                        children: [
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          Center(
                            child: Dialog(
                              backgroundColor: Colors.transparent,
                              child: Profile(),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: RotatingImage(size: 45.0),
              ),
            ],
          ),
        ),
        centerTitle: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: dreamEntries.length,
            itemBuilder: (context, index) {
              return GroupWidget(
                title: dreamEntries[index].title,
                subtitle: dreamEntries[index].subtitle,
                date: dreamEntries[index].date,
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddDream()),
          );
        },
        child: Image.asset(
          'assets/images/addbutton.png',
          width: 200.0,
          height: 200.0,
        ),
      ),
    );
  }
}

class DreamEntry {
  final String title;
  final String subtitle;
  final String date;

  DreamEntry({
    required this.title,
    required this.subtitle,
    required this.date,
  });
}
