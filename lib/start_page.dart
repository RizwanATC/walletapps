import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Make the status bar transparent
    ));

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Navigate to the next page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Splash()),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple[300], // Set the desired background color
          ),
          constraints: BoxConstraints.expand(),
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    child: Lottie.network(
                      'https://assets10.lottiefiles.com/packages/lf20_2MeppDAfjJ.json',
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Budget Calculation',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "This app will calculate your total net salary following the Malaysian government's KWSP calculation. It also provides an option to set a monthly budget.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
