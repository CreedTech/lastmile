import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/app_constants.dart';

class SharedPreferencesManager {
  late final SharedPreferences _prefs;

  Future<SharedPreferencesManager> init() async {
    _prefs = await SharedPreferences.getInstance();
    print('Initialize');
    return this;
  }

  Future<bool> isLoggedIn() async {
    // final _prefs = await SharedPreferences.getInstance();
    return _prefs.getBool(IS_LOGGED_IN) ?? false;
  }

  Future<bool> setLoggedIn({required bool value}) async {
    // final _prefs = await SharedPreferences.getInstance();
    return _prefs.setBool(IS_LOGGED_IN, value);
  }

  Future<String> getPin() async {
    // final _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(USER_TRANSACTION_PIN) ?? '';
  }

  Future<bool> setPin({required String value}) async {
    // final _prefs = await SharedPreferences.getInstance();
    return _prefs.setString(USER_TRANSACTION_PIN, value);
  }

  Future<bool> hasSeenOnboarding() async {
    // final _prefs = await SharedPreferences.getInstance();
    return _prefs.getBool(HAS_SEEN_ONBOARDING) ?? false;
  }

  Future<bool> setHasSeenOnboarding({required bool value}) async {
    // final _prefs = await SharedPreferences.getInstance();
    return _prefs.setBool(HAS_SEEN_ONBOARDING, value);
  }

  Future<void> deleteAuthToken() async {
    // final prefs = await SharedPreferences.getInstance();
    await _prefs.remove(TOKEN);
  }

  Future<bool> setAuthToken({required String value}) async {
    // final _prefs = await SharedPreferences.getInstance();
    return _prefs.setString(TOKEN, value);
  }

  Future<String> getAuthToken() async {
    // final prefs = await SharedPreferences.getInstance();
    return _prefs.getString(TOKEN) ?? '';
  }

  Future<void> logOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(TOKEN);

    // Navigate to the login screen
    Navigator.pushReplacementNamed(context, '/login');
  }

  Future<bool> saveUserDetails(List<dynamic> userDetails) async {
    // final prefs = await SharedPreferences.getInstance();
    print(userDetails);
    return _prefs.setString(USER_DETAILS, jsonEncode(userDetails));
  }

  Future<bool> saveTerminals(List<dynamic> terminals) async {
    // final prefs = await SharedPreferences.getInstance();
    print(terminals);
    return _prefs.setString(TERMINALS, jsonEncode(terminals));
  }

  Future<List<dynamic>> getTerminals() async {
    // final prefs = await SharedPreferences.getInstance();
    String terminalsString = _prefs.getString(TERMINALS) ?? '[]';
    print(terminalsString);
    return jsonDecode(terminalsString);
  }

  Future<List<dynamic>> getUserDetails() async {
    // final prefs = await SharedPreferences.getInstance();
    String userDetailsString = _prefs.getString(USER_DETAILS) ?? '[]';
    print(userDetailsString);
    return jsonDecode(userDetailsString);
  }
}
