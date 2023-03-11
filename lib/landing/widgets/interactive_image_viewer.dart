import 'package:app/landing/landing_screen.dart';
import 'package:app/utilities/custom_scroll_behavior.dart';
import 'package:flutter/material.dart';

class InteractiveImageViewer extends StatefulWidget {
  final List image;
  final bool isNetworkImage;

  const InteractiveImageViewer({
    required this.image,
    required this.isNetworkImage,
    super.key,
  });

  @override
  State<InteractiveImageViewer> createState() => _InteractiveImageViewerState();
}

class _InteractiveImageViewerState extends State<InteractiveImageViewer> {
  late final TransformationController _transformationController;
  late TapDownDetails _doubleTapDetails;
  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _transformationController = TransformationController();
  }

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  List<Widget> buildPageIndicator(int length) {
    List<Widget> list = [];
    for (int i = 0; i < length; i++) {
      list.add(i == currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4.1),
      height: 8.0,
      width: isActive ? 26.0 : 7.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.amber : Colors.grey,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }

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
            child: CloseButton(),
          ),
          SizedBox(width: 24.0),
        ],
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          ScrollConfiguration(
            behavior: MyCustomScrollBehavior(),
            child: PageView(
                physics: const ClampingScrollPhysics(),
                controller: pageController,
                onPageChanged: (int page) {
                  setState(() {
                    currentPage = page;
                  });
                },
                children:
                    List.generate(widget.image.length, (index) => Image.network(widget.image[index]))),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: buildPageIndicator(widget.image.length),
            ),
          ),
        ],
      ),
    );
  }

  void _handleDoubleTapDown(TapDownDetails details) {
    _doubleTapDetails = details;
  }

  void _handleDoubleTap() {
    if (_transformationController.value != Matrix4.identity()) {
      _transformationController.value = Matrix4.identity();
    } else {
      final position = _doubleTapDetails.localPosition;
      _transformationController.value = Matrix4.identity()
        ..translate(-position.dx, -position.dy)
        ..scale(2.0);
    }
  }
}
