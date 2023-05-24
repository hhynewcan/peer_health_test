import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:peer_health_test/Pages/Homepage.dart';
import 'package:peer_health_test/Pages/HomepageForiPad.dart';
import '../Constants.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'HomePageForWeb.dart';

// The TermsOfServicesAndPrivacyPolicy page
class TermsOfServicesAndPrivacyPolicy extends StatefulWidget {
  @override
  State<TermsOfServicesAndPrivacyPolicy> createState() => _TermsOfServicesAndPrivacyPolicyState();
}

class _TermsOfServicesAndPrivacyPolicyState extends State<TermsOfServicesAndPrivacyPolicy> {

  bool isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Terms of Services"),
        automaticallyImplyLeading: false,
        backgroundColor: usaskGreen,),
      body: Column(children: [
        const Expanded(child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          // The displayed text
          child: Text(
            "\n     This app is intended to provide mobile access of pamphlets from Student Wellness Centre to students of University of Saskatchewan, and help students of University of Saskatchewan navigate available resources around campus.\n\n    Contents of this app are not to be used as professional medical advice. If you need medical advice or medical attention, please consult your doctor.",
            style: TextStyle(
              fontSize: 16.0,
                ),
              ),
            ),
          )
        ),
        Row(
          children: [
            Checkbox(
              value: isAgreed,
              activeColor: usaskGreen,
              onChanged: (value) {
                setState(() {
                  isAgreed = value ?? false;
                });
              },
            ),
            const Expanded(
              child: Text(
                  "I have read and accept these terms and conditions.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
          ],
        ),
        SafeArea(
          child: Row(
            children: [
              const SizedBox(width: 5),
              // The Continue button
              Expanded(
                child: ElevatedButton(
                  onPressed: isAgreed ? toHomePage : null,
                  style: ElevatedButton.styleFrom(
                    primary: usaskGreen,
                  ),
                  child: const Text("Continue"),
                ),
              ),
              const SizedBox(width: 5),
              // The Decline button
              Expanded(
                child: ElevatedButton(
                    onPressed: () => exit(0),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: const Text("Decline")),
              ),
              const SizedBox(width: 5),
            ],
          ),
        ),
      ],),
    );
  }

  // Navigate to different homepages based on the device is iPad or not
  Future<void> toHomePage()
  async {
    if (kIsWeb){
      Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => HomepageForWeb(), transitionDuration: Duration.zero,),);
    }
    else if (Platform.isMacOS){
      Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => Homepage(), transitionDuration: Duration.zero,),);
    }
    else if (Platform.isWindows){
      Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => Homepage(), transitionDuration: Duration.zero,),);
    }
    else if (Platform.isAndroid)
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
  }
}