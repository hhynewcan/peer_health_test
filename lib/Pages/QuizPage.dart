import 'dart:math';
import 'package:flutter/material.dart';
import 'package:peer_health_test/utilities/QuizQuestion.dart';
import '../Constants.dart';

// The social norm quiz page
class QuizPage extends StatefulWidget {

  @override
  State<QuizPage> createState() => _DoYouHaveAMentalHealthConcernState();
}

class _DoYouHaveAMentalHealthConcernState extends State<QuizPage> {

  Random random = Random();
  int index = 0;
  int newIndex = -1;
  String factText = "Fact";
  String fictionText = "Fiction";
  bool isAnswered = false;
  Color factTextColor = Colors.white;
  Color fictionTextColor = Colors.white;

  List<QuizQuestion> questions = [
    QuizQuestion("63% USask students feel that their mental wellbeing is average", true, ""),
    QuizQuestion("The top three health reasons students say impact their academics are:\n1.Stress\n2.Anxiety\n3.Sleep difficulties", true, ""),
    QuizQuestion("70% of USask students feel that mental and emotional wellbeing are prioritized at USask", true, ""),
    QuizQuestion("25% of U of S students find academics very difficult to handle or very traumatic", false, "  Answer: 62%"),
    QuizQuestion("Most USask students find supports and friends quickly and that they are not lonely", false, ""),
    QuizQuestion("Almost 5% of USask students report that their use of alcohol has affected their academic performance", true, ""),
    QuizQuestion("14% of U of S students report never using Alcohol", true, ""),
    QuizQuestion("More than 85% of USask students have used Cannabis", false, "  Answer: 47%"),
    QuizQuestion("40% reported having done something they later regretted as a consequence of their drinking", true, ""),
    QuizQuestion("Chlamydia, Genital Warts, and Genital Herpes are the most common STI's on campus", true, ""),
    QuizQuestion("Half of USask students are getting adequate exercise", false, ""),
    QuizQuestion("88% of U of S students don't eat an adequate amount of vegetables or fruit", true, "")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
        AppBar(backgroundColor: usaskGreen, elevation: 0,),
        backgroundColor: usaskGreen,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const Spacer(),
                // Display the question
                Text(questions[index].question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.white),
                ),
                const Spacer(),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 30,),
                      // The Fact choice button
                      SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: usaskGreen,
                                  elevation: 0,
                                  onPrimary: factTextColor,
                                  onSurface: usaskGreen,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80))
                              ),
                            // React based on user's choice
                              onPressed: isAnswered ? null : () {
                                setState(() {
                                  isAnswered = true;
                                  if (questions[index].trueOrFalse == true)
                                  {
                                    factText = "Fact (Correct)${questions[index].answer}";
                                    factTextColor = usaskGreen;
                                    fictionTextColor = Colors.red;
                                  }
                                  else
                                  {
                                    fictionText = "Fiction (Correct)${questions[index].answer}";
                                    factTextColor = Colors.red;
                                    fictionTextColor = usaskGreen;
                                  }
                                }
                                );
                              },
                              child: Ink(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(colors: <Color>[Colors.blue, Colors.green]),
                                  borderRadius: BorderRadius.all(Radius.circular(80.0)),
                                ),
                                child: Container(
                                  constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                                  alignment: Alignment.center,
                                  child: Text(factText, style: TextStyle(color: factTextColor))
                                    )
                                  ),
                                ),
                              ),
                      const SizedBox(height: 30,),
                      // The Fiction choice button
                      SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: usaskGreen,
                                  onPrimary: fictionTextColor,
                                  onSurface: usaskGreen,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80))
                              ),
                              // React based on user's choice
                              onPressed: isAnswered ? null : () {
                                setState(() {
                                  isAnswered = true;
                                  if (questions[index].trueOrFalse == true)
                                  {
                                    factText = "Fact (Correct)${questions[index].answer}";
                                    factTextColor = usaskGreen;
                                    fictionTextColor = Colors.red;
                                  }
                                  else
                                  {
                                    fictionText = "Fiction (Correct)${questions[index].answer}";
                                    factTextColor = Colors.red;
                                    fictionTextColor = usaskGreen;
                                  }
                                }
                                );
                              },
                              child: Ink(
                          decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: <Color>[Colors.blue, Colors.green]),
                        borderRadius: BorderRadius.all(Radius.circular(80.0)),
                      ),
                        child: Container(
                            constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                            alignment: Alignment.center,
                            child: Text(fictionText, style: TextStyle(color: fictionTextColor))
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                    ],
                  ),
                ),
                const Spacer(),
                SafeArea(
                  child: Row(
                    children: [
                    const SizedBox(width: 220),
                    Expanded(
                      // The Next button
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
                        primary: const Color(0x000c1e11),
                      ),
                      // Generate the next question and refresh
                      onPressed: () {
                        setState(() {
                          factText = "Fact";
                          fictionText = "Fiction";
                          factTextColor = Colors.white;
                          fictionTextColor = Colors.white;
                          isAnswered = false;
                          do{
                            newIndex = random.nextInt(questions.length);
                          } while (newIndex == index);
                          index = newIndex;
                        });
                      },
                      child: const Text("Next", style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    const SizedBox(width: 5),
                    ],
                  )
                )
              ],
            ),
          ),
        )
    );
  }
}