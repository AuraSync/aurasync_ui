/// AuraSync UI Library
library;

import 'package:aurasync_ui/theme/app_theme.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

export 'package:solar_icon_pack/solar_icon_pack.dart';

export 'mixins.dart';
export 'theme/app_theme.dart';

final class AuraSyncUIApp extends StatelessWidget {
  const AuraSyncUIApp({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (light, dark) {
        return AppThemeInherited(light: light, dark: dark, child: child);
      },
    );
  }
}
