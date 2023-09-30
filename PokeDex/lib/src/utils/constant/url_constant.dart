import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL({required String url}) async {
  if (!await launchUrl(Uri.parse(url),mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $url';
  }
}