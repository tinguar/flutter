import 'package:flutter/material.dart';
import 'package:web_responsive_ui/core/style/color.dart';
import 'package:web_responsive_ui/core/style/constants.dart';
import 'package:web_responsive_ui/models/Project.dart';
import 'package:web_responsive_ui/core/responsi/responsive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:universal_html/html.dart' as html;

import '../../widget/tootil.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key,
    required this.project,
  }) : super(key: key);

  final Project? project;

  @override
  Widget build(BuildContext context) {
    final al = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      color: secondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project!.title!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const Spacer(),
          Text(
            project!.description!,
            maxLines: Responsive.isMobileLarge(context) ? 3 : 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(height: 1.5),
          ),
          const Spacer(),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  html.window.open(
                      project!.link!.toString(), project!.link.toString());
                },
                child: Text(
                  al!.seeMore,
                  style: const TextStyle(color: primaryColor),
                ),
              ),
              Expanded(child: Container()),
              Text(
                al.madeWith,
                style: const TextStyle(color: primaryColor),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(),
              ),
              TooltipSvgWidget(
                project!.name1!,
                project!.iconImage!,
                Const.widthIcon,
                Const.heightIcon,
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 3)),
              TooltipSvgWidget(
                project!.name2!,
                project!.iconImage1!,
                Const.widthIcon,
                Const.heightIcon,
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 3)),
              TooltipSvgWidget(
                project!.name3!,
                project!.iconImage2!,
                Const.widthIcon,
                Const.heightIcon,
              ),
            ],
          )
        ],
      ),
    );
  }
}
