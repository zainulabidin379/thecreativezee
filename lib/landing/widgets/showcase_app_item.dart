import 'package:app/landing/widgets/interactive_image_viewer.dart';
import 'package:app/landing/widgets/source_aware_image.dart';
import 'package:app/utilities/showcase_app_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app/landing/landing_screen.dart';
import 'package:app/landing/widgets/external_link_button.dart';

class ShowcaseAppItem extends StatefulWidget {
  final ShowcaseAppModel app;

  const ShowcaseAppItem(
    this.app, {
    Key? key,
  }) : super(key: key);

  @override
  State<ShowcaseAppItem> createState() => _ShowcaseAppItemState();
}

class _ShowcaseAppItemState extends State<ShowcaseAppItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: _hovered
              ? [
                  const BoxShadow(
                      color: Colors.black38,
                      offset: Offset(0, 0),
                      blurRadius: 10,
                      spreadRadius: 8),
                ]
              : null,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
            bottomLeft: Radius.circular(4.0),
            bottomRight: Radius.circular(4.0),
          ),
          child: InkWell(
              onTap: () {
                showGeneralDialog(
                  context: context,
                  pageBuilder: (_, __, ___) {
                    return InteractiveImageViewer(
                      image: widget.app.image,
                      isNetworkImage: widget.app.isNetworkImage,
                    );
                  },
                );
              },
              child: _buildChild()),
        ),
      ),
    );
  }

  Widget _buildChild() {
    return Container(
      color: cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SourceAwareImage(
            image: widget.app.image[0],
            isNetworkImage: widget.app.isNetworkImage,
          ),
          _buildBottom(),
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return Padding(
      padding: const EdgeInsets.all(24.0).copyWith(bottom: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppName(),
              const Divider(
                color: dividerColor,
                thickness: 1.5,
                height: 32.0,
              ),
            ],
          ),
          if (widget.app.playStoreURL != null) ...[
            ExternalLinkButton(
              url: widget.app.playStoreURL!,
              iconData: FontAwesomeIcons.googlePlay,
              label: 'Play Store',
            ),
            const SizedBox(height: 10.0),
          ],
          if (widget.app.appStoreURL != null) ...[
            ExternalLinkButton(
              url: widget.app.appStoreURL!,
              iconData: FontAwesomeIcons.appStoreIos,
              label: 'App Store',
            ),
            const SizedBox(height: 10.0),
          ],
          if (widget.app.githubURL != null) ...[
            ExternalLinkButton(
              url: widget.app.githubURL!,
              iconData: FontAwesomeIcons.squareGithub,
              label: 'GitHub',
            ),
            const SizedBox(height: 10.0),
          ]
        ],
      ),
    );
  }

  Widget _buildAppName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.app.name,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 1.4,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          widget.app.topic,
          style: const TextStyle(
            fontSize: 14.0,
            color: Colors.white54,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}
