import 'package:flutter/widgets.dart';

import '../../../../core/construct/screen.dart';
import 'desktop/macos.dart';
import 'desktop/windows.dart';
import 'mobile/android.dart';
import 'mobile/ios.dart';

class HomeScreen extends CoreAdaptiveScreen {
  const HomeScreen({super.key});

  @override
  Widget android(BuildContext context) => const HomeAndroid();

  @override
  Widget ios(BuildContext context) => const HomeIOS();

  @override
  Widget? windows(BuildContext context) => const HomeWindows();

  @override
  Widget? mac(BuildContext context) => const HomeMacos();
}
