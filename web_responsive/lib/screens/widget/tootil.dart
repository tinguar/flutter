import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget TooltipSvgWidget(name, icon, width, height) {
  return Tooltip(
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    message: name.toUpperCase(),
    child: SvgPicture.asset(
      icon,
      width: width,
      height: height,
    ),
  );
}

Widget TooltipPngWidget(name, icon, width, height) {
  return Tooltip(
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    message: name.toUpperCase(),
    child: Image.asset(
      icon,
      width: width,
      height: height,
    ),
  );
}
