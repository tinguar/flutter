import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Recommendation {
  final String? name, source, text;

  Recommendation({
    this.name,
    this.source,
    this.text,
  });
}

List<Recommendation> recommendations(BuildContext context) => [
      Recommendation(
          name: "Adrian Villena",
          source: AppLocalizations.of(context)!.recommendationAdrianSource,
          text: AppLocalizations.of(context)!.recommendationAdrian),
      Recommendation(
          name: "Anthony Delgado",
          source:AppLocalizations.of(context)!.recommendationAnthonySource,
          text: AppLocalizations.of(context)!.recommendationAnthony),
      Recommendation(
          name: "Dario Mendoza",
          source: AppLocalizations.of(context)!.recommendationDarioSource,
          text: AppLocalizations.of(context)!.recommendationDario),
    ];
