import 'package:fluent_ui/fluent_ui.dart' hide Colors;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import 'src/app/ui/screens/home/home.dart';
import 'src/core/common/adaptive.dart';

Future<void> _configureMacosWindowUtils() async {
  const config = MacosWindowUtilsConfig();
  await config.apply();
}

Future<void> main() async {
  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.macOS) {
    await _configureMacosWindowUtils();
  }

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PlatformBuilder(
      androidBuilder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            colorSchemeSeed: Colors.cyan,
          ),
          themeMode: ThemeMode.dark,
          home: const HomeScreen(),
        );
      },
      iosBuilder: (context) {
        return const CupertinoApp(
          debugShowCheckedModeBanner: false,
          theme: CupertinoThemeData(brightness: Brightness.dark),
          home: HomeScreen(),
        );
      },
      windowsBuilder: (context) {
        return FluentApp(
          debugShowCheckedModeBanner: false,
          home: const HomeScreen(),
          darkTheme: FluentThemeData.dark(),
          themeMode: ThemeMode.dark,
          supportedLocales: const [Locale('en')],
        );
      },
      macosBuilder: (context) {
        return MacosApp(
          debugShowCheckedModeBanner: false,
          home: const HomeScreen(),
          theme: MacosThemeData.light(),
          darkTheme: MacosThemeData.dark(),
          themeMode: ThemeMode.dark,
        );
      },
      webBuilder: (context) => const MaterialApp(home: HomeScreen()),
      fuchsiaBuilder: (context) => const MaterialApp(home: HomeScreen()),
      linuxBuilder: (context) => const MaterialApp(home: HomeScreen()),
    );
  }
}
