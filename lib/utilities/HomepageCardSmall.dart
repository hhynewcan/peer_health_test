import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Card for link button
class HomePageCardSmall extends StatelessWidget
{
  final String iconPath;
  final String description;
  final String url;

  const HomePageCardSmall({
    Key? key,
    required this.iconPath,
    required this.description,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap:
            _loadURL,
          child: Container(
            decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: <Widget>[
          Image.asset(iconPath, color: Colors.white,),
            Text(description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 9,
                  color: Colors.white
               ),
              ),
             ],
            ),
            )
          )
        ),
        );
  }

  // Open the selected link
  void _loadURL() async {
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}