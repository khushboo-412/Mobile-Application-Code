import 'package:shared_preferences/shared_preferences.dart';

setStringPreference(var key,var value) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString(key, value);
}

getStringPreference(var key) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getString(key);

}