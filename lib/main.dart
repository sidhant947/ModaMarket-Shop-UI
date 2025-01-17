import 'package:flutter/material.dart';
import 'package:moda/constant.dart';
import 'package:moda/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'services/provider_helper.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moda Market',
      theme: ThemeData(
        fontFamily: "Lufga",
        bottomAppBarTheme: BottomAppBarTheme(color: blackColor),
      ),
      debugShowCheckedModeBanner: false,
      home: Consumer<AppProvider>(
        builder: (context, appProvider, child) {
          return LogInScreen();
        },
      ),
    );
  }
}
