import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';

class SMobillsLoadTheme {
  static Future<ThemeData> load(String path) async {
    final themeStr = await rootBundle.loadString(path);
    final themeJson = jsonDecode(themeStr);
    return ThemeDecoder.decodeThemeData(themeJson)!;
  }
}
