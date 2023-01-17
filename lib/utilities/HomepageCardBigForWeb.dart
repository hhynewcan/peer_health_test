import 'package:flutter/material.dart';

// Card for main navigation button
class HomePageCardBigForWeb extends StatelessWidget
{
  final String iconPath;
  final String description;
  final VoidCallback press;

  const HomePageCardBigForWeb({
    Key? key,
    required this.iconPath,
    required this.description,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Column(
              children: <Widget>[
                const Spacer(),
                const SizedBox(height: 2.5,),
                Image.asset(iconPath, color: Colors.white,),
                const SizedBox(height: 2.5,),
                Text(description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.white
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}