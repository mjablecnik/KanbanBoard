import 'package:kanban_board_design/theme/dark_theme.dart';
import 'package:kanban_board_design/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:vader_design/vader_design.dart';

class ExampleTheme extends VaderTheme {
  @override
  Map<String, ThemeData> get themes => {'light': lightTheme, 'dark': darkTheme};
}
