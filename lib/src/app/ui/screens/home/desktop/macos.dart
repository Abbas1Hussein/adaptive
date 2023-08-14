import 'package:flutter/material.dart';

import '../components/items_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

class HomeMacos extends StatefulWidget {
  const HomeMacos({super.key});

  @override
  State<HomeMacos> createState() => _HomeMacosState();
}

class _HomeMacosState extends State<HomeMacos> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return MacosWindow(
      sidebar: Sidebar(
        minWidth: size.width * 0.2,
        maxWidth: size.width * 0.2,
        startWidth: size.width * 0.2,
        builder: (context, scrollController) => SidebarItems(
          currentIndex: currentIndex,
          onChanged: (value) {
            setState(() => currentIndex = value);
          },
          itemSize: SidebarItemSize.large,
          items: List.generate(
            homeTabs.length,
            (index) => SidebarItem(
              label: Text(homeTabsName[index]),
              leading: Icon(homeTabsIcons[index]),
            ),
          ),
        ),
      ),
      child: MacosScaffold(
        toolBar: const ToolBar(dividerColor: CupertinoColors.systemBackground),
        children: [
          ContentArea(
            builder: (context, scrollController) => SafeArea(
              child: homeTabs[currentIndex],
            ),
          ),
        ],
      ),
    );
  }
}
