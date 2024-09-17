import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
class AddDream extends StatefulWidget {
  const AddDream({super.key});

  @override
  State<AddDream> createState() => _AddDreamState();
}

class _AddDreamState extends State<AddDream> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  DateTime? _selectedDate;
 void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // AppBar and content
          Column(
            children: [
              // Custom AppBar with a transparent background
              Container(
                margin: const EdgeInsets.all(20.0),
                padding: const EdgeInsets.all(1.0),
                height: kToolbarHeight,
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Text(
                    'Add a dream!',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Ckhans',
                      fontFamilyFallback: ['Ckhans2'],
                      color: Color(0xFFF4C4DB),
                    ),
                  ),
                ),
              ),
              // Content
              Expanded(
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            color: Color(0xFF483E71),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Color(0xFFF4C4DB)),
                          ),
                          child: IntrinsicWidth(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(minHeight: 60.0), // Minimum height
                              child: TextField(
                                controller: _controller2,
                                decoration: InputDecoration(
                                  hintText: 'Dream title', // Placeholder text
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Ckhans',
                                  ), // Customize hint text style
                                  fillColor: Colors.transparent,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                ),
                                style: TextStyle(color: Colors.white),
                                minLines: 1,
                                maxLines: null, // Makes the TextField grow vertically
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Color(0xFF483E71),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Color(0xFFF4C4DB)),
                          ),
                          child: IntrinsicWidth(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(minHeight: 60.0), // Minimum height
                              child: TextField(
                                controller: _controller,
                                decoration: InputDecoration(
                                  hintText: 'Dream Date', // Placeholder text
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Ckhans',
                                  ), // Customize hint text style
                                  fillColor: Colors.transparent,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                ),
                                style: TextStyle(color: Colors.white),
                                readOnly: true, // Prevents direct text input
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101),
                                  );

                                  if (pickedDate != null) {
                                    setState(() {
                                      _selectedDate = pickedDate;
                                      _controller.text = DateFormat('dd-MM-yyyy').format(_selectedDate!);
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            color: Color(0xFF483E71),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Color(0xFFF4C4DB)),
                          ),
                         
                            child: ConstrainedBox(
                              constraints: BoxConstraints(minHeight: 60.0), // Minimum height
                              child: TextField(
                                controller: _controller3,
                                minLines: 5,
                                maxLines: null,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: 'tell us your dream!', // Placeholder text
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Ckhans',
                                  ), // Customize hint text style
                                  fillColor: Colors.transparent,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                ),
                                style: TextStyle(color: Colors.white),
                                // Makes the TextField grow vertically
                              ),
                            ),
                          ),



                          GestureDetector(
  onTap: () {
 _showToast("Dream submitted!");  },
                   child:         Container(
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            color: Color(0xFFF4C4DB),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.black),
                          ),
                         
                            // Minimum height
                              child: Text(
  '  Submit Dream!  ', // Text to display
  textAlign: TextAlign.center,
  style: TextStyle(
    color: Colors.black,
    fontFamily: 'Ckhans',
  ),
)

                            )),
                         
                       
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
