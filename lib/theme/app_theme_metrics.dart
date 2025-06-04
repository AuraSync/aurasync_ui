// ignore_for_file: unused_element_parameter

part of 'app_theme.dart';

final class _AppThemeDesktopMetrics extends AppThemeMetricsExtension {
  const _AppThemeDesktopMetrics({
    super.small = 8,
    super.medium = 16,
    super.large = 32,
    super.blur = 32,
    super.icon = 22,
    super.radius = const Radius.circular(16),
    super.border = const BorderSide(width: 1.2),
    super.field = const BoxConstraints(maxHeight: 120),
    super.appBar = const BoxConstraints(maxHeight: 100),
    super.sidebar = const BoxConstraints(minWidth: 60, maxWidth: 320),
    super.curve = Curves.easeInOut,
    super.duration = const Duration(milliseconds: 200),
  });
}

final class _AppThemeMobileMetrics extends _AppThemeDesktopMetrics {
  const _AppThemeMobileMetrics({
    super.appBar = const BoxConstraints(maxHeight: 116),
  });
}
