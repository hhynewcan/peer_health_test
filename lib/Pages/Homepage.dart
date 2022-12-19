import 'package:flutter/material.dart';
import 'package:peer_health_test/Constants.dart';
import 'package:peer_health_test/Pages/PamphletList.dart';
import 'package:peer_health_test/Pages/UserSettings.dart';
import 'package:peer_health_test/utilities/HomepageCardBig.dart';
import 'package:peer_health_test/utilities/HomepageCardSmall.dart';
import 'SocialNormsAndWorkbooks.dart';

// The Homepage
class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: usaskGreen,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Top introductory section
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/icons/BeWellLogo.png'),
                    const Center(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'App by\nPeer Health USask',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Main navigation buttons
              Flexible(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GridView.count(crossAxisCount: 2,
                      shrinkWrap: true,
                      children: <Widget>[
                        HomePageCardBig(iconPath: 'assets/icons/icons8-folded-booklet-100.png', description: 'Pamphlets', press: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PamphletList()));
                        }),
                        HomePageCardBig(iconPath: 'assets/icons/icons8-study-100.png', description: "Social Norms & Workbooks", press: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SocialNormsAndWorkbooks()));
                        },),
                        HomePageCardBig(iconPath: 'assets/icons/icons8-search-chat-100.png', description: "Mental Health Roadmap", press: (){
                          Navigator.pushNamed(context, '/ChatPage');
                        }),
                        HomePageCardBig(iconPath: 'assets/icons/icons8-settings-100.png', description: "Settings", press: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => UserSettings()));},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Links to Peer Health
              Flexible(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Links to Peer Health",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 5,),
                    GridView.count(crossAxisCount: 6,
                      shrinkWrap: true,
                      children: const <Widget>[
                        HomePageCardSmall(iconPath: "assets/icons/icons8-website-50.png", description: "Website", url: "https://students.usask.ca/health/centres/peer-health.php"),
                        HomePageCardSmall(iconPath: "assets/icons/icons8-blog-50.png", description: "Blog", url: "https://peerhealthusask.wordpress.com/"),
                        HomePageCardSmall(iconPath: "assets/icons/icons8-browse-podcasts-50.png", description: "Podcast", url: "https://our1in3autoethnography.libsyn.com/"),
                        HomePageCardSmall(iconPath: "assets/icons/icons8-facebook-50.png", description: "Facebook", url: "https://www.facebook.com/peerhealthusask/",),
                        HomePageCardSmall(iconPath: "assets/icons/icons8-instagram-50.png", description: "Instagram", url: "https://www.instagram.com/peerhealthusask/",),
                        HomePageCardSmall(iconPath: "assets/icons/icons8-youtube-50.png", description: "Youtube", url: "https://www.youtube.com/channel/UCfPGA-xRCEBCIECW5h2TpgA")
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}