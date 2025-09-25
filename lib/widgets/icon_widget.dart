import 'dart:async';

import 'package:aurasync_ui/mixins/app_theme_mixin.dart';
import 'package:aurasync_ui/theme/app_theme.dart';
import 'package:aurasync_ui/widgets/text_widget.dart';
import 'package:flutter/material.dart';

final class IconWidget extends StatefulWidget {
  const IconWidget(this.icon, {this.size, this.color, this.label, super.key});

  final IconData icon;
  final double? size;
  final Color? color;
  final String? label;

  @override
  State<StatefulWidget> createState() => _IconWidgetState();
}

final class _IconWidgetState extends State<IconWidget>
    with AppThemeMixin, SingleTickerProviderStateMixin {
  Animation<Color?>? _color;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final (colors, metrics) = getTheme(context);

      setState(() {
        _controller = AnimationController(
          vsync: this,
          duration: metrics.duration,
          reverseDuration: metrics.duration,
        );

        _color = ColorTween(
          begin: widget.color ?? colors.onSurface,
          end: widget.color ?? colors.onSurface,
        ).animate(_controller);
      });
    });
  }

  @override
  void didUpdateWidget(IconWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.color != oldWidget.color) {
      _color = ColorTween(
        begin: oldWidget.color,
        end: widget.color,
      ).animate(_controller);

      _controller.reset();
      unawaited(_controller.forward());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final metrics = getThemeMetrics(context);

    if (_color == null) return _buildIcon(metrics);
    return AnimatedBuilder(
      animation: _color!,
      builder: (_, _) => _buildIcon(metrics),
    );
  }

  Widget _buildIcon(AppThemeMetricsExtension metrics) {
    if (widget.label == null) {
      return Icon(
        widget.icon,
        color: _color?.value,
        size: widget.size ?? metrics.icon,
      );
    }

    return Row(
      spacing: metrics.small / 2,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          widget.icon,
          color: _color?.value,
          size: widget.size ?? metrics.icon,
        ),
        TextWidget(
          widget.label!,
          color: _color?.value,
          type: TextWidgetType.bodySmall,
        ),
      ],
    );
  }
}
