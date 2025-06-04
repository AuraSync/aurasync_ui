part of 'app_theme.dart';

final class _AppThemeLightColors extends AppThemeColorsExtension {
  const _AppThemeLightColors({
    super.primary = const Color(0xFF401F7A),
    super.onPrimary = const Color(0xFFFFFFFF),
    super.surface = const Color.fromRGBO(237, 231, 249, 0.6),
    super.onSurface = const Color(0xFF000000),
    super.error = const Color(0xFF9B1B1B),
    super.onError = const Color(0xFFFFFFFF),
    super.warning = const Color(0xFF867918),
    super.onWarning = const Color(0xFFFFFFFF),
    super.success = const Color(0xFF40A51C),
    super.onSuccess = const Color(0xFFFFFFFF),
    super.border = const Color.fromRGBO(0, 0, 0, 0.2),
    super.background = const Color.fromRGBO(237, 231, 249, 0.4),
    super.onBackground = const Color(0xFF000000),
  });
}

final class _AppThemeDarkColors extends AppThemeColorsExtension {
  const _AppThemeDarkColors({
    super.primary = const Color(0xFF7A48D1),
    super.onPrimary = const Color(0xFFFFFFFF),
    super.surface = const Color.fromRGBO(9, 4, 16, 0.6),
    super.onSurface = const Color(0xFFFFFFFF),
    super.error = const Color(0xFF9B1B1B),
    super.onError = const Color(0xFFFFFFFF),
    super.warning = const Color(0xFF867918),
    super.onWarning = const Color(0xFFFFFFFF),
    super.success = const Color(0xFF40A51C),
    super.onSuccess = const Color(0xFFFFFFFF),
    super.border = const Color.fromRGBO(255, 255, 255, 0.2),
    super.background = const Color.fromRGBO(9, 4, 16, 0.4),
    super.onBackground = const Color(0xFFFFFFFF),
  });
}
