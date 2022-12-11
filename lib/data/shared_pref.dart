import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? pref;
  static const THEME_STATUS = "THEMESTATUS";
//kalau pake late tidak diinisiaksikan cth int a = "halo"
//kalau pake static sekali aja dipakai atau dinisiaksikan
  static init() async {
    return pref = await SharedPreferences.getInstance();
  }

  setDarkTheme(bool value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(THEME_STATUS) ?? false;
  }
}
