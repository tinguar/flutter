import 'package:flutter/material.dart';
import 'package:web_responsive_ui/core/assets/assets.dart';
import 'package:web_responsive_ui/core/style/color.dart';
import 'package:web_responsive_ui/core/style/constants.dart';
import 'package:web_responsive_ui/models/write.dart';
import 'package:web_responsive_ui/screens/main/components/skills.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'area_info_text.dart';
import 'coding.dart';
import 'knowledges.dart';
import 'my_info.dart';
import 'package:universal_html/html.dart' as html;

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final al = AppLocalizations.of(context);

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const MyInfo(),
            Expanded(
                child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  AreaInfoText(title: al!.country, text: Write.countryText),
                  AreaInfoText(
                    title: al.city,
                    text: Write.cityText,
                  ),
                  AreaInfoText(
                    title: al.age,
                    text: Write.ageNumber.toString(),
                  ),
                  const Skills(),
                  const SizedBox(height: defaultPadding),
                  const Coding(),
                  const Knowledges(),
                  const Divider(),
                  const SizedBox(height: defaultPadding / 2),
                  TextButton(
                      onPressed: () {
                        html.window.open(
                            "https://drive.google.com/file/d/17r_C08OSrvNfw3cDAi7QICTyB-woSVBZ/view?usp=sharing",
                            "CV ");
                      },
                      child: FittedBox(
                        child: Row(
                          children: [
                            Text(
                              Write.curriculum,
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color,
                              ),
                            ),
                            const SizedBox(height: defaultPadding / 2),
                            SvgPicture.asset(Assets.download)
                          ],
                        ),
                        //
                      )),
                  Container(
                    color: secondaryColor,
                    margin: const EdgeInsets.only(top: defaultPadding),
                    child: Row(
                      children: [
                        const Spacer(),
                        Tooltip(
                          message: 'Instagram'.toUpperCase(),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          child: IconButton(
                              onPressed: () {
                                html.window.open(
                                  "https://www.instagram.com/tinguar_technology/",
                                  "Instagram",
                                );
                              },
                              icon: const Image(
                                image: AssetImage(
                                  Assets.instagram,
                                ),
                                width: Const.widthIcon,
                                color: Colors.white,
                              )),
                        ),
                        Tooltip(
                          message: 'GitHub'.toUpperCase(),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          child: IconButton(
                              onPressed: () {
                                html.window.open(
                                  "https://github.com/gbrielgarcia",
                                  "GitHub",
                                );
                              },
                              icon: SvgPicture.asset(
                                Assets.github,
                                color: Colors.white,
                                width: Const.widthIcon,
                              )),
                        ),
                        // Tooltip(
                        //   message: 'Twitter'.toUpperCase(),
                        //   textStyle: const TextStyle(
                        //     fontWeight: FontWeight.bold,
                        //     color: Colors.black,
                        //   ),
                        //   child: IconButton(
                        //       onPressed: () {
                        //         html.window.open(
                        //             "https://twitter.com/Gabrielx2Garcia",
                        //             "Twitter");
                        //       },
                        //       icon: SvgPicture.asset(
                        //         Assets.twitter,
                        //         color: Colors.white,
                        //         width: Const.widthIcon,
                        //       )),
                        // ),
                        Tooltip(
                          message: 'TikTok'.toUpperCase(),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          child: IconButton(
                              onPressed: () {
                                html.window.open(
                                    "https://www.tiktok.com/@tinguar.com",
                                    "TikTok");
                              },
                              icon: SvgPicture.asset(
                                Assets.tiktok,
                                color: Colors.white,
                                width: Const.widthIcon,
                              )),
                        ),
                        const Spacer(),
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
