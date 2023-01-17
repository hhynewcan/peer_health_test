import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peer_health_test/Pages/BugReportOrSuggestions.dart';
import 'package:peer_health_test/Pages/ChatPage.dart';
import 'package:peer_health_test/Pages/ContactUs.dart';
import 'package:peer_health_test/Pages/Homepage.dart';
import 'package:peer_health_test/Pages/LicencesPage.dart';
import 'package:peer_health_test/Pages/PamphletList.dart';
import 'package:peer_health_test/MentalHealthRoadmapPages/DoYouHaveAMentalHealthConcern.dart';
import 'package:peer_health_test/Pages/PamphletSettings.dart';
import 'package:peer_health_test/Pages/QuizPage.dart';
import 'package:peer_health_test/Pages/UserSettings.dart';
import 'package:peer_health_test/Themes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'MentalHealthRoadmapPages/AreYouConsideringSuicideOrHarmingYourselfOrOthers.dart';
import 'MentalHealthRoadmapPages/AreYouExperiencingACrisisOrConcern.dart';
import 'MentalHealthRoadmapPages/AreYouWorriedAboutSomeoneElse.dart';
import 'MentalHealthRoadmapPages/Contact911OrRoyalUniversityHospitalOrCampusProtectiveServices.dart';
import 'MentalHealthRoadmapPages/ContactAboriginalStudentsCentre.dart';
import 'MentalHealthRoadmapPages/ContactAccessAndEquityServices.dart';
import 'MentalHealthRoadmapPages/ContactFaithLeaders.dart';
import 'MentalHealthRoadmapPages/ContactHopeForWellnessHelpline.dart';
import 'MentalHealthRoadmapPages/ContactInternationalStudentsAndStudyAbroadCentre.dart';
import 'MentalHealthRoadmapPages/ContactPrairieHarmReduction.dart';
import 'MentalHealthRoadmapPages/ContactSaskatoonSexualAssaultCrisisCentre.dart';
import 'MentalHealthRoadmapPages/ContactStudentAffairsAndOutreachTeam.dart';
import 'MentalHealthRoadmapPages/ContactStudentCentralOrStudentFacultyAdvisors.dart';
import 'MentalHealthRoadmapPages/ContactStudentWellnessCentre.dart';
import 'MentalHealthRoadmapPages/ContactUSaskStudentUnionPrideCentreOrQueerHousing.dart';
import 'MentalHealthRoadmapPages/ContactYWCASaskatoonCrisisShelterOrSaskatoonIntervalHouseOrTheLighthouseSaskatoon.dart';
import 'MentalHealthRoadmapPages/DoYouHaveASpiritualOrCulturalConcern.dart';
import 'MentalHealthRoadmapPages/DoYouHaveAnAcademicOrAdministrativeConcern.dart';
import 'MentalHealthRoadmapPages/DoYouNeedASafePlaceToGo.dart';
import 'MentalHealthRoadmapPages/DoYouNeedMentalHealthSupport.dart';
import 'MentalHealthRoadmapPages/ForFurtherCrisisSupportContactCanadaWellnessTogetherOrStudentAffairsAndOutreachTeamOrSaskatoonMobileCrisisOrSaskatoonCrisisInterventionServices.dart';
import 'MentalHealthRoadmapPages/HaveAGreatDayAndBeWell.dart';
import 'MentalHealthRoadmapPages/IfNoneOfTheseOptionsSeemLikeAGoodFit.dart';
import 'MentalHealthRoadmapPages/IsYourConcernRelatedToADisability.dart';
import 'MentalHealthRoadmapPages/IsYourConcernRelatedToBeingAnInternationalStudent.dart';
import 'MentalHealthRoadmapPages/IsYourConcernRelatedToSexualOrGenderIdentity.dart';
import 'MentalHealthRoadmapPages/IsYourConcernRelatedToYourIdentityAsIndigenousAboriginalOrFirstNations.dart';
import 'MentalHealthRoadmapPages/IsYourCrisisInRelationToAbuseOrSexualAbuse.dart';
import 'MentalHealthRoadmapPages/IsYourCrisisInRelationToSubstanceUse.dart';
import 'MentalHealthRoadmapPages/IsYourCrisisRelatedToYourIdentityAsIndigenousAboriginalOrFirstNations.dart';
import 'Pages/About.dart';
import 'Pages/InformationSheetsListPage.dart';
import 'Pages/TermsOfServicesAndPrivacyPolicy.dart';
import 'Pages/WorkbookListPage.dart';

