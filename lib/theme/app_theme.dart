import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part 'app_theme_colors.dart';
part 'app_theme_metrics.dart';
part 'app_theme_inherited.dart';
part 'app_theme_extensions.dart';

final class AppTheme {
  const AppTheme({required this.context});

  final BuildContext context;

  ThemeData getData({required bool isDark}) {
    final inherited = AppThemeInherited.of(context);

    final scheme = isDark ? inherited.dark : inherited.light;
    final brightness = isDark ? Brightness.dark : Brightness.light;

    final metrics = Platform.isAndroid
        ? const _AppThemeMobileMetrics()
        : const _AppThemeDesktopMetrics();

    final theme = isDark
        ? ThemeData.dark(useMaterial3: true)
        : ThemeData.light(useMaterial3: true);

    final colors = _resolveColors(scheme, brightness);
    final colorScheme = scheme ?? _buildColorScheme(brightness, colors);

    return theme.copyWith(
      brightness: brightness,
      colorScheme: colorScheme,
      extensions: [colors, metrics],
      textTheme: _buildTextTheme(theme.textTheme, colors, metrics),
    );
  }

  AppThemeColorsExtension _resolveColors(
    ColorScheme? scheme,
    Brightness brightness,
  ) {
    final colors = brightness == Brightness.dark
        ? const _AppThemeDarkColors()
        : const _AppThemeLightColors();

    return colors.copyWith(
      primary: scheme?.primary,
      onPrimary: scheme?.onPrimary,
      surface: scheme?.surface.withValues(alpha: 0.6),
      onSurface: scheme?.onSurface.withValues(alpha: 0.9),
      border: scheme?.outline.withValues(alpha: 0.4),
      background: scheme?.surface.withValues(alpha: 0.4),
      onBackground: scheme?.onSurface.withValues(alpha: 0.9),
    );
  }

  ColorScheme _buildColorScheme(
    Brightness brightness,
    AppThemeColorsExtension colors,
  ) {
    return ColorScheme.fromSeed(
      brightness: brightness,
      seedColor: colors.primary,
    );
  }

  TextTheme _buildTextTheme(
    TextTheme base,
    AppThemeColorsExtension colors,
    AppThemeMetricsExtension metrics,
  ) {
    final color = colors.onSurface;
    const bold = FontWeight.bold;
    const semiBold = FontWeight.w600;

    return GoogleFonts.interTextTheme(base).copyWith(
      bodySmall: TextStyle(color: color, fontSize: 12),
      bodyMedium: TextStyle(color: color, fontSize: 14),
      bodyLarge: TextStyle(color: color, fontSize: 16),
      titleSmall: TextStyle(color: color, fontSize: 12, fontWeight: semiBold),
      titleMedium: TextStyle(color: color, fontSize: 14, fontWeight: semiBold),
      titleLarge: TextStyle(color: color, fontSize: 16, fontWeight: semiBold),
      headlineSmall: TextStyle(color: color, fontSize: 20, fontWeight: bold),
      headlineMedium: TextStyle(color: color, fontSize: 22, fontWeight: bold),
      headlineLarge: TextStyle(color: color, fontSize: 24, fontWeight: bold),
    );
  }
}
