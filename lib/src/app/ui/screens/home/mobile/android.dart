import '../components/items_home.dart';
import 'package:flutter/material.dart';

class HomeAndroid extends StatefulWidget {
  const HomeAndroid({super.key});

  @override
  State<HomeAndroid> createState() => _HomeAndroidState();
}

class _HomeAndroidState extends State<HomeAndroid> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homeTabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) => setState(() => currentIndex = value),
        unselectedItemColor: Colors.cyan,
        selectedItemColor: Colors.white,
        items: List.generate(
          homeTabs.length,
          (index) => BottomNavigationBarItem(
            icon: Icon(homeTabsIcons[index]),
            label: homeTabsName[index],
          ),
        ),
      ),
      floatingActionButton: currentIndex != 0 && currentIndex < 3
          ? FloatingActionButton.extended(
              onPressed: () {},
              label: Text('add ${currentIndex == 1 ? 'movie' : 'series'}'),
            )
          : null,
    );
  }
}
