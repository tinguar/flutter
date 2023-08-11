import 'package:flutter/material.dart';
import 'package:web_responsive_ui/core/assets/assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Project {
  final String? title,
      link,
      description,
      iconImage,
      iconImage1,
      iconImage2,
      name1,
      name2,
      name3;

  Project({
    this.title,
    this.description,
    this.link,
    this.iconImage,
    this.iconImage1,
    this.iconImage2,
    this.name1,
    this.name2,
    this.name3,
  });
}

List<Project> projects(BuildContext context) => [
      Project(
        title: 'Streaming Ec',
        description: AppLocalizations.of(context)!.projectStoreEc,
        link: 'https://streamingecu.com/',
        iconImage: Assets.html,
        iconImage1: Assets.css,
        iconImage2: Assets.javascript,
        name1: Assets.htmlName,
        name2: Assets.cssName,
        name3: Assets.javascriptName,
      ),
      Project(
        title: 'Projection',
        description: AppLocalizations.of(context)!.projectProjection,
        link: 'https://projectionec.com/',
        iconImage: Assets.html,
        iconImage1: Assets.css,
        iconImage2: Assets.javascript,
        name1: Assets.htmlName,
        name2: Assets.cssName,
        name3: Assets.javascriptName,
      ),
      Project(
        title: 'Inox Hierro',
        description: AppLocalizations.of(context)!.projectInoxHierro,
        link: 'https://inoxhierroec.com/',
        iconImage: Assets.html,
        iconImage1: Assets.jimdo,
        iconImage2: Assets.javascript,
        name1: Assets.htmlName,
        name2: Assets.jimdoName,
        name3: Assets.javascriptName,
      ),
      Project(
        title: 'All Clean Ways',
        description: AppLocalizations.of(context)!.projectAllCleanWays,
        link: 'https://allcleanways.com/',
        iconImage: Assets.html,
        iconImage1: Assets.wordpress,
        iconImage2: Assets.javascript,
        name1: Assets.htmlName,
        name2: Assets.wordpressName,
        name3: Assets.javascriptName,
      ),
      Project(
        title: 'Linterna',
        description: AppLocalizations.of(context)!.projectLinterna,
        link:
            'https://play.google.com/store/apps/details?id=com.gabrielcodigo.com.app_linterna',
        iconImage: Assets.dart,
        iconImage1: Assets.flutter,
        iconImage2: Assets.vscode,
        name1: Assets.dartName,
        name2: Assets.flutterName,
        name3: Assets.vscodeName,
      ),
    ];
