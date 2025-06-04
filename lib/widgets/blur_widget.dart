import 'dart:ui';

import 'package:aurasync_ui/mixins/app_theme_mixin.dart';
import 'package:aurasync_ui/widgets/container_widget.dart';
import 'package:flutter/material.dart';

final class BlurWidget extends StatelessWidget with AppThemeMixin {
  const BlurWidget({
    required this.child,
    this.isEnabled = true,
    this.shape = BoxShape.rectangle,
    this.borderRadius,
    super.key,
  });

  final Widget child;
  final bool isEnabled;
  final BoxShape shape;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final metrics = getThemeMetrics(context);

    if (!isEnabled) return child;

    return ContainerWidget(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(shape: shape, borderRadius: borderRadius),
      child: BackdropFilter(
        blendMode: BlendMode.src,
        filter: ImageFilter.blur(sigmaX: metrics.blur, sigmaY: metrics.blur),
        child: child,
      ),
    );
  }
}
