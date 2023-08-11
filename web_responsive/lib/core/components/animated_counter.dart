import 'package:flutter/material.dart';

import 'package:web_responsive_ui/core/style/color.dart';

class AnimatedCounter extends StatelessWidget {
  const AnimatedCounter({
    Key? key,
    required this.value,
    this.text,
  }) : super(key: key);

  final int value;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: defaultDuration,
      tween: IntTween(begin: 0, end: value),
      builder: (BuildContext context, value, child) {
        return Text(
          "$value$text",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: primaryColor),
        );
      },
    );
  }
}
