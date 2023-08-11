import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../core/components/locale.dart';
import '../../core/style/color.dart';

class CupertinoSwitchW extends StatelessWidget {
  final width;
  final height;
  const CupertinoSwitchW({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var language = Provider.of<UtilAppLocale>(context);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '  EN',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          CupertinoSwitch(
            onChanged: (bool value) {
              value == true
                  ? language.changeLocale(const Locale('es'))
                  : language.changeLocale(const Locale('en'));
            },
            value: language.locale == const Locale('en') ? false : true,
          ),
          const Text(
            'ES  ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
