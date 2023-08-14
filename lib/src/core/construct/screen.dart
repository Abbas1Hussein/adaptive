import 'package:flutter/widgets.dart';

import '../common/adaptive.dart';

/// Abstract class for building Adaptive screens.
/// Extend this class to create screens that adapt to different platforms.
abstract class CoreAdaptiveScreen extends StatelessWidget {
  const CoreAdaptiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return adaptiveValue(
      ios: () => ios(context),
      android: () => android(context),
      fuchsia: () => _buildOrThrow(fuchsia, 'fuchsia', context),
      windows: () => _buildOrThrow(windows, 'windows', context),
      macOS: () => _buildOrThrow(mac, 'macOS', context),
      linux: () => _buildOrThrow(linux, 'linux', context),
      web: () => _buildOrThrow(web, 'web', context),
    );
  }

  /// Returns a widget or throws an exception if the platform-specific
  /// implementation is not provided.
  Widget _buildOrThrow(Widget? Function(BuildContext) builder, String platformName, BuildContext context) {
    final widget = builder(context);
    if (widget != null) return widget;
    throw _mustImplement(platformName);
  }

  /// Creates an exception indicating that the platform-specific implementation
  /// is missing for a certain platform.
  Exception _mustImplement(String platformName) {
    return Exception(
      'You are running the app on $platformName platform without implementing $platformName in $runtimeType.\n'
      'Make sure to provide a proper implementation for $platformName.',
    );
  }

  /// Widget for Android platform.
  Widget android(BuildContext context);

  /// Widget for iOS platform.
  Widget ios(BuildContext context);

  /// Widget for Windows platform (optional).
  Widget? windows(BuildContext context) => null;

  /// Widget for macOS platform (optional).
  Widget? mac(BuildContext context) => null;

  /// Widget for Fuchsia platform (optional).
  Widget? fuchsia(BuildContext context) => null;

  /// Widget for Linux platform (optional).
  Widget? linux(BuildContext context) => null;

  /// Widget for web (optional).
  Widget? web(BuildContext context) => null;
}
