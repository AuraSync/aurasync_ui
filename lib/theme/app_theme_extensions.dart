part of 'app_theme.dart';

final class AppThemeColorsExtension
    extends ThemeExtension<AppThemeColorsExtension> {
  const AppThemeColorsExtension({
    required this.primary,
    required this.onPrimary,
    required this.surface,
    required this.onSurface,
    required this.error,
    required this.onError,
    required this.warning,
    required this.onWarning,
    required this.success,
    required this.onSuccess,
    required this.border,
    required this.background,
    required this.onBackground,
  });

  final Color primary;
  final Color onPrimary;
  final Color surface;
  final Color onSurface;
  final Color error;
  final Color onError;
  final Color warning;
  final Color onWarning;
  final Color success;
  final Color onSuccess;
  final Color border;
  final Color background;
  final Color onBackground;

  @override
  AppThemeColorsExtension copyWith({
    Color? primary,
    Color? onPrimary,
    Color? surface,
    Color? onSurface,
    Color? error,
    Color? onError,
    Color? warning,
    Color? onWarning,
    Color? success,
    Color? onSuccess,
    Color? border,
    Color? background,
    Color? onBackground,
  }) {
    return AppThemeColorsExtension(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      border: border ?? this.border,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
    );
  }

  @override
  AppThemeColorsExtension lerp(
    covariant AppThemeColorsExtension? other,
    double t,
  ) {
    if (other is! AppThemeColorsExtension) {
      return this;
    }
    return AppThemeColorsExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      onWarning: Color.lerp(onWarning, other.onWarning, t)!,
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      border: Color.lerp(border, other.border, t)!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
    );
  }
}

final class AppThemeMetricsExtension
    extends ThemeExtension<AppThemeMetricsExtension> {
  const AppThemeMetricsExtension({
    required this.small,
    required this.medium,
    required this.large,
    required this.blur,
    required this.icon,
    required this.radius,
    required this.border,
    required this.field,
    required this.appBar,
    required this.sidebar,
    required this.curve,
    required this.duration,
  });

  final double small;
  final double medium;
  final double large;
  final double blur;
  final double icon;
  final Radius radius;
  final BorderSide border;
  final BoxConstraints field;
  final BoxConstraints appBar;
  final BoxConstraints sidebar;
  final Curve curve;
  final Duration duration;

  @override
  ThemeExtension<AppThemeMetricsExtension> copyWith({
    double? small,
    double? medium,
    double? large,
    double? blur,
    double? icon,
    Radius? radius,
    BorderSide? border,
    BoxConstraints? field,
    BoxConstraints? appBar,
    BoxConstraints? sidebar,
    Curve? curve,
    Duration? duration,
  }) {
    return AppThemeMetricsExtension(
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
      blur: blur ?? this.blur,
      icon: icon ?? this.icon,
      radius: radius ?? this.radius,
      border: border ?? this.border,
      field: field ?? this.field,
      appBar: appBar ?? this.appBar,
      sidebar: sidebar ?? this.sidebar,
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
    );
  }

  @override
  ThemeExtension<AppThemeMetricsExtension> lerp(
    covariant ThemeExtension<AppThemeMetricsExtension>? other,
    double t,
  ) {
    if (other is! AppThemeMetricsExtension) {
      return this;
    }

    return AppThemeMetricsExtension(
      small: lerpDouble(small, other.small, t)!,
      medium: lerpDouble(medium, other.medium, t)!,
      large: lerpDouble(large, other.large, t)!,
      blur: lerpDouble(blur, other.blur, t)!,
      icon: lerpDouble(icon, other.icon, t)!,
      radius: Radius.lerp(radius, other.radius, t)!,
      border: BorderSide.lerp(border, other.border, t),
      field: BoxConstraints.lerp(field, other.field, t)!,
      appBar: BoxConstraints.lerp(appBar, other.appBar, t)!,
      sidebar: BoxConstraints.lerp(sidebar, other.sidebar, t)!,
      curve: t < 0.5 ? curve : other.curve,
      duration: lerpDuration(duration, other.duration, t),
    );
  }
}
