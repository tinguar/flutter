import 'package:flutter/material.dart';
import 'package:web_responsive_ui/core/components/animated_counter.dart';
import 'package:web_responsive_ui/core/style/color.dart';
import 'package:web_responsive_ui/models/write.dart';
import 'package:web_responsive_ui/screens/home/components/heigh_light.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/responsi/responsive.dart';

class HighLightsInfo extends StatelessWidget {
  const HighLightsInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final al = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Responsive.isMobileLarge(context)
          ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const HeighLight(
                        counter: AnimatedCounter(
                          value: 3,
                          text: "+",
                        ),
                        label: Write.app),
                    HeighLight(
                        counter: const AnimatedCounter(
                          value: 12,
                          text: "+",
                        ),
                        label: al!.customers),
                  ],
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const HeighLight(
                        counter: AnimatedCounter(
                          value: 8,
                          text: "+",
                        ),
                        label: Write.web),
                    HeighLight(
                      counter: const AnimatedCounter(
                        value: 11,
                        text: "+",
                      ),
                      label: al.designs,
                    ),
                  ],
                )
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const HeighLight(
                    counter: AnimatedCounter(
                      value: 3,
                      text: "+",
                    ),
                    label: Write.app),
                HeighLight(
                    counter: const AnimatedCounter(
                      value: 12,
                      text: "+",
                    ),
                    label: al!.customers),
                const HeighLight(
                    counter: AnimatedCounter(
                      value: 8,
                      text: "+",
                    ),
                    label: Write.web),
                HeighLight(
                    counter: const AnimatedCounter(
                      value: 11,
                      text: "+",
                    ),
                    label: al.designs),
              ],
            ),
    );
  }
}
