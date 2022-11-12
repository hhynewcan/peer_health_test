import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Constants.dart';

// The transitional page of "For further crisis support contact: Canada Wellness Together or Student Affairs and Outreach Team or Saskatoon Mobile Crisis or Saskatoon Crisis Intervention Services"
class ForFurtherCrisisSupportContactCanadaWellnessTogetherOrStudentAffairsAndOutreachTeamOrSaskatoonMobileCrisisOrSaskatoonCrisisInterventionServices extends StatelessWidget {
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
                const Text("For further crisis support contact:\n",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.white),
                ),
                // The hyperlink to Canada Wellness Together
                InkWell(
                    onTap: () => launchUrl(Uri.parse("https://www.wellnesstogether.ca/en-CA"), mode: LaunchMode.externalApplication),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          text: "Wellness Together Canada",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 28,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                    )
                ),
                const Text("or",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.white),
                ),
                // The hyperlink to Student Affairs and Outreach Team
                InkWell(
                    onTap: () => launchUrl(Uri.parse("https://students.usask.ca/health/centres/student-affairs-and-outreach.php"), mode: LaunchMode.externalApplication),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          text: "Student Affairs and Outreach Team",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 28,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                    )
                ),
                const Text("or",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.white),
                ),
                // The hyperlink to Saskatoon Mobile Crisis
                InkWell(
                    onTap: () => launchUrl(Uri.parse("https://saskatooncrisis.ca/services/24-hour-mobile-crisis/"), mode: LaunchMode.externalApplication),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          text: "Saskatoon Mobile Crisis",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 28,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                    )
                ),
                const Text("or",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.white),
                ),
                // The hyperlink to Saskatoon Crisis Intervention Services
                InkWell(
                    onTap: () => launchUrl(Uri.parse("https://saskatooncrisis.ca/"), mode: LaunchMode.externalApplication),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          text: "Saskatoon Crisis Intervention Services",
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
                // The If none of these options seem like a good fit button
                SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: TextButton.styleFrom(
                            backgroundColor: const Color(0xffE97451)
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/IfNoneOfTheseOptionsSeemLikeAGoodFit');
                        },
                        child: const Text("If none of these options seem like a good fit", style: TextStyle(color: Colors.white))
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