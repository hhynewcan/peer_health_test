import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Constants.dart';
import '../Pages/Homepage.dart';
import '../Pages/HomepageForiPad.dart';

// The result page of "If none of these options seem like a good fit"
class IfNoneOfTheseOptionsSeemLikeAGoodFit extends StatelessWidget {
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
                const Text("Contact\n",
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
                          text: "USask Wellness Centre",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 28,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                    )
                ),
                const Text("or\nCall 8-1-1 (Healthline) to ask about community support services",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.white),
                ),
                const Spacer(),
                // The Back to Homepage button
                SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: TextButton.styleFrom(
                            backgroundColor: const Color(0xffE97451)
                        ),
                        // Choose which version of homepage to go to based on whether the device is ipad or not
                        onPressed: () async {
                          if (Platform.isAndroid)
                          {
                            Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => Homepage(), transitionDuration: Duration.zero,),);
                          }
                          else
                          {
                            DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
                            IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
                            if (iosDeviceInfo != null && iosDeviceInfo.model!.toLowerCase().contains("ipad"))
                            {
                              Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => HomepageForiPad(), transitionDuration: Duration.zero,),);
                            }
                            else
                            {
                              Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => Homepage(), transitionDuration: Duration.zero,),);
                            }
                          }
                        },
                        child: const Text("Back to Homepage", style: TextStyle(color: Colors.white))
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