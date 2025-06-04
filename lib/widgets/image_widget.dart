import 'dart:io';

import 'package:flutter/material.dart';

final class ImageWidget extends StatelessWidget {
  const ImageWidget({
    required this.uri,
    this.fit = BoxFit.cover,
    this.borderRadius = BorderRadius.zero,
    this.width,
    this.height,
    this.aspectRatio,
    this.package,
    this.errorBuilder,
    super.key,
  });

  final Uri? uri;
  final BoxFit fit;
  final BorderRadius borderRadius;
  final double? width;
  final double? height;
  final double? aspectRatio;
  final String? package;
  final Widget Function(
    BuildContext context,
    Object error,
    StackTrace? stackTrace,
  )?
  errorBuilder;

  @override
  Widget build(BuildContext context) {
    if (aspectRatio != null) {
      return AspectRatio(aspectRatio: aspectRatio!, child: _buildImage());
    }

    return _buildImage();
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image(
        fit: fit,
        width: width,
        height: height,
        image: _getImage(),
        gaplessPlayback: true,
        errorBuilder: errorBuilder,
      ),
    );
  }

  ImageProvider _getImage() {
    final newUri = uri?.toString();

    if (newUri == null) {
      return const AssetImage(
        'assets/placeholder.jpg',
        package: 'aurasync_ui', //
      );
    }

    if (newUri.startsWith('assets')) {
      return AssetImage(newUri, package: package);
    } else if (newUri.startsWith('file')) {
      return FileImage(File(newUri));
    } else if (newUri.startsWith('http')) {
      return NetworkImage(
        newUri,
        headers: {'Access-Control-Allow-Origin': '*'},
      );
    } else {
      final bytes = UriData.parse(newUri).contentAsBytes();
      return MemoryImage(bytes);
    }
  }
}
