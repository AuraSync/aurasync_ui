import 'dart:math';

import 'package:aurasync_engine/aurasync_engine.dart';
import 'package:aurasync_ui/aurasync_ui.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

final class DeviceRadarWidget extends StatefulWidget {
  const DeviceRadarWidget({
    required this.devices,
    this.dimension = 512,
    this.onPressed,
    super.key,
  });

  final Set<DeviceEntity> devices;
  final double dimension;
  final ValueChanged<DeviceEntity>? onPressed;

  @override
  State<DeviceRadarWidget> createState() => _DeviceRadarWidgetState();
}

final class _DeviceRadarWidgetState extends State<DeviceRadarWidget> {
  final _random = Random();
  final _size = const Size(100, 40);
  final List<(DeviceEntity device, Offset position)> _devices = [];

  @override
  void didUpdateWidget(covariant DeviceRadarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    _devices.removeWhere((entry) => !widget.devices.contains(entry.$1));

    final existing = _devices.map((e) => e.$1).toSet();
    final devices = widget.devices.difference(existing);

    for (final device in devices) {
      final position = _genOffset();
      _devices.add((device, position));
    }
  }

  Offset _genOffset() {
    const attempts = 100;
    var offset = Offset.zero;

    for (var i = 0; i < attempts; i++) {
      offset = Offset(
        _random.nextDouble() * (widget.dimension - _size.width),
        _random.nextDouble() * (widget.dimension - _size.height),
      );

      final overlaps = _devices.any(
        (entry) => (entry.$2 - offset).distance < _size.width,
      );

      if (!overlaps) break;
    }

    return offset;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: widget.dimension,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          const Positioned.fill(
            child: RepaintBoundary(
              child: _RadarWidget(),
            ),
          ),
          ..._devices.map((entry) {
            final (device, offset) = entry;
            return Positioned(
              left: offset.dx,
              top: offset.dy,
              child: _DeviceWidget(
                size: _size,
                device: device,
                onPressed: () => widget.onPressed?.call(device),
              ),
            );
          }),
        ],
      ),
    );
  }
}

final class _RadarWidget extends StatelessWidget with AppThemeMixin {
  const _RadarWidget();

  @override
  Widget build(BuildContext context) {
    final colors = getThemeColors(context);

    return Lottie.asset(
      'assets/lottie/radar.json',
      repeat: true,
      animate: true,
      fit: BoxFit.cover,
      package: 'aurasync_ui',
      width: double.infinity,
      height: double.infinity,
      backgroundLoading: true,
      frameRate: const FrameRate(60),
      renderCache: RenderCache.raster,
      filterQuality: FilterQuality.medium,
      delegates: LottieDelegates(
        values: [
          ValueDelegate.strokeColor(
            const ['**', 'Search circle 6', 'Contour 1'],
            value: colors.border,
          ),
          ValueDelegate.strokeColor(
            const ['**', 'Search circle 5', 'Contour 1'],
            value: colors.border,
          ),
          ValueDelegate.strokeColor(
            const ['**', 'Search circle 4', 'Contour 1'],
            value: colors.border,
          ),
          ValueDelegate.strokeColor(
            const ['**', 'Search circle 3', 'Contour 1'],
            value: colors.border,
          ),
          ValueDelegate.strokeColor(
            const ['**', 'Search circle 2', 'Contour 1'],
            value: colors.border,
          ),
        ],
      ),
    );
  }
}

final class _DeviceWidget extends StatelessWidget {
  const _DeviceWidget({
    required this.size,
    required this.device,
    required this.onPressed,
  });

  final Size size;
  final DeviceEntity device;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final IconData icon;
    switch (device.type) {
      case DeviceTypeEnum.pc:
        icon = SolarLinearIcons.notebook2;
      case DeviceTypeEnum.mobile:
        icon = SolarLinearIcons.smartphone;
    }

    return TouchableWidget(
      onPressed: onPressed,
      child: ContainerWidget(
        width: size.width,
        height: size.height,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconWidget(icon),
            TextWidget(device.name, type: TextWidgetType.bodySmall),
          ],
        ),
      ),
    );
  }
}
