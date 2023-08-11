import 'package:flutter/material.dart';
import 'package:web_responsive_ui/core/style/color.dart';

class AreaInfoText extends StatelessWidget {
  const AreaInfoText({Key? key, this.title, this.text}) : super(key: key);

  final String? title, text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            style: const TextStyle(color: Colors.white),
          ),
          Text(text!),
        ],
      ),
    );
  }
}
