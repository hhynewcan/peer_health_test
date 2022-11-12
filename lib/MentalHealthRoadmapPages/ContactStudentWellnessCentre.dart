import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Constants.dart';

// The transitional page of "Contact: USask Student Wellness Centre"
class ContactStudentWellnessCentre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: usaskGreen, elevation: 0,),
        backgroundColor: usaskGreen,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const Spacer(),
                // The displayed text
                const Text("Contact:\n",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.white),
                ),
                // The hyperlink to USask Student Wellness Centre
                InkWell(
                    onTap: () => launchUrl(Uri.parse("https://students.usask.ca/health/centres/wellness-centre.php"), mode: LaunchMode.externalApplication),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          text: "USask Student Wellness Centre",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 28,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                    )
                ),
                const Spacer(),
                // The Continue button
                SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: TextButton.styleFrom(
                            backgroundColor: const Color(0xffE97451)
                        ),
                        onPressed: () async {
                          Navigator.pushNamed(context, '/IfNoneOfTheseOptionsSeemLikeAGoodFit');
                        },
                        child: const Text("Continue", style: TextStyle(color: Colors.white))
                    )
                ),
                const SizedBox(height: 80,),
              ],
            ),
          ),
        )
    );
  }
}