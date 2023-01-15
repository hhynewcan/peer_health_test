import 'package:url_launcher/url_launcher.dart';

void loadUrl(url) async {
  var uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.inAppWebView);
  }
}