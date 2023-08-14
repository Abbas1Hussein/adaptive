import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// Returns the adaptive value based on the current platform.
/// If no function is provided for the current platform, an exception is thrown.
T adaptiveValue<T>({
  required T Function() ios,
  required T Function() android,
  T Function()? macOS,
  T Function()? windows,
  T Function()? web,
  T Function()? fuchsia,
  T Function()? linux,
}) {
  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
      return android();
    case TargetPlatform.iOS:
      return ios();
    case TargetPlatform.windows:
      if (windows != null) return windows();
      throw _mustProvide<T>('windows');
    case TargetPlatform.macOS:
      if (macOS != null) return macOS();
      throw _mustProvide<T>('macOS');
    case TargetPlatform.linux:
      if (linux != null) return linux();
      throw _mustProvide<T>('linux');
    case TargetPlatform.fuchsia:
      if (fuchsia != null) return fuchsia();
      throw _mustProvide<T>('fuchsia');
    default:
      if (web != null) return web();
      throw _mustProvide<T>('web');
  }
}

Exception _mustProvide<T>(String platformName) {
  throw Exception(
    'You are running the app on $platformName platform without providing a function to return $T.\n'
    'Make sure to implement $platformName for proper functionality.',
  );
}

/// Returns the adaptive value based on the current platform.
/// If a builder function is provided for the current platform, it is invoked and returned.
class PlatformBuilder extends StatelessWidget {
  const PlatformBuilder({
    Key? key,
    required this.androidBuilder,
    required this.iosBuilder,
    this.windowsBuilder,
    this.macosBuilder,
    this.fuchsiaBuilder,
    this.linuxBuilder,
    this.webBuilder,
  }) : super(key: key);

  // mobiles
  final WidgetBuilder iosBuilder;
  final WidgetBuilder androidBuilder;
  final WidgetBuilder? fuchsiaBuilder;

  // desktops
  final WidgetBuilder? windowsBuilder;
  final WidgetBuilder? macosBuilder;
  final WidgetBuilder? linuxBuilder;

  // web
  final WidgetBuilder? webBuilder;

  @override
  Widget build(BuildContext context) {
    return adaptiveValue<Widget>(
      ios: () => iosBuilder(context),
      android: () => androidBuilder(context),
      fuchsia: fuchsiaBuilder != null ? () => fuchsiaBuilder!(context) : null,
      windows: windowsBuilder != null ? () => windowsBuilder!(context) : null,
      macOS: macosBuilder != null ? () => macosBuilder!(context) : null,
      linux: linuxBuilder != null ? () => linuxBuilder!(context) : null,
      web: webBuilder != null ? () => webBuilder!(context) : null,
    );
  }
}
