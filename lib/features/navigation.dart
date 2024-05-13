import 'package:animeapp/features/homepage.dart';
import 'package:animeapp/utils/colors.dart';
import 'package:flutter/material.dart';

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        backgroundColor: AppPallete.backgroundColor,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'New Releases',
          ),
          NavigationDestination(
            icon: Icon(Icons.list_alt_outlined),
            label: 'My List',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        const HomePage(),

        /// Notifications page
        const HomePage(),

        /// Messages page
        const HomePage(),

        ///Favorites page
        const HomePage(),
      ][currentPageIndex],
    );
  }
}