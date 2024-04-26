import 'package:app/landing/landing_screen.dart';
import 'package:app/landing/widgets/source_aware_image.dart';
import 'package:app/utilities/custom_scroll_behavior.dart';
import 'package:flutter/material.dart';

class InteractiveImageViewer extends StatelessWidget {
  final List image;
  final String name;
  final bool isNetworkImage;

  const InteractiveImageViewer({
    required this.image,
    required this.isNetworkImage,
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor.withOpacity(.25),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        title: Text(
          name,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 1.4,
          ),
        ),
        centerTitle: false,
        actions: const [
          CircleAvatar(
            backgroundColor: primaryColor,
            child: CloseButton(
              color: Colors.white,
            ),
          ),
          SizedBox(width: 24.0),
        ],
      ),
      body: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: Center(
          child: ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: List.generate(image.length, (index) => SourceAwareImage(image: image[index], fit: BoxFit.fitHeight))),
        ),
      ),
    );
  }
}
