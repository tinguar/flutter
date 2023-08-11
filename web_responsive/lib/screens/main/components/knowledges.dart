import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:web_responsive_ui/core/assets/assets.dart';
import 'package:web_responsive_ui/core/style/color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Knowledges extends StatelessWidget {
  const Knowledges({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final al = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            al!.knowledge,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        KnowledgeText(text: al.flutterDart),
        KnowledgeText(text: al.htmlCssJavaScript),
        KnowledgeText(text: al.wordPresEcommerce),
        KnowledgeText(text: al.linux),
      ],
    );
  }
}

class KnowledgeText extends StatelessWidget {
  const KnowledgeText({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: Row(
        children: [
          SvgPicture.asset(Assets.check),
          const SizedBox(width: defaultPadding / 2),
          Text(text)
        ],
      ),
    );
  }
}
