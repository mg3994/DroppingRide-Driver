
import 'dart:io';

import 'package:restart_tagxi/db/app_database.dart';

import '../features/language/domain/models/language_listing_model.dart';

class AppConstants {
  static const String title = 'Dropping Ride Driver';
  static const String baseUrl = 'https://onboarding.droppingride.com/';
  static String firbaseApiKey = (Platform.isAndroid)
      ? "AIzaSyCMyZR-VFeMh4uc9aGMn1Bi0pjcw2jmbgo"
      : "ios firebase api key";
  static String firebaseAppId =
      (Platform.isAndroid) ? "1:331750600814:android:86373cf08e69c20aaef67f" : "ios firebase app id";
  static String firebasemessagingSenderId = (Platform.isAndroid)
      ? "331750600814"
      : "ios firebase sender id";
  static String firebaseProjectId = (Platform.isAndroid)
      ? "dropping-app-2025"
      : "ios firebase project id";

  static String mapKey =
       (Platform.isAndroid) ? "AIzaSyAoi9wM6k_nXs7W6-5CLv3MuoEDuWoiRcA" : 'ios map key';
  static const String privacyPolicy =  'https://docs.google.com/document/d/1zOWR2AoJIxrMTCkgRm6KJNU37APQmg-89a_65mvpMj4/edit?usp=sharing';
  static const String termsCondition = 'https://docs.google.com/document/d/1tlgCMtki56tvbjVOc1Wf_vPS3o_7NK4u5pQk2Vs1gl4/edit?usp=sharing';

  static List<LocaleLanguageList> languageList = [
    LocaleLanguageList(name: 'English', lang: 'en',flag: '${baseUrl}image/country/flags/US.png'),
    // LocaleLanguageList(name: 'Arabic', lang: 'ar'),
    LocaleLanguageList(name: 'French', lang: 'fr',flag: '${baseUrl}image/country/flags/FR.png'),
    // LocaleLanguageList(name: 'Spanish', lang: 'es')
  ];
  static String packageName = '';//  'com.droppingride.driver'; // TODO: MG:
  // Android
// On Android, buildSignature retrieves the app’s signing certificate’s SHA1 fingerprint. However, starting from Flutter 3.0 and with the latest Android SDK changes, buildSignature always returns an empty string ("") because the method to obtain it (getPackageInfo().signatures) was deprecated in recent Android versions.
  static String signKey = ''; // TODO: MG:
  
  double headerSize = 18.0;
  double subHeaderSize = 14.0;
  double labelTextSize = 8.0; //Added: by MG:
  double buttonTextSize = 14.0; 
}

bool showBubbleIcon = false;
bool subscriptionSkip = false;
String choosenLanguage = 'en';
String mapType = 'google_map';
bool isAppMapChange = false;

AppDatabase db = AppDatabase();
