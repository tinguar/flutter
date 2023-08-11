import 'package:flutter/material.dart';
import 'package:web_responsive_ui/core/style/color.dart';
import 'package:web_responsive_ui/models/privacy.dart';
import 'package:web_responsive_ui/screens/views/privacy_policy/components/privacy_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Privacys extends StatelessWidget {
  const Privacys({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final al = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Text(
            al!.privacys,
            style: Theme.of(context).textTheme.titleLarge,
          )),
          const SizedBox(
            height: defaultPadding,
          ),
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: List.generate(
                    privacys.length,
                    (index) => Padding(
                          padding: const EdgeInsets.only(right: defaultPadding),
                          child: PrivacyCard(
                            privacy: privacys[index],
                          ),
                        )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
