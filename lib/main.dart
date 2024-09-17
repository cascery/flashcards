import 'package:flutter/material.dart';
import 'screens/loginscreen.dart';
import 'screens/SplashScreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'LucidLog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(
            fontFamily: 'Ckhans',
            fontSize: 20,
            color: Color.fromARGB(255, 249, 247, 248),
          ),
          centerTitle: true,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'Ckhans',
            fontFamilyFallback: ['Ckhans2'],
            fontSize: 14,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Ckhans',
            fontFamilyFallback: ['Ckhans2'],
            fontSize: 14,
            color: Colors.white,
          ),
          titleLarge: TextStyle(
            fontFamily: 'Ckhans',
            fontFamilyFallback: ['Ckhans2'],
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      home: SplashScreen(),
    );
  }
}
