import 'package:flutter/material.dart';

// Widget displays Image.network or Image.asset on the basis of source.
class SourceAwareImage extends StatelessWidget {
  final String image;
  final bool isNetworkImage;

  const SourceAwareImage({
    required this.image,
    required this.isNetworkImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return isNetworkImage
        ? Image.network(
            image,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return const SizedBox(
                height: 200,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white54,
                  ),
                ),
              );
            },
          )
        : Image.asset(
            image,
          );
  }
}
