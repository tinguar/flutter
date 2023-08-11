import 'package:flutter/material.dart';
import 'package:web_responsive_ui/core/style/color.dart';
import 'package:web_responsive_ui/models/Recommendation.dart';
import 'package:web_responsive_ui/screens/home/components/recommendation_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Recommendations extends StatefulWidget {
  const Recommendations({
    Key? key,
  }) : super(key: key);

  @override
  State<Recommendations> createState() => _RecommendationsState();
}

class _RecommendationsState extends State<Recommendations> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final al = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            al!.recommendations,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          Scrollbar(
            controller: _controller,
            thumbVisibility: true,
            // showTrackOnHover: true,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              controller: _controller,
              child: Row(
                children: List.generate(
                    recommendations(context).length,
                    (index) => Padding(
                          padding: const EdgeInsets.only(right: defaultPadding),
                          child: RecommendationCard(
                            recommendation: recommendations(context)[index],
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
