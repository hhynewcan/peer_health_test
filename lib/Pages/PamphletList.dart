import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:peer_health_test/Constants.dart';
import 'package:peer_health_test/main.dart';
import '../utilities/PamphletListItem.dart';
import 'PDFViewerPage.dart';

// This page lists all the stored pamphlets in this app
class PamphletList extends StatelessWidget {

  List<PamphletListItem> pamphletList = [
    PamphletListItem("Acne and Skin Care", "assets/pamphlets/Acne and Skin Care.pdf", "assets/PamphletIcons/AcneAndSkinCare_light.png", "assets/PamphletIcons/AcneAndSkinCare_dark.png"),
    PamphletListItem("Addictions and Smoking", "assets/pamphlets/Addictions and Smoking.pdf", "assets/PamphletIcons/AddictionsAndSmoking_light.png", "assets/PamphletIcons/AddictionsAndSmoking_dark.png"),
    PamphletListItem("ADHD", "assets/pamphlets/ADHD.pdf", "assets/PamphletIcons/ADHD_light.png", "assets/PamphletIcons/ADHD_dark.png"),
    PamphletListItem("Birth Control Options", "assets/pamphlets/Birth Control.pdf", "assets/PamphletIcons/BirthControlOptions_light.png", "assets/PamphletIcons/BirthControlOptions_dark.png"),
    PamphletListItem("Body Positivity", "assets/pamphlets/Body Positivity.pdf", "assets/PamphletIcons/BodyPositivity_light.png", "assets/PamphletIcons/BodyPositivity_dark.png"),
    PamphletListItem("Breathe Well", "assets/pamphlets/Breathe Well.pdf", "assets/PamphletIcons/BreatheWell_light.png", "assets/PamphletIcons/BreatheWell_dark.png"),
    PamphletListItem("Carbs and Protein for Athletes", "assets/pamphlets/Carbs and Protein for Athletes.pdf", "assets/PamphletIcons/CarbsAndProteinForAthletes_light.png", "assets/PamphletIcons/CarbsAndProteinForAthletes_dark.png"),
    PamphletListItem("Cold and Flu", "assets/pamphlets/Cold and Flu.pdf", "assets/PamphletIcons/ColdAndFlu_light.png", "assets/PamphletIcons/ColdAndFlu_dark.png"),
    PamphletListItem("Connect Well", "assets/pamphlets/Connect Well.pdf", "assets/PamphletIcons/ConnectWell_light.png", "assets/PamphletIcons/ConnectWell_dark.png"),
    PamphletListItem("Culture Shock", "assets/pamphlets/Culture Shock.pdf", "assets/PamphletIcons/CultureShock_light.png", "assets/PamphletIcons/CultureShock_dark.png"),
    PamphletListItem("Dealing with a Breakup", "assets/pamphlets/Dealing with a Breakup.pdf", "assets/PamphletIcons/DealingWithABreakup_light.png", "assets/PamphletIcons/DealingWithABreakup_dark.png"),
    PamphletListItem("Deets on Sweets", "assets/pamphlets/Deets on Sweets.pdf", "assets/PamphletIcons/DeetsOnSweets_light.png", "assets/PamphletIcons/DeetsOnSweets_dark.png"),
    PamphletListItem("Depression", "assets/pamphlets/Depression.pdf", "assets/PamphletIcons/Depression_light.png", "assets/PamphletIcons/Depression_dark.png"),
    PamphletListItem("Eat Well", "assets/pamphlets/Eat Well.pdf", "assets/PamphletIcons/EatWell_light.png", "assets/PamphletIcons/EatWell_dark.png"),
    PamphletListItem("Everyday Back Health", "assets/pamphlets/Everyday Back Health.pdf", "assets/PamphletIcons/EverydayBackHealth_light.png", "assets/PamphletIcons/EverydayBackHealth_dark.png"),
    PamphletListItem("Facts on Fats", "assets/pamphlets/Facts on Fats.pdf", "assets/PamphletIcons/FactsOnFats_light.png", "assets/PamphletIcons/FactsOnFats_dark.png"),
    PamphletListItem("Financial Wellness", "assets/pamphlets/Financial Wellness.pdf", "assets/PamphletIcons/FinancialWellness_light.png", "assets/PamphletIcons/FinancialWellness_dark.png"),
    PamphletListItem("FOMO", "assets/pamphlets/FOMO.pdf", "assets/PamphletIcons/FoMo_light.png", "assets/PamphletIcons/FoMo_dark.png"),
    PamphletListItem("Greiving", "assets/pamphlets/Greiving.pdf", "assets/PamphletIcons/Grieving_light.png", "assets/PamphletIcons/Grieving_dark.png"),
    PamphletListItem("Headaches and Migraines", "assets/pamphlets/Headaches and Migraines.pdf", "assets/PamphletIcons/HeadachesAndMigraines_light.png", "assets/PamphletIcons/HeadachesAndMigraines_dark.png"),
    PamphletListItem("Healthy Relationships", "assets/pamphlets/Healthy Relationships.pdf", "assets/PamphletIcons/HealthyRelationships_light.png", "assets/PamphletIcons/HealthyRelationships_dark.png"),
    PamphletListItem("How to Get Through Exams", "assets/pamphlets/How to Get Through Exams.pdf", "assets/PamphletIcons/HowToGetThroughExams_light.png", "assets/PamphletIcons/HowToGetThroughExams_dark.png"),
    PamphletListItem("Irritable Bowel Syndrome", "assets/pamphlets/Irritable Bowel Syndrome.pdf", "assets/PamphletIcons/IrritableBowelSyndrome_light.png", "assets/PamphletIcons/IrritableBowelSyndrome_dark.png"),
    PamphletListItem("Men's Health", "assets/pamphlets/Men's Health.pdf", "assets/PamphletIcons/MensHealth_light.png", "assets/PamphletIcons/MensHealth_dark.png"),
    PamphletListItem("Mental Health Resources", "assets/pamphlets/Mental Health Resources.pdf", "assets/PamphletIcons/MentalHealthResources_light.png", "assets/PamphletIcons/MentalHealthResources_dark.png"),
    PamphletListItem("Move more", "assets/pamphlets/Move more.pdf", "assets/PamphletIcons/MoveMore_light.png", "assets/PamphletIcons/MoveMore_dark.png"),
    PamphletListItem("Positive Self-Talk", "assets/pamphlets/Positive Self-Talk.pdf", "assets/PamphletIcons/PositiveSelfTalk_light.png", "assets/PamphletIcons/PositiveSelfTalk_dark.png"),
    PamphletListItem("React to Sexual Assault", "assets/pamphlets/React to Sexual Assault.pdf", "assets/PamphletIcons/ReactToSexualAssault_light.png", "assets/PamphletIcons/ReactToSexualAssault_dark.png"),
    PamphletListItem("Romantic Relationships", "assets/pamphlets/Romantic Relationships.pdf", "assets/PamphletIcons/RomanticRelationships_light.png", "assets/PamphletIcons/RomanticRelationships_dark.png"),
    PamphletListItem("SAD Winter Woes", "assets/pamphlets/S.A.D Winter Woes.pdf", "assets/PamphletIcons/SADWinterWellness_light.png", "assets/PamphletIcons/SADWinterWellness_dark.png"),
    PamphletListItem("Safer Cannabis Use", "assets/pamphlets/Safer Cannabis use.pdf", "assets/PamphletIcons/SaferCannabisUse_light.png", "assets/PamphletIcons/SaferCannabisUse_dark.png"),
    PamphletListItem("Sexually Transmitted Infections", "assets/pamphlets/Sexually Transmitted Infections.pdf", "assets/PamphletIcons/SexuallyTransmittedInfections_light.png", "assets/PamphletIcons/SexuallyTransmittedInfections_dark.png"),
    PamphletListItem("Spiritual Wellness and Faith Leaders", "assets/pamphlets/Spiritual Wellness and Faith Leaders.pdf", "assets/PamphletIcons/SpiritualWellnessAndFaithLeaders_light.png", "assets/PamphletIcons/SpiritualWellnessAndFaithLeaders_dark.png"),
    PamphletListItem("Student Medical Kit", "assets/pamphlets/Student Medical Kit.pdf", "assets/PamphletIcons/ColdAndFlu_light.png", "assets/PamphletIcons/ColdAndFlu_dark.png"),
    PamphletListItem("The Truth about 'Study Drugs'", "assets/pamphlets/Study Drugs.pdf", "assets/PamphletIcons/StudyDrugs_light.png", "assets/PamphletIcons/StudyDrugs_dark.png"),
    PamphletListItem("Travel Safety", "assets/pamphlets/Travel Safety.pdf", "assets/PamphletIcons/TravelSafety_light.png", "assets/PamphletIcons/TravelSafety_dark.png"),
    PamphletListItem("Understanding Anxiety", "assets/pamphlets/Understanding Anxiety and providing support.pdf", "assets/PamphletIcons/SADWinterWellness_light.png", "assets/PamphletIcons/SADWinterWellness_dark.png")
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar:
          AppBar(centerTitle: true, title: const Text("PamphletList"),
          backgroundColor: usaskGreen,
        ),
        body: SafeArea(
          child: ListView.builder(itemCount:pamphletList.length,
            itemBuilder: (context, index){
            // List all the pamphlets
            return Card(
            child: ListTile(
              // If a pamphlet is clicked, it will navigate to the pamphlet PDF with API call
              onTap: () async {
                  final File file = await PDFApi.loadAsset(pamphletList[index].address);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),);
                },
                leading: MyApp.isDarkMode ? Image.asset(pamphletList[index].darkModeIconAddress) : Image.asset(pamphletList[index].lightModeIconAddress),
                title: Text(pamphletList[index].name
                    ),
                trailing: const Icon(Icons.arrow_forward_ios),
                )
              );
              }
            ),
        )
    );
  }

}

// API call to the pdf plugin
class PDFApi{
  static Future<File> loadAsset(String path) async{
    final data = await rootBundle.load(path);
    final bytes = data.buffer.asUint8List();

    return _storeFile(path, bytes);
  }

  static Future<File> _storeFile(String url, List<int> bytes) async{
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();

    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }
}

