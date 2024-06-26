import 'package:animeapp/features/navigation.dart';
import 'package:animeapp/utils/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anime Hub',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppPallete.primaryColor),
        useMaterial3: true,
        scaffoldBackgroundColor: AppPallete.backgroundColor,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: const NavigationExample(),
    );
  }
}
