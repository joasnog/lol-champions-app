import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app/pages/champions_overview_page.dart';
import 'app/utils/colors_utils.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lol Champions',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        textTheme: const TextTheme(
          headline6: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.gold,
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const ChampionsOverviewPage(),
    );
  }
}
