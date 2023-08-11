import 'package:flutter/material.dart';
import 'package:web_responsive_ui/core/style/color.dart';
import 'package:web_responsive_ui/models/privacy.dart';

class PrivacyCard extends StatelessWidget {
  const PrivacyCard({Key? key, required this.privacy}) : super(key: key);

  final Privacy privacy;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(defaultPadding),
      color: secondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            privacy.name!,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          Text(
            privacy.text!,
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(height: 1.5),
          )
        ],
      ),
    );
  }
}
