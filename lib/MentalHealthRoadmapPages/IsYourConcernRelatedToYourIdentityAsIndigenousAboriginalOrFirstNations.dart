import 'package:flutter/material.dart';
import '../Constants.dart';

// The transitional page of "Is your concern related to your identity as indigenous, aboriginal, or First Nations?"
class IsYourConcernRelatedToYourIdentityAsIndigenousAboriginalOrFirstNations extends StatelessWidget {
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
                const Text("Is your concern related to your identity as Indigenous, Aboriginal or First Nations?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.white),
                ),
                const Spacer(),
                // The Yes button
                SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: TextButton.styleFrom(
                            backgroundColor: const Color(0xffE97451)
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/ContactAboriginalStudentsCentre');
                        },
                        child: const Text("Yes", style: TextStyle(color: Colors.white))
                    )
                ),
                // The No button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: TextButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: Color(0xffE97451))
                              )
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/IsYourConcernRelatedToBeingAnInternationalStudent');
                          },
                          child: const Text("No", style: TextStyle(color: Colors.white))
                      )
                  ),
                ),
                const SizedBox(height: 80,),
              ],
            ),
          ),
        )
    );
  }
}