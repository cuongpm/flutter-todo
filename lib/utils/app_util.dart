import 'package:url_launcher/url_launcher.dart';

launchURL(String url) async {
  if (url.isEmpty) return;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw "Could not launch $url";
  }
}