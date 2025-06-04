import 'package:aurasync_ui/mixins/app_theme_mixin.dart';
import 'package:aurasync_ui/widgets/container_widget.dart';
import 'package:aurasync_ui/widgets/icon_widget.dart';
import 'package:aurasync_ui/widgets/touchable_widget.dart';
import 'package:flutter/material.dart';

final class IconButtonWidget extends StatefulWidget {
  const IconButtonWidget({
    required this.icon,
    this.isFilled = false,
    this.iconSize,
    this.onPressed,
    super.key,
  });

  final IconData icon;
  final bool isFilled;
  final double? iconSize;
  final VoidCallback? onPressed;

  @override
  State<StatefulWidget> createState() => _IconButtonWidgetState();
}

final class _IconButtonWidgetState extends State<IconButtonWidget>
    with AppThemeMixin {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final (colors, metrics) = getTheme(context);

    Color fgColor;
    Color bgColor;
    if (_isHovered) {
      fgColor = widget.isFilled ? colors.onPrimary : colors.primary;
      bgColor = widget.isFilled ? colors.primary : Colors.transparent;
    } else {
      fgColor = widget.isFilled ? colors.onSurface : colors.onBackground;
      bgColor = widget.isFilled ? colors.surface : Colors.transparent;
    }

    return TouchableWidget(
      onPressed: widget.onPressed,
      onHover: (isHovered) => setState(() => _isHovered = isHovered),
      onFocus: (isFocused) => setState(() => _isHovered = isFocused),
      child: Visibility(
        visible: widget.isFilled,
        replacement: IconWidget(
          widget.icon,
          color: fgColor,
          size: widget.iconSize,
        ),
        child: ContainerWidget(
          padding: EdgeInsets.all(metrics.small),
          decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
          child: IconWidget(widget.icon, color: fgColor, size: widget.iconSize),
        ),
      ),
    );
  }
}
