import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peer_health_test/Constants.dart';
import 'package:peer_health_test/main.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Themes.dart';

// The UserSettings page
class UserSettings extends StatefulWidget
{

  @override
  State<UserSettings> createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  late SharedPreferences settings;

  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text("Settings"),
          backgroundColor: usaskGreen,
        ),
        body:SafeArea(
          child: ListView(
            // Build different options
            children: [
              buildDarkModeOption(),
              buildPamphletSettings(),
              buildContactUs(),
              buildBugReportOrSuggestions(),
              buildAbout(),
              buildLicences()
            ],
                )
          ),
    );
  }

  Widget buildDarkModeOption() {
    return Card(
      child: Container(
        height: 50,
        child: Row(
          children: [
            const SizedBox(width: 15,),
            const Text("Dark Mode",style: TextStyle(
              fontSize: 16,)),
              const Spacer(),
              CupertinoSwitch(
                  value: MyApp.isDarkMode,
                  activeColor: usaskGreen,
                  trackColor: Colors.grey,
                  onChanged: (bool value) {
                    MyApp.isDarkMode = value;
                    MyApp.sharedPreferences.setBool("DarkMode", value);
                    final provider = Provider.of<ThemeProvider>(context, listen: false);
                    provider.toggleTheme(MyApp.isDarkMode);
                 },
                ),
          ],
        ),
      ),
    );
  }

  Widget buildPamphletSettings() {
    return  Card(
        child: Container(
        height: 50,
        child: ListTile(
          onTap: () async {
            Navigator.pushNamed(context, "/PamphletSettings");
          },
          title: const Text("Pamphlet Settings"),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      )
    );
  }

  Widget buildContactUs() {
    return  Card(
        child: Container(
          height: 50,
          child: ListTile(
            onTap: () async {
              Navigator.pushNamed(context, "/ContactUs");
            },
            title: const Text("Contact Us"),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        )
    );
  }
  Widget buildBugReportOrSuggestions() {
    return  Card(
      child: Container(
        height: 50,
        child: ListTile(
          onTap: () async {
          Navigator.pushNamed(context, "/BugReportOrSuggestions");
        },
        title: const Text("Bug Report Or Suggestions"),
        trailing: const Icon(Icons.arrow_forward_ios),
          ),
        )
      );
  }

  Widget buildAbout() {
    return  Card(
        child: Container(
          height: 50,
          child: ListTile(
            onTap: () async {
              Navigator.pushNamed(context, "/About");
            },
            title: const Text("About"),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        )
    );
  }

  Widget buildLicences() {
    return  Card(
        child: Container(
          height: 50,
          child: ListTile(
            onTap: () async {
              Navigator.pushNamed(context, "/Licences");
            },
            title: const Text("Licences"),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        )
    );
  }
}
