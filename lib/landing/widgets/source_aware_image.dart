import 'package:flutter/material.dart';

// Widget displays Image.network or Image.asset on the basis of source.
class SourceAwareImage extends StatelessWidget {
  final String image;
  final BoxFit? fit;

  const SourceAwareImage({
    required this.image,
    super.key,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      fit: fit,
      frameBuilder: (BuildContext context, Widget child, int? frame, bool wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) return child;
        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1,
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
          child: child,
        );
      },
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        return IndexedStack(
          index: loadingProgress == null ? 0 : 1,
          alignment: Alignment.center,
          children: <Widget>[
            child,
            const Center(
              child: CircularProgressIndicator(
                color: Colors.white54,
              ),
            ),
          ],
        );
      },
      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
        return const Text('Failed to load image');
      },
    );
  }
}
