import 'package:flutter/material.dart';
import 'package:peer_health_test/Constants.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utilities/ListItem.dart';

// This page includes the links to download information sheets
class InformationSheetsListPage extends StatelessWidget
{

  List<ListItem> informationSheetList = [
    ListItem("Taking Care of Your Mental Health", "https://students.usask.ca/documents/counselling/mental-heath-tear-sheet.pdf"),
    ListItem("Abdominal Breathing", "https://students.usask.ca/documents/counselling/abdominal-breathing.pdf"),
    ListItem("Achieving Balance", "https://students.usask.ca/documents/counselling/achieving-balance.pdf"),
    ListItem("Assertive Communication", "https://students.usask.ca/documents/counselling/assertive-communication.pdf"),
    ListItem("Depression", "https://students.usask.ca/documents/counselling/depression.pdf"),
    ListItem("What to do When a Friend is Depressed", "https://students.usask.ca/documents/counselling/friend-depressed.pdf"),
    ListItem("Exam Anxiety", "https://students.usask.ca/documents/counselling/exam-anxiety.pdf"),
    ListItem("Grieving Unexpected Death", "https://students.usask.ca/documents/counselling/grieving-unexpected-death.pdf"),
    ListItem("Grieving", "https://students.usask.ca/documents/counselling/grieving.pdf"),
    ListItem("Insomnia", "https://students.usask.ca/documents/counselling/insomnia.pdf"),
    ListItem("Managing Anger", "https://students.usask.ca/documents/counselling/managing-anger.pdf"),
    ListItem("Surviving Finals", "https://students.usask.ca/documents/counselling/surviving-finals.pdf"),
    ListItem("Panic Attacks", "https://students.usask.ca/documents/counselling/panic-attacks.pdf"),
    ListItem("Self-Esteem", "https://students.usask.ca/documents/counselling/self-esteem.pdf"),
    ListItem("Social Anxiety", "https://students.usask.ca/documents/counselling/social-anxiety.pdf"),
    ListItem("Stress Management", "https://students.usask.ca/documents/counselling/stress-management.pdf"),
    ListItem("Succeeding at University", "https://students.usask.ca/documents/counselling/succeeding-at-university.pdf"),
    ListItem("Supporting a Friend Who is Anxious", "https://students.usask.ca/documents/counselling/supporting-anxious-friend.pdf"),
    ListItem("When a Relationship Ends", "https://students.usask.ca/documents/counselling/relationship-ends.pdf"),
    ListItem("Dealing with Reverse Culture Shock", "https://students.usask.ca/documents/counselling/reverse-culture-shock.pdf"),
    ListItem("Assessing for Culture Shock", "https://students.usask.ca/documents/counselling/assessing-culture-shock.pdf"),
    ListItem("Dealing with Culture Shock", "https://students.usask.ca/documents/counselling/culture-shock.pdf"),
    ListItem("Managing After a Traumatic Event", "https://students.usask.ca/documents/counselling/managing-trauma.pdf"),
    ListItem("Aerobic Guidelines", "https://students.usask.ca/documents/counselling/aerobic-guidelines.pdf")
  ];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text("Information Sheets"),
          backgroundColor: usaskGreen,
        ),
        body:SafeArea(
          child: ListView.builder(itemCount:informationSheetList.length,
              itemBuilder: (context, index){
            // Make all the list items into a list and display
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

  // Loading designated URL
  void _loadURL(String url) async {
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
