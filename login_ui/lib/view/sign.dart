import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_ui/constant/responsive.dart';
import 'package:login_ui/style/color.dart';
import 'package:login_ui/style/text.dart';

import '../../../widget/widget.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeW = Responsive.isResponsiveWidth(context, 1);
    final sizeH = Responsive.isResponsiveHeight(context, 1);


    return Scaffold(
      body: Responsive(
        mobile: Column(
          children: [
            Container(
              width: sizeW * 1,
              height: sizeH / 2,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'TO DO'.toUpperCase(),
                    style: const TextStyle(
                      color: Color(0xFF2d2f46),
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'recuerda todo'.toUpperCase(),
                    style: const TextStyle(
                      letterSpacing: 3.0,
                      color: Color(
                        0xFFadb0b8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: sizeW * 1,
              height: sizeH / 2,
              color: ColorS.background,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonIconOnpress(
                    color: ColorS.button,
                    icon: const FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.white,
                    ),
                    text: 'Inicia sesión con Google',
                    textS: TextS.title,
                    onTap: () async {
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    'Redes Sociales',
                    style: TextStyle(
                      color: Color.fromARGB(
                        255,
                        147,
                        148,
                        156,
                      ),
                    ),
                  ),
             tootilIcons()
                ],
              ),
            ),
          ],
        ),
        desktop: const Center(
          child: Text(
            'SOLO PARA MOBILE y TABLET',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
