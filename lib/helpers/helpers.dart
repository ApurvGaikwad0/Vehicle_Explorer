import 'package:shared_preferences/shared_preferences.dart';

class Helpers {
  Future<void> saveSelectedMakes(List<String> makes) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('selectedMakes', makes);
  }

  Future<List<String>> loadSelectedMakes() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('selectedMakes') ?? [];
  }
}
