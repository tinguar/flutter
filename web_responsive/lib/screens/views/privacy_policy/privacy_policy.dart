import 'package:flutter/material.dart';
import 'package:web_responsive_ui/screens/views/privacy_policy/components/privacys.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);
  static const String route = '/politicas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: const [
                Privacys(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
