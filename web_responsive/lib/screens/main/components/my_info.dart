import 'package:flutter/material.dart';
import 'package:web_responsive_ui/core/assets/assets.dart';
import 'package:web_responsive_ui/models/write.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.50,
      child: Container(
        color: const Color(0xFF242430),
        child: Column(
          children: [
            const Spacer(
              flex: 2,
            ),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(Assets.profileimage),
            ),
            const Spacer(),
            Text(
              Write.name,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Text(
              Write.specialty,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w200,
                height: 1.5,
              ),
            ),
            const Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}
