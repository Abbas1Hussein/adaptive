import 'package:flutter/cupertino.dart';

import '../components/items_home.dart';

class HomeIOS extends StatefulWidget {
  const HomeIOS({super.key});

  @override
  State<HomeIOS> createState() => _HomeIOSState();
}

class _HomeIOSState extends State<HomeIOS> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        onTap: (value) => setState(() => currentIndex = value),
        currentIndex: currentIndex,
        items: List.generate(
          homeTabs.length,
          (index) => BottomNavigationBarItem(
            icon: Icon(homeTabsIcons[index]),
            label: homeTabsName[index],
          ),
        ),
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(),
          child: SafeArea(child: homeTabs[index]),
        );
      },
    );
  }
}
