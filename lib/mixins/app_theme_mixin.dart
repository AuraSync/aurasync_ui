import 'package:aurasync_ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

mixin AppThemeMixin {
  Brightness getThemeBrightness(BuildContext context) {
    return Theme.of(context).brightness;
  }

  TextTheme getThemeTypography(BuildContext context) {
    return Theme.of(context).textTheme;
  }

  AppThemeColorsExtension getThemeColors(BuildContext context) {
    return Theme.of(context).extension<AppThemeColorsExtension>()!;
  }

  AppThemeMetricsExtension getThemeMetrics(BuildContext context) {
    return Theme.of(context).extension<AppThemeMetricsExtension>()!;
  }

  (AppThemeColorsExtension colors, AppThemeMetricsExtension metrics) getTheme(
    BuildContext context,
  ) {
    return (getThemeColors(context), getThemeMetrics(context));
  }
}
