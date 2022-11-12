import 'package:flutter/material.dart';
import '../Constants.dart';

// The About page in the settings
class About extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("About"),
      backgroundColor: usaskGreen,
      ),
      body: Column(
        children: const [
          Expanded(child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Text("Peer Health App Version 1.0\n\n    This app is intended to provide mobile access of pamphlets to students University of Saskatchewan made by  USask Student Wellness Centre and help USask students navigate resources available around campus.\n   If you need medical advice or medical attention, please consult your doctor.\n\n    Homepage icons by Icons8. Website: https://icons8.com",
              style: TextStyle(
              fontSize: 16.0,
              ),
            ),
            )
          ),
        ],
      )
    );
  }
}