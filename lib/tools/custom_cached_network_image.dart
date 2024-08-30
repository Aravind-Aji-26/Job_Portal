
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.isAvailable = true,
    this.width,
    this.height,
    this.fit,
  });
  final String imageUrl;
  final bool isAvailable;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      color: isAvailable ? null : Colors.grey,
      colorBlendMode: isAvailable ? null : BlendMode.color,
      placeholder: (context, url) => const SizedBox(),
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: fit,
      errorWidget: (context, url, error) {
        return const Icon(
          Icons.image_not_supported_outlined,
        );
      },
    );
  }
}

