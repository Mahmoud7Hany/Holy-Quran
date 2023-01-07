import 'package:shared_preferences/shared_preferences.dart';

//  صفحه الثوابت داخل التطبيق
String arabicFont = "quran";
double arabicFontSize = 24.0;
double musahfFontSize = 40.0;

int bookMarkedAyah = 1;
int bookMarkedSurah = 1;
bool fabIsClicked = true;

readBookMark() async {
  print("read book mark called");
  final prefs = await SharedPreferences.getInstance();
  try {
    bookMarkedAyah = prefs.getInt("ayah")!;
    bookMarkedSurah = prefs.getInt("surah")!;
    return true;
  } catch (e) {
    return false;
  }
}

// shared_preferences دي خاصه ب
Future saveSettings() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt("arabicFontSize", arabicFontSize.toInt());
  await prefs.setInt("musahfFontSize", musahfFontSize.toInt());
}

Future getSettings() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    arabicFontSize = prefs
        .getInt(
          "arabicFontSize",
        )!
        .toDouble();
    musahfFontSize = prefs
        .getInt(
          "musahfFontSize",
        )!
        .toDouble();
  } catch (_) {
    arabicFontSize = 28.0;
    musahfFontSize = 40.0;
  }
}
