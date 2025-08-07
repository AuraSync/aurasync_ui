import 'package:aurasync_ui/mixins/app_theme_mixin.dart';
import 'package:aurasync_ui/widgets/container_widget.dart';
import 'package:aurasync_ui/widgets/text_widget.dart';
import 'package:flutter/material.dart';

final class DividerWidget extends StatelessWidget with AppThemeMixin {
  const DividerWidget({this.text, super.key});

  final String? text;

  @override
  Widget build(BuildContext context) {
    final (colors, metrics) = getTheme(context);

    const width = 2.0;
    const height = double.infinity;
    final decoration = BoxDecoration(
      color: colors.border,
      borderRadius: BorderRadius.circular(width),
    );

    if (text == null) {
      return ContainerWidget(
        width: width,
        height: height,
        decoration: decoration,
      );
    }

    return Column(
      spacing: metrics.medium,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ContainerWidget(
            width: width,
            height: height,
            decoration: decoration,
          ),
        ),
        TextWidget(text!),
        Expanded(
          child: ContainerWidget(
            width: width,
            height: height,
            decoration: decoration,
          ),
        ),
      ],
    );
  }
}
