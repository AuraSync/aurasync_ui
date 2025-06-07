import 'package:aurasync_ui/mixins/app_theme_mixin.dart';
import 'package:flutter/material.dart';

final class ContainerWidget extends StatelessWidget with AppThemeMixin {
  const ContainerWidget({
    this.clipBehavior = Clip.none,
    this.width,
    this.height,
    this.padding,
    this.decoration,
    this.constraints,
    this.alignment,
    this.child,
    super.key,
  });

  final Clip clipBehavior;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final Decoration? decoration;
  final BoxConstraints? constraints;
  final AlignmentGeometry? alignment;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final metrics = getThemeMetrics(context);

    return AnimatedContainer(
      curve: metrics.curve,
      duration: metrics.duration,
      width: width,
      height: height,
      padding: padding,
      alignment: alignment,
      decoration: decoration,
      clipBehavior: clipBehavior,
      constraints: constraints,
      child: child,
    );
  }
}
