import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_ui/constant/url.dart';

Widget tootipIcon(
  String name,
  IconData icon,
  String url,
) {
  return Tooltip(
    message: name.toUpperCase(),
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
          onPressed: () {},
          icon: FaIcon(
            icon,
            size: 25.0,
            color: Colors.white,
          ),),
    ),
  );
}

Widget tootilIcons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      tootipIcon(
        'FACEBOOK',
        FontAwesomeIcons.facebook,
        'https://www.facebook.com/TinguarTechnology',
      ),
      tootipIcon(
        'INSTAGRAM',
        FontAwesomeIcons.instagram,
        'https://www.instagram.com/tinguar_technology/',
      ),
      tootipIcon(
        'TIK TOK',
        FontAwesomeIcons.tiktok,
        'https://www.tiktok.com/@tinguar.com',
      ),
      tootipIcon(
        'SITIO WEB',
        FontAwesomeIcons.globe,
        'https://tinguar.com/',
      ),
    ],
  );
}