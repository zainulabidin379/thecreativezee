import 'package:app/landing/landing_screen.dart';
import 'package:app/utilities/custom_scroll_behavior.dart';
import 'package:flutter/material.dart';

class InteractiveImageViewer extends StatelessWidget {
  final List image;
  final bool isNetworkImage;

  const InteractiveImageViewer({
    required this.image,
    required this.isNetworkImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor.withOpacity(.25),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
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
              children: List.generate(
                  image.length,
                  (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Image.network(image[index], fit: BoxFit.fitHeight, loadingBuilder: (context, child, progress) {
                          if (progress != null) {
                            return const CircularProgressIndicator(
                              color: Colors.white70,
                            );
                          }
                          return child;
                        }),
                      ))),
        ),
      ),
    );
  }
}
