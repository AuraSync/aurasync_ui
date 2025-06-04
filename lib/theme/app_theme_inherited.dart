part of 'app_theme.dart';

final class AppThemeInherited extends InheritedWidget {
  const AppThemeInherited({
    required this.light,
    required this.dark,
    required super.child,
    super.key,
  });

  factory AppThemeInherited.of(BuildContext context) {
    final widget = context
        .dependOnInheritedWidgetOfExactType<AppThemeInherited>();

    if (widget == null) {
      throw FlutterError('No AppThemeInherited found in context');
    }

    return widget;
  }

  final ColorScheme? light;
  final ColorScheme? dark;

  @override
  bool updateShouldNotify(covariant AppThemeInherited oldWidget) {
    return oldWidget.light != light || oldWidget.dark != dark;
  }
}
