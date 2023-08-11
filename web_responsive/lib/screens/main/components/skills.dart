import 'package:flutter/material.dart';
import 'package:web_responsive_ui/core/components/animated_progress_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:web_responsive_ui/core/style/color.dart';
import 'package:web_responsive_ui/models/write.dart';

class Skills extends StatelessWidget {
  const Skills({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final al = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            al!.skills,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Row(
          children: const [
            Expanded(
                child: AnimatedCircularProgressIndicator(
                    percentage: 0.75, label: Write.flutter)),
            SizedBox(width: defaultPadding / 2),
            // Expanded(
            //     child: AnimatedCircularProgressIndicator(
            //         percentage: 0.70, label: Write.python)),
            SizedBox(width: defaultPadding / 2),
            Expanded(
                child: AnimatedCircularProgressIndicator(
                    percentage: 0.95, label: Write.wordPres))
          ],
        )
      ],
    );
  }
}
