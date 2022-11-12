import 'package:flutter/material.dart';
import '../Constants.dart';

// The BugReportOrSuggestoins page in the settings
class BugReportOrSuggestions extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(title: const Text("Bug Report Or Suggestions"),
          backgroundColor: usaskGreen,
        ),
        body: Column(
          children: const [
            Expanded(child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text("",
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