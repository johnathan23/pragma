import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pragma_exam/config/theme/app_colors.dart';

class CustomCacheNetworkImage extends StatefulWidget {
  final String imageUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;

  const CustomCacheNetworkImage({super.key, required this.imageUrl, this.fit, this.width, this.height});

  @override
  State<CustomCacheNetworkImage> createState() => _CustomCacheNetworkImageState();
}

class _CustomCacheNetworkImageState extends State<CustomCacheNetworkImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.imageUrl,
      fit: widget.fit,
      width: widget.width,
      height: widget.height,
      progressIndicatorBuilder:
          (context, url, downloadProgress) =>
              kIsWeb
                  ? CircularProgressIndicator(value: downloadProgress.progress)
                  : Platform.isIOS
                  ? CupertinoActivityIndicator(animating: !(downloadProgress.progress == 1))
                  : CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error, color: kGrey, size: 50),
            Text('Image not found', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: kGrey), textAlign: TextAlign.center),
          ],
        );
      },
    );
  }
}
