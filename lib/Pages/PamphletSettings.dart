import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peer_health_test/Constants.dart';
import '../main.dart';

// This page allows users to modify how PDF plugin functions
class PamphletSettings extends StatefulWidget
{
  @override
  State<PamphletSettings> createState() => _PamphletSettingsState();
}

class _PamphletSettingsState extends State<PamphletSettings> {

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text("Pamphlet Settings"),
          backgroundColor: usaskGreen,
        ),
        body:SafeArea(
          child: ListView(
            // Display options
            children: [
              buildHorizontalSwipeOption(),
              buildPageSnapOption(),
              buildPageFlingOption()
            ],
        )
      )
    );
  }

  // Change the swipe between horizontally or vertically
  Widget buildHorizontalSwipeOption() {
    return Card(
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            const SizedBox(width: 15,),
            const Text("Swipe Horizontally",style: TextStyle(
              fontSize: 16,)),
            const Spacer(),
            CupertinoSwitch(
              value: MyApp.swipeHorizontal,
              activeColor: usaskGreen,
              trackColor: Colors.grey,
              onChanged: (bool value) {
                setState(() {
                  MyApp.swipeHorizontal = value;
                  MyApp.sharedPreferences.setBool("SwipeHorizontal", value);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  // Change the snap behaviour
  Widget buildPageSnapOption() {
    return Card(
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            const SizedBox(width: 15,),
            const Text("Snap Page",style: TextStyle(
              fontSize: 16,)),
            const Spacer(),
            CupertinoSwitch(
              value: MyApp.pageSnap,
              activeColor: usaskGreen,
              trackColor: Colors.grey,
              onChanged: (bool value) {
                setState(() {
                  MyApp.pageSnap = value;
                  MyApp.sharedPreferences.setBool("PageSnap", value);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  // Change whether or not the users can scroll several page at the same time
  Widget buildPageFlingOption() {
    return Card(
      child: Container(
        height: 50,
        child: Row(
          children: [
            const SizedBox(width: 15,),
            const Text("Scroll Only One Page Each Time",style: TextStyle(
              fontSize: 16,)),
            const Spacer(),
            CupertinoSwitch(
              value: MyApp.pageFling,
              activeColor: usaskGreen,
              trackColor: Colors.grey,
              onChanged: (bool value) {
                setState(() {
                  MyApp.pageFling = value;
                  MyApp.sharedPreferences.setBool("PageFling", value);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
