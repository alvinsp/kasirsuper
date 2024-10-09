import 'package:flutter/material.dart';
import 'package:kasirsuper/core/core.dart';

class LightTheme {
  LightTheme(this.primaryColor);

  final Color primaryColor;

  final Color errorColor = AppColors.red;
  final Color scaffoldColor = AppColors.white;
  final Color textSolidColor = AppColors.black;
  final Color textDisabledColor = AppColors.black[400]!;
  final Color borderColor = AppColors.white[500]!;
  final Color disabledColor = AppColors.black[200]!;
  final Color inputColor = AppColors.white;
  final Color dividerColor = AppColors.white[400]!;

  final String fontFamily = 'Poppins';

  ColorScheme get colorScheme => ColorScheme.light(
        primary: primaryColor,
        secondary: primaryColor,
        error: errorColor,
      );

  TextTheme get textTheme => TextTheme(
        headlineLarge: TextStyle(
          fontFamily: fontFamily,
          fontSize: Dimens.dp32,
          fontWeight: FontWeight.bold,
          color: textSolidColor,
        ),
        headlineMedium: TextStyle(
          fontFamily: fontFamily,
          fontSize: Dimens.dp24,
          fontWeight: FontWeight.w600,
          color: textSolidColor,
        ),
        headlineSmall: TextStyle(
          fontFamily: fontFamily,
          fontSize: Dimens.dp20,
          fontWeight: FontWeight.w600,
          color: textSolidColor,
        ),
        titleLarge: TextStyle(
          fontFamily: fontFamily,
          fontSize: Dimens.dp16,
          fontWeight: FontWeight.w600,
          color: textSolidColor,
        ),
        titleMedium: TextStyle(
          fontFamily: fontFamily,
          fontSize: Dimens.dp14,
          fontWeight: FontWeight.w600,
          color: textSolidColor,
        ),
        bodyLarge: TextStyle(
          fontFamily: fontFamily,
          fontSize: Dimens.dp16,
          fontWeight: FontWeight.w500,
          color: textSolidColor,
        ),
        bodyMedium: TextStyle(
          fontFamily: fontFamily,
          fontSize: Dimens.dp14,
          fontWeight: FontWeight.w400,
          color: textDisabledColor,
        ),
        labelMedium: TextStyle(
          fontFamily: fontFamily,
          fontSize: Dimens.dp12,
          fontWeight: FontWeight.w500,
          color: textDisabledColor,
        ),
      );

  AppBarTheme get appBarTheme {
    return AppBarTheme(
      centerTitle: false,
      surfaceTintColor: scaffoldColor,
      iconTheme: IconThemeData(color: primaryColor),
    );
  }

  CardTheme get cardTheme {
    return CardTheme(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.dp8),
        side: BorderSide(color: borderColor),
      ),
    );
  }

  BottomNavigationBarThemeData get bottomNavigationBarTheme {
    return BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primaryColor,
      unselectedItemColor: disabledColor,
    );
  }

  ElevatedButtonThemeData get elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.dp8),
        ),
        backgroundColor: primaryColor,
        foregroundColor: scaffoldColor,
        textStyle: textTheme.titleMedium,
      ),
    );
  }

  OutlinedButtonThemeData get outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.dp8),
        ),
        side: BorderSide(color: primaryColor),
        foregroundColor: primaryColor,
        textStyle: textTheme.titleMedium,
      ),
    );
  }

  InputDecorationTheme get inputDecorationTheme {
    return InputDecorationTheme(
      fillColor: inputColor,
      filled: true,
      hintStyle: textTheme.labelMedium,
      prefixIconColor: textDisabledColor,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: Dimens.dp16,
        vertical: Dimens.dp12,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimens.dp8),
        borderSide: BorderSide(color: inputColor),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimens.dp8),
        borderSide: BorderSide(color: inputColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimens.dp8),
        borderSide: BorderSide(color: primaryColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimens.dp8),
        borderSide: BorderSide(color: errorColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimens.dp8),
        borderSide: BorderSide(color: errorColor),
      ),
    );
  }

  DividerThemeData get dividerTheme {
    return DividerThemeData(color: dividerColor, space: Dimens.dp24);
  }

  ThemeData get theme {
    return ThemeData(
      fontFamily: fontFamily,
      colorScheme: colorScheme,
      useMaterial3: true,
      primaryColor: primaryColor,
      textTheme: textTheme,
      appBarTheme: appBarTheme,
      cardTheme: cardTheme,
      disabledColor: disabledColor,
      bottomNavigationBarTheme: bottomNavigationBarTheme,
      elevatedButtonTheme: elevatedButtonTheme,
      outlinedButtonTheme: outlinedButtonTheme,
      inputDecorationTheme: inputDecorationTheme,
      dividerColor: dividerColor,
      dividerTheme: dividerTheme,
    );
  }
}
