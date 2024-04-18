import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

@immutable
class SMobillsTextStyles {
  const SMobillsTextStyles._();

  static const h1 = TextStyle(
    fontFamily: 'Roboto-Light',
    fontSize: FontSize.h1,
    letterSpacing: LetterSpacing.h1,
  );

  static const h2 = TextStyle(
    fontFamily: 'Roboto-Light',
    fontSize: FontSize.h2,
    letterSpacing: LetterSpacing.h2,
  );

  static const h3 = TextStyle(
    fontFamily: 'Roboto-Regular',
    fontSize: FontSize.h3,
    letterSpacing: LetterSpacing.h3,
  );

  static const h4 = TextStyle(
    fontFamily: 'Roboto-Regular',
    fontSize: FontSize.h4,
    letterSpacing: LetterSpacing.h4,
  );

  static const h5 = TextStyle(
    fontFamily: 'Roboto-Regular',
    fontSize: FontSize.h5,
    letterSpacing: LetterSpacing.h5,
  );

  static const h6 = TextStyle(
    fontFamily: 'Roboto-Medium',
    fontSize: FontSize.h6,
    letterSpacing: LetterSpacing.h6,
  );

  static const subtitle1 = TextStyle(
    fontFamily: 'Roboto-Regular',
    fontSize: FontSize.subtitle1,
    letterSpacing: LetterSpacing.subtitle1,
  );

  static const subtitle2 = TextStyle(
    fontFamily: 'Roboto-Medium',
    fontSize: FontSize.subtitle2,
    letterSpacing: LetterSpacing.subtitle2,
  );

  static const body1 = TextStyle(
    fontFamily: 'Roboto-Regular',
    fontSize: FontSize.body1,
    letterSpacing: LetterSpacing.body1,
  );

  static const body2 = TextStyle(
    fontFamily: 'Roboto-Regular',
    fontSize: FontSize.body2,
    letterSpacing: LetterSpacing.body2,
  );

  static const button = TextStyle(
    fontFamily: 'Roboto-Medium',
    fontSize: FontSize.button,
    letterSpacing: LetterSpacing.button,
  );

  static const caption = TextStyle(
    fontFamily: 'Roboto-Regular',
    fontSize: FontSize.caption,
    letterSpacing: LetterSpacing.caption,
  );

  static const overline = TextStyle(
    fontFamily: 'Roboto-Regular',
    fontSize: FontSize.overline,
    letterSpacing: LetterSpacing.overline,
  );
}

/// Font Size by Material Design recommendation
class FontSize {
  /// Size 10.0
  static const overline = 10.0;

  /// Size 12.0
  static const caption = 12.0;

  /// Size 14.0
  static const button = 14.0;

  /// Size 16.0
  static const body1 = 16.0;

  /// Size 14.0
  static const body2 = 14.0;

  /// Size 16.0
  static const subtitle1 = 16.0;

  /// Size 14.0
  static const subtitle2 = 14.0;

  /// Size 20.0
  static const h6 = 20.0;

  /// Size 24.0
  static const h5 = 24.0;

  /// Size 34.0
  static const h4 = 34.0;

  /// Size 48.0
  static const h3 = 48.0;

  /// Size 60.0
  static const h2 = 60.0;

  /// Size 96.0
  static const h1 = 96.0;
}

/// Letter Spacing by Material Design recommendation
class LetterSpacing {
  /// Spacing -1.5
  static const h1 = -1.5;

  /// Spacing -0.5
  static const h2 = -0.5;

  /// Spacing 0.0
  static const h3 = 0.0;

  /// Spacing 0.25
  static const h4 = 0.25;

  /// Spacing 0.0
  static const h5 = 0.0;

  /// Spacing 0.15
  static const h6 = 0.15;

  /// Spacing 0.15
  static const subtitle1 = 0.15;

  /// Spacing 0.1
  static const subtitle2 = 0.1;

  /// Spacing 0.5
  static const body1 = 0.5;

  /// Spacing 0.25
  static const body2 = 0.25;

  /// Spacing 1.25
  static const button = 1.25;

  /// Spacing 0.4
  static const caption = 0.4;

  /// Spacing 1.5
  static const overline = 1.5;
}

extension BuildContextExtension on BuildContext {
  bool get isDarkMode {
    final brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return brightness == Brightness.dark;
  }

  MediaQueryData get mediaQuery {
    return MediaQuery.of(this);
  }
}

class SMobillsColors {
  static const darkBlue = Color.fromARGB(255, 31, 34, 42);
}
