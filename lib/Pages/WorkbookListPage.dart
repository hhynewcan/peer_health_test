import 'package:flutter/material.dart';
import 'package:peer_health_test/Constants.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utilities/ListItem.dart';

// Display all workbooks as a list
class WorkbookListPage extends StatelessWidget
{

  List<ListItem> informationSheetList = [
    ListItem("Guide to Healthy Relationships", "https://students.usask.ca/documents/counselling/guide-healthy-relationships.pdf"),
    ListItem("Mastering Exam Anxiety", "https://students.usask.ca/documents/counselling/mastering-exam-anxiety.pdf"),
    ListItem("Problem Solving and Decision Making", "https://students.usask.ca/documents/counselling/problem-solving-decision-making.pdf"),
    ListItem("Defining Your Interests, Values and Goals", "https://students.usask.ca/documents/counselling/defining-your-interests.pdf"),
    ListItem("Understanding Depression and Developing a Plan to Overcome it", "https://students.usask.ca/documents/counselling/depression--developing-plan-to-overcomet.pdf"),
    ListItem("Taking Care of Your Physical Health", "https://students.usask.ca/documents/counselling/understanding-depression-physical-health.pdf"),
    ListItem("Challenging Depressive Thinking", "https://students.usask.ca/documents/counselling/depression-challenging-depressive-thinking.pdf"),
    ListItem("Managing Your Emotions", "https://students.usask.ca/documents/counselling/understanding-depression-managing-your-emotion.pdf"),
    ListItem("Making Behaviour Changes", "https://students.usask.ca/documents/counselling/understanding-depression-making-behaviour-changes.pdf"),
    ListItem("Understanding Anxiety and Key Treatment Strategies", "https://students.usask.ca/documents/counselling/anxiety-key-strategies.pdf"),
    ListItem("Social Anxiety: Challenging Anxious Thinking", "https://students.usask.ca/documents/counselling/social-anxiety-challenging-anxious-thinking.pdf"),
    ListItem("Social Anxiety: Making Behaviour Changes", "https://students.usask.ca/documents/counselling/social--anxiety-making-behavioural-changes.pdf"),
    ListItem("Understanding Worry and How to Overcome It", "https://students.usask.ca/documents/counselling/understanding-worry.pdf"),
    ListItem("Panic: Challenging Anxious Thinking", "https://students.usask.ca/documents/counselling/panic-challenging-anxious-thinking.pdf"),
    ListItem("Panic: Making Behavioural Changes", "https://students.usask.ca/documents/counselling/panic-making-behaviour-changes.pdf")
  ];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text("Workbooks"),
          backgroundColor: usaskGreen,
        ),
        body:SafeArea(
          child: ListView.builder(itemCount:informationSheetList.length,
              itemBuilder: (context, index){
                return Card(
                    child: ListTile(
                      onTap: () {
                        _loadURL(informationSheetList[index].address);
                      },
                      title: Text(informationSheetList[index].name),
                      trailing: const Icon(Icons.download),
                    )
                );
              }
          ),
        )
    );
  }
  // Download the selected workbook
  void _loadURL(String url) async {
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
