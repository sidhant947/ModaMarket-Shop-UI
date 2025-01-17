import 'package:flutter/material.dart';
import 'package:moda/constant.dart';
import 'package:moda/screens/homescreen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: PageView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Center(
                      child: SizedBox(
                    height: 500,
                    child: Image.network(
                      loginImages[index],
                      fit: BoxFit.cover,
                    ),
                  ));
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Personalized Based On Where You Are",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Location services enhance accuracy, personalize your experience, and show local trends.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(40)),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Get Started",
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(Icons.arrow_forward)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
