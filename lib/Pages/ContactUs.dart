import 'package:flutter/material.dart';
import '../Constants.dart';

// The ContactUs page in the settings
class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
          appBar: AppBar(title: const Text("Contact Us"),
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