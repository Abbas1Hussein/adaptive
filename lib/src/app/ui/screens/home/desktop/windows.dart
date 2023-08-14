import 'package:fluent_ui/fluent_ui.dart';

import '../components/items_home.dart';

class HomeWindows extends StatefulWidget {
  const HomeWindows({super.key});

  @override
  State<HomeWindows> createState() => _HomeWindowsState();
}

class _HomeWindowsState extends State<HomeWindows> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: const NavigationAppBar(automaticallyImplyLeading: false),
      pane: NavigationPane(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('adaptive'),
        ),
        selected: currentIndex,
        onChanged: (value) => setState(() => currentIndex = value),
        items: List.generate(
          homeTabs.length,
          (index) => PaneItem(
            title: Text(homeTabsName[index]),
            icon: Icon(homeTabsIcons[index]),
            body: homeTabs[index],
          ),
        ),
        footerItems: [
          PaneItem(
            title: const Text('Start Repository'),
            icon: const Icon(FluentIcons.favorite_star),
            body: const Center(
              child: Card(
                child: Text(
                  'Do not forget to give us a star in the repository.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
      transitionBuilder: (child, animation) => ScaleTransition(
        scale: animation.drive(CurveTween(curve: Curves.decelerate)),
        child: SafeArea(child: child),
      ),
    );
  }
}
