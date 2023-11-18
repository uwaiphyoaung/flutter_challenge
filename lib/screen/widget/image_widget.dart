import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String? url;
  final BoxFit fit;
  final double? width, height;
  final Alignment alignment;

  const ImageView(
      {super.key,
        required this.url,
        required this.fit,
        this.height,
        this.width,
        required this.alignment});

  @override
  Widget build(BuildContext context) {
    return url != null?
    CachedNetworkImage(
      imageUrl: url!,
      placeholder: (context, url) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: const Center(
            child: CupertinoActivityIndicator(
              animating: true,
              radius: 11,
            ),
          ),
        );
      },
      errorWidget: (context, url, error) => defaultImage(),
      fit: fit,
      width: width,
      height: height,
      alignment: alignment,
    ): defaultImage();
  }
}

Widget defaultImage(){
  return Container(
    height: 200,
    width: double.infinity,
    color: Colors.grey.shade800,
  );
}