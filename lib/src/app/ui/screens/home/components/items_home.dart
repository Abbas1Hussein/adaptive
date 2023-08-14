import 'package:adaptive/src/app/ui/screens/home/tabs/account.dart';
import 'package:flutter/material.dart';

import '../tabs/movies.dart';
import '../tabs/over_view.dart';
import '../tabs/series.dart';
import '../tabs/settings.dart';

const List<Widget> homeTabs = [
  OverViewTab(),
  MoviesTab(),
  SeriesTab(),
  AccountTab(),
  SettingsTab(),
];

const List<String> homeTabsName = [
  'overview',
  'movies',
  'series',
  'account',
  'setting'
];

const List<IconData> homeTabsIcons = [
  Icons.dashboard_rounded,
  Icons.movie,
  Icons.ondemand_video,
  Icons.account_circle_rounded,
  Icons.settings,
];
