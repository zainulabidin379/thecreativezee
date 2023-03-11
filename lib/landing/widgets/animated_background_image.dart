import 'package:app/utilities/extensions.dart';
import 'package:flutter/material.dart';

class AnimatedBackgroundImage extends StatefulWidget {
  final ScrollController scrollController;

  const AnimatedBackgroundImage(this.scrollController, {super.key});

  @override
  State<AnimatedBackgroundImage> createState() =>
      _AnimatedBackgroundImageState();
}

class _AnimatedBackgroundImageState extends State<AnimatedBackgroundImage> {
  late double _y;

  @override
  void initState() {
    super.initState();

    _y = 0.0;

    widget.scrollController.addListener(() {
      final offset = widget.scrollController.offset;

      /// Only update alignment of the background image while it is visible.
      if (offset < 500) {
        /// Divide current scroll offset by 1000 to make it more smooth.
        setState(() => _y = widget.scrollController.offset / 1000);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = context.isMobile ? 440.0 : 540.0;
    return SizedBox(
      height: height,
      width: double.maxFinite,
      child: Opacity(
        opacity: 0.3,
        child: FadeInImage.assetNetwork(
          placeholder: 'assets/images/transparent.png',
          image:
              'https://images.unsplash.com/photo-1633976976526-4e3584e91a5d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
          fit: BoxFit.cover,
          alignment: Alignment(0.0, _y),
        ),
      ),
    );
  }
}