// The main function
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MyApp.initializeSettings();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
  static final Future<SharedPreferences> preferences = SharedPreferences.getInstance();
  static late final SharedPreferences sharedPreferences;
  static late bool isDarkMode;
  static late bool swipeHorizontal;
  static late bool pageSnap;
  static late bool pageFling;

  // Initialize settings if there isn't a copy
  static void initializeSettings() async {
    sharedPreferences = await preferences;
    if (sharedPreferences.getBool("DarkMode") == null) {
      sharedPreferences.setBool("DarkMode", false);
      MyApp.isDarkMode = false;
    }
    else {
      MyApp.isDarkMode = sharedPreferences.getBool("DarkMode")!;
    }
    if (sharedPreferences.getBool("SwipeHorizontal") == null) {
      sharedPreferences.setBool("SwipeHorizontal", false);
      MyApp.swipeHorizontal = false;
    }
    else {
      MyApp.swipeHorizontal = sharedPreferences.getBool("SwipeHorizontal")!;
    }
    if (sharedPreferences.getBool("PageSnap") == null) {
      sharedPreferences.setBool("PageSnap", true);
      MyApp.pageSnap = true;
    }
    else {
      MyApp.pageSnap = sharedPreferences.getBool("PageSnap")!;
    }
    if (sharedPreferences.getBool("PageFling") == null) {
      sharedPreferences.setBool("PageFling", true);
      MyApp.pageFling = true;
    }
    else {
      MyApp.pageFling = sharedPreferences.getBool("PageFling")!;
    }
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
      final provider = Provider.of<ThemeProvider>(context);
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Homepage',
        themeMode: provider.themeMode,
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        initialRoute: '/TermsOfServicesAndPrivacyPolicy',

        // The navigation routes
        routes: {
          '/': (BuildContext context) => Homepage(),
          '/TermsOfServicesAndPrivacyPolicy': (BuildContext context) => TermsOfServicesAndPrivacyPolicy(),
          '/pamphletlist': (BuildContext context) => PamphletList(),
          '/DoYouHaveAMentalHealthConcern': (BuildContext context) => DoYouHaveAMentalHealthConcern(),
          '/AreYouConsideringSuicideOrHarmingYourselfOrOthers': (BuildContext context) => AreYouConsideringSuicideOrHarmingYourselfOrOthers(),
          '/AreYouWorriedAboutSomeoneElse': (BuildContext context) => AreYouWorriedAboutSomeoneElse(),
          '/ContactStudentAffairsAndOutreachTeam': (BuildContext context) => ContactStudentAffairsAndOutreachTeam(),
          '/HaveAGreatDayAndBeWell': (BuildContext context) => HaveAGreatDayAndBeWell(),
          '/AreYouExperiencingACrisisOrConcern': (BuildContext context) => AreYouExperiencingACrisisOrConcern(),
          '/IsYourCrisisInRelationToAbuseOrSexualAbuse': (BuildContext context) => IsYourCrisisInRelationToAbuseOrSexualAbuse(),
          '/DoYouNeedMentalHealthSupport': (BuildContext context) => DoYouNeedMentalHealthSupport(),
          '/ContactSaskatoonSexualAssaultCrisisCentre': (BuildContext context) => ContactSaskatoonSexualAssaultCrisisCentre(),
          '/IsYourCrisisInRelationToSubstanceUse': (BuildContext context) => IsYourCrisisInRelationToSubstanceUse(),
          '/ContactPrairieHarmReduction': (BuildContext context) => ContactPrairieHarmReduction(),
          '/ContactHopeForWellnessHelpline': (BuildContext context) => ContactHopeForWellnessHelpline(),
          '/DoYouNeedASafePlaceToGo': (BuildContext context) => DoYouNeedASafePlaceToGo(),
          '/ChatPage': (BuildContext context) => ChatPage(),
          '/About': (BuildContext context) => About(),
          '/QuizPage': (BuildContext context) => QuizPage(),
          '/WorkbookListPage': (BuildContext context) => WorkbookListPage(),
          '/InformationSheetsListPage': (BuildContext context) => InformationSheetsListPage(),
          '/ContactUs': (BuildContext context) => ContactUs(),
          '/Licences': (BuildContext context) => Licences(),
          '/BugReportOrSuggestions': (BuildContext context) => BugReportOrSuggestions(),
          '/PamphletSettings': (BuildContext context) => PamphletSettings(),
          '/ForFurtherCrisisSupportContactCanadaWellnessTogetherOrStudentAffairsAndOutreachTeamOrSaskatoonMobileCrisisOrSaskatoonCrisisInterventionServices': (BuildContext context) => ForFurtherCrisisSupportContactCanadaWellnessTogetherOrStudentAffairsAndOutreachTeamOrSaskatoonMobileCrisisOrSaskatoonCrisisInterventionServices(),
          '/IfNoneOfTheseOptionsSeemLikeAGoodFit': (BuildContext context) => IfNoneOfTheseOptionsSeemLikeAGoodFit(),
          '/ContactStudentWellnessCentre': (BuildContext context) => ContactStudentWellnessCentre(),
          '/DoYouHaveASpiritualOrCulturalConcern': (BuildContext context) => DoYouHaveASpiritualOrCulturalConcern(),
          '/ContactFaithLeaders': (BuildContext context) => ContactFaithLeaders(),
          '/ContactUSaskStudentUnionPrideCentreOrQueerHousing': (BuildContext context) => ContactUSaskStudentUnionPrideCentreOrQueerHousing(),
          '/IsYourConcernRelatedToSexualOrGenderIdentity': (BuildContext context) => IsYourConcernRelatedToSexualOrGenderIdentity(),
          '/ContactAboriginalStudentsCentre': (BuildContext context) => ContactAboriginalStudentsCentre(),
          '/ContactInternationalStudentsAndStudyAbroadCentre': (BuildContext context) => ContactInternationalStudentsAndStudyAbroadCentre(),
          '/IsYourConcernRelatedToBeingAnInternationalStudent': (BuildContext context) => IsYourConcernRelatedToBeingAnInternationalStudent(),
          '/IsYourConcernRelatedToADisability': (BuildContext context) => IsYourConcernRelatedToADisability(),
          '/ContactAccessAndEquityServices': (BuildContext context) => ContactAccessAndEquityServices(),
          '/DoYouHaveAnAcademicOrAdministrativeConcern': (BuildContext context) => DoYouHaveAnAcademicOrAdministrativeConcern(),
          '/ContactStudentCentralOrStudentFacultyAdvisors': (BuildContext context) => ContactStudentCentralOrStudentFacultyAdvisors(),
          '/IsYourConcernRelatedToYourIdentityAsIndigenousAboriginalOrFirstNations': (BuildContext context) => IsYourConcernRelatedToYourIdentityAsIndigenousAboriginalOrFirstNations(),
          '/ContactYWCASaskatoonCrisisShelterOrSaskatoonIntervalHouseOrTheLighthouseSaskatoon': (BuildContext context) => ContactYWCASaskatoonCrisisShelterOrSaskatoonIntervalHouseOrTheLighthouseSaskatoon(),
          '/IsYourCrisisRelatedToYourIdentityAsIndigenousAboriginalOrFirstNations': (BuildContext context) => IsYourCrisisRelatedToYourIdentityAsIndigenousAboriginalOrFirstNations(),
          '/Contact911OrRoyalUniversityHospitalOrCampusProtectiveServices': (BuildContext context) => Contact911OrRoyalUniversityHospitalOrCampusProtectiveServices(),
          '/UserSettings': (BuildContext context) => UserSettings()
        },
        );
      },
    );
}
