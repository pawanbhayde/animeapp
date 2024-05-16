import 'package:animeapp/features/homepage.dart';
import 'package:animeapp/features/newrelease.dart';
import 'package:animeapp/features/searchpage.dart';
import 'package:animeapp/utils/colors.dart';
import 'package:flutter/material.dart';

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    Theme.of(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppPallete.backgroundColor,
        selectedItemColor: AppPallete.primaryColor,
        currentIndex: currentPageIndex,
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'New Releases',
          ),
        ],
      ),
      body: <Widget>[
        const HomePage(),
        SearchPage(),
        const NewRelease(),
      ][currentPageIndex],
    );
  }
}
