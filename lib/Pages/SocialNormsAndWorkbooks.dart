import 'package:flutter/material.dart';
import 'package:peer_health_test/Constants.dart';
import '../utilities/ListItem.dart';

// The social norm and workbooks option list
class SocialNormsAndWorkbooks extends StatelessWidget
{

  List<ListItem> workbookList = [
    ListItem("Social Norm Quiz", "/QuizPage"),
    ListItem("Information Sheets", "/InformationSheetsListPage"),
    ListItem("Workbooks", "/WorkbookListPage"),
  ];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text("Social Norms & Workbooks"),
          backgroundColor: usaskGreen,
        ),
        body:SafeArea(
          child: ListView.builder(itemCount:workbookList.length,
          itemBuilder: (context, index){
            return Card(
              child: ListTile(
                  // Navigate to user's choice
                  onTap: () {
                    Navigator.pushNamed(context, workbookList[index].address);
                  },
                  title: Text(workbookList[index].name),
                  trailing: const Icon(Icons.arrow_forward_ios),
                )
               );
              }
            ),
        )
          );
    }
}
