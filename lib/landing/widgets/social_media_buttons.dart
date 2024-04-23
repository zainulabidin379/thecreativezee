import 'package:app/landing/widgets/social_media_button.dart';
import 'package:app/utilities/app_constants.dart';
import 'package:app/utilities/extensions.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final alignment = context.isDesktop ? WrapAlignment.start : WrapAlignment.center;
    final wrapAlignment = context.isMobile ? Alignment.center : null;

    return Container(
      alignment: wrapAlignment,
      child: Wrap(
        spacing: 16.0,
        runSpacing: 16.0,
        alignment: alignment,
        children: [
          const SocialMediaButton(
            index: 0,
            url: AppConstants.gitHubProfileURL,
            iconData: FontAwesomeIcons.github,
          ).tooltip("Github"),
          const SocialMediaButton(
            index: 1,
            url: AppConstants.eMail,
            iconData: Icons.alternate_email_rounded,
          ).tooltip("Email"),
          const SocialMediaButton(
            index: 2,
            url: AppConstants.linkedInProfileURL,
            iconData: FontAwesomeIcons.linkedin,
          ).tooltip("LinkedIn"),
          const SocialMediaButton(
            index: 3,
            url: AppConstants.whatsappURL,
            iconData: FontAwesomeIcons.whatsapp,
          ).tooltip("WhatsApp"),
        ],
      ),
    );
  }
}
