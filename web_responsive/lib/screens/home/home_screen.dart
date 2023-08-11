import 'package:flutter/material.dart';
import 'package:web_responsive_ui/core/responsi/responsive.dart';
import 'package:web_responsive_ui/core/style/color.dart';
import 'package:web_responsive_ui/screens/home/components/banner_desktop.dart';
import 'package:web_responsive_ui/screens/main/main_screen.dart';
import 'components/footer.dart';
import 'components/high_lights_info.dart';
import 'components/home_banner.dart';
import 'components/my_projects.dart';
import 'components/recommendations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    final al = AppLocalizations.of(context);

    return MainScreen(
      children: [
        Responsive(
          mobile: Container(),
          desktop: const BannerDesktop(),
        ),
        const HomeBanner(),
        const HighLightsInfo(),
        MyProjects(
          myProjectsTitle: al!.myProjects,
        ),
        const Recommendations(),
        const Footer()
      ],
    );
  }
}

class FlutterCodedText extends StatelessWidget {
  const FlutterCodedText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text.rich(TextSpan(text: "<", children: [
      TextSpan(
        text: "flutter",
        style: TextStyle(color: primaryColor),
      ),
      TextSpan(text: ">")
    ]));
  }
}
