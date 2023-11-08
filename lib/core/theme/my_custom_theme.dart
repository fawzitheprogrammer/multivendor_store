import 'package:flutter/material.dart';

ThemeData lightColorScheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFFF9F9F9),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF006685),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFBFE9FF),
    onPrimaryContainer: Color(0xFF001F2A),
    secondary: Color(0xFFBC160E),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFFFDAD5),
    onSecondaryContainer: Color(0xFF410000),
    tertiary: Color(0xFF006874),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFF97F0FF),
    onTertiaryContainer: Color(0xFF001F24),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFF8FDFF),
    onBackground: Color(0xFF001F25),
    surface: Color(0xFFF8FDFF),
    onSurface: Color(0xFF001F25),
    surfaceVariant: Color(0xFFDCE3E9),
    onSurfaceVariant: Color(0xFF40484C),
    outline: Color(0xFF70787D),
    onInverseSurface: Color(0xFFD6F6FF),
    inverseSurface: Color(0xFF00363F),
    inversePrimary: Color(0xFF6DD2FF),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF006685),
    outlineVariant: Color(0xFFC0C8CD),
    scrim: Color(0xFF000000),
  ),
  // inputDecorationTheme: const InputDecorationTheme(
  //   fillColor: Color(0x00ffffff),
  // ),
);

ThemeData darkColorScheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFF001018), // Darken the background
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF004966), // Darken the primary color
    onPrimary: Color(0xFF002433), // Darken the text on primary color
    primaryContainer: Color(0xFF00374D), // Darken the primary container
    onPrimaryContainer:
        Color(0xFF9FD7FF), // Adjust the text on primary container
    secondary: Color(0xFFE5736E), // Darken the secondary color
    onSecondary: Color(0xFF520000), // Darken the text on secondary color
    secondaryContainer: Color(0xFF8C0000), // Darken the secondary container
    onSecondaryContainer:
        Color(0xFFE2BAB5), // Adjust the text on secondary container
    tertiary: Color(0xFF42A8C3), // Darken the tertiary color
    onTertiary: Color(0xFF00262C), // Darken the text on tertiary color
    tertiaryContainer: Color(0xFF003645), // Darken the tertiary container
    onTertiaryContainer:
        Color(0xFF8AC8FF), // Adjust the text on tertiary container
    error: Color(0xFFE5736F), // Darken the error color
    errorContainer: Color(0xFF8C000A), // Darken the error container
    onError: Color(0xFF520005), // Darken the text on error color
    onErrorContainer: Color(0xFFE2BAB6), // Adjust the text on error container
    background: Color(0xFF001018), // Darken the background
    onBackground: Color(0xFF88CCFF), // Adjust the text on background
    surface: Color(0xFF001018), // Darken the surface
    onSurface: Color(0xFF88CCFF), // Adjust the text on surface
    surfaceVariant: Color(0xFF353C41), // Darken the surface variant
    onSurfaceVariant: Color(0xFFB2B9BD), // Adjust the text on surface variant
    outline: Color(0xFF7C858A), // Darken the outline
    onInverseSurface: Color(0xFF001018), // Darken the inverse surface
    inverseSurface: Color(0xFF88CCFF), // Adjust the inverse surface
    inversePrimary: Color(0xFF004966), // Darken the inverse primary
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF65BBFF), // Adjust the surface tint
    outlineVariant: Color(0xFF353C41), // Darken the outline variant
    scrim: Color(0xFF000000),
  ),
);
