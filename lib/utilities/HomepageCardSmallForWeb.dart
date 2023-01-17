import 'package:flutter/material.dart';
import 'package:peer_health_test/utilities/LoadUrl.dart';

// Card for link button
class HomePageCardSmallForWeb extends StatelessWidget
{
  final String iconPath;
  final String description;
  final String url;

  const HomePageCardSmallForWeb({
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
              onTap: () => loadUrl(url),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Image.asset(iconPath, color: Colors.white,),
                    Text(description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 9,
                          color: Colors.white
                      ),
                    ),
                    Spacer()
                  ],
                ),
              )
          )
      ),
    );
  }
}