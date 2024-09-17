import 'dart:ui';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 50),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _authenticate() {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email == 'julian@gmail.com' && password == '123') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpg', // Replace with your image asset
              fit: BoxFit.cover,
            ),
          
          ),

         Positioned(
            top: MediaQuery.of(context).size.height * 0.01, // Adjust as needed
            child: ClipOval(
              clipBehavior: Clip.none,
              child: Image.asset(
                'assets/images/cloud.png', // Replace with your image asset
                width: 100, // Adjusted to fit within the rotating border
                height: 100,
              ),
            ),
          ),

          



          RotationTransition(
            turns: _controller,
            child: CustomPaint(
              size: const Size(380, 380), // Adjust the size as needed
              painter: DashedBorderPainter(),
            ),
          ),
          Center(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "LOG IN",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Ckhans',
                        fontSize: 30,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(7),
                      margin: const EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4C4DB),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: const Color(0xFFF4C4DB)),
                      ),
                      child: IntrinsicWidth(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(minHeight: 10.0, minWidth: 140.0), // Minimum height
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: 'Email', // Placeholder text
                              hintStyle: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'Ckhans',
                              ), // Customize hint text style
                              fillColor: Colors.transparent,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                            ),
                            style: const TextStyle(color: Colors.black),
                            minLines: 1,
                            maxLines: 1, // Makes the TextField grow vertically
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 9),
                    Container(
                      padding: const EdgeInsets.all(7),
                      margin: const EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4C4DB),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: const Color(0xFFF4C4DB)),
                      ),
                      child: IntrinsicWidth(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(minHeight: 40.0, minWidth: 140.0), // Minimum height
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              hintText: 'Password', // Placeholder text
                              hintStyle: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'Ckhans',
                              ), // Customize hint text style
                              fillColor: Colors.transparent,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                            ),
                            style: const TextStyle(color: Colors.black),
                            obscureText: true,
                            minLines: 1,
                            maxLines: 1, // Makes the TextField grow vertically
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 9),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _authenticate();
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4C4DB),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.black),
                        ),
                        child: const Text(
                          '  Log in  ', // Text to display
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Ckhans',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 15;
    double dashSpace = 14;
    double radius = size.width / 2;

    var paint = Paint()
      ..color = const Color(0xFFF4C4DB)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    Path path = Path()
      ..addOval(Rect.fromCircle(center: Offset(radius, radius), radius: radius));

    Path dashPath = Path();
    double distance = 0.0;

    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashPath.addPath(pathMetric.extractPath(distance, distance + dashWidth), Offset.zero);
        distance += dashWidth + dashSpace;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
