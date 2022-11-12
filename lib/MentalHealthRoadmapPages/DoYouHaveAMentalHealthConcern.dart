import 'package:flutter/material.dart';
import '../Constants.dart';

// The transitional page of "Do you have a mental health concern?"
class DoYouHaveAMentalHealthConcern extends StatelessWidget {
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
                  const Text("Do you have a mental health concern?",
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
                            Navigator.pushNamed(context, '/AreYouConsideringSuicideOrHarmingYourselfOrOthers');
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
                              Navigator.pushNamed(context, '/AreYouWorriedAboutSomeoneElse');
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