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

  Future<bool> setEmail({required String value}) async {
    // final _prefs = await SharedPreferences.getInstance();
    return _prefs.setString(USER_EMAIL, value);
  }

  Future<String> getEmail() async {
    // final prefs = await SharedPreferences.getInstance();
    return _prefs.getString(USER_EMAIL) ?? '';
  }

  Future<bool> setDistance({required String value}) async {
    // final _prefs = await SharedPreferences.getInstance();
    return _prefs.setString('distance', value);
  }

  Future<String> getDistance() async {
    // final prefs = await SharedPreferences.getInstance();
    return _prefs.getString('distance') ?? '';
  }

  Future<void> deleteDistance() async {
    // final prefs = await SharedPreferences.getInstance();
    await _prefs.remove('distance');
  }

  Future<bool> setDuration({required String value}) async {
    // final _prefs = await SharedPreferences.getInstance();
    return _prefs.setString('duration', value);
  }

  Future<String> getFee() async {
    // final prefs = await SharedPreferences.getInstance();
    return _prefs.getString('fee') ?? '';
  }

  Future<bool> setFee({required String value}) async {
    // final _prefs = await SharedPreferences.getInstance();
    return _prefs.setString('fee', value);
  }

  Future<void> deleteFee() async {
    // final prefs = await SharedPreferences.getInstance();
    await _prefs.remove('fee');
  }

  Future<String> getDuration() async {
    // final prefs = await SharedPreferences.getInstance();
    return _prefs.getString('duration') ?? '';
  }

  Future<void> deleteDuration() async {
    // final prefs = await SharedPreferences.getInstance();
    await _prefs.remove('duration');
  }

  Future<bool> setFirstName({required String value}) async {
    // final _prefs = await SharedPreferences.getInstance();
    return _prefs.setString(USER_FIRST_NAME, value);
  }

  Future<String> getFirstName() async {
    // final prefs = await SharedPreferences.getInstance();
    return _prefs.getString(USER_FIRST_NAME) ?? '';
  }

  Future<bool> setLastName({required String value}) async {
    // final _prefs = await SharedPreferences.getInstance();
    return _prefs.setString(USER_LAST_NAME, value);
  }

  Future<String> getLastName() async {
    // final prefs = await SharedPreferences.getInstance();
    return _prefs.getString(USER_LAST_NAME) ?? '';
  }

  Future<bool> setPhone({required String value}) async {
    // final _prefs = await SharedPreferences.getInstance();
    return _prefs.setString(USER_PHONE_NUMBER, value);
  }

  Future<String> getPhone() async {
    // final prefs = await SharedPreferences.getInstance();
    return _prefs.getString(USER_PHONE_NUMBER) ?? '';
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

  Future<bool> saveTerminals(dynamic terminals) async {
    // final prefs = await SharedPreferences.getInstance();
    print(terminals);
    return _prefs.setString(TERMINALS, jsonEncode(terminals));
  }

  dynamic getTerminals() {
    // final prefs = await SharedPreferences.getInstance();
    String terminalsString = _prefs.getString(TERMINALS) ?? '';
    print('terminalsString');
    print(terminalsString);
    return jsonDecode(terminalsString);
  }

  Future<List<dynamic>> getUserDetails() async {
    // final prefs = await SharedPreferences.getInstance();
    String userDetailsString = _prefs.getString(USER_DETAILS) ?? '[]';
    print(userDetailsString);
    return jsonDecode(userDetailsString);
  }

  Future<void> saveToSharedPreferences(
      String address, String state, String lng, String lat) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save the values
    await prefs.setString('address', address);
    await prefs.setString('state', state);
    await prefs.setString('lng', lng);
    await prefs.setString('lat', lat);
  }

  // Retrieve address and state from shared preferences
  Future<dynamic> getFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve the values with default empty strings
    String address = prefs.getString('address') ?? '';
    String state = prefs.getString('state') ?? '';
    String lng = prefs.getString('lng') ?? '';
    String lat = prefs.getString('lat') ?? '';

    return {'address': address, 'state': state, 'lng': lng, 'lat': lat};
  }

  Future<void> deleteFromSharedPreferences() async {
    // final prefs = await SharedPreferences.getInstance();
    await _prefs.remove('address');
    await _prefs.remove('state');
    await _prefs.remove('lng');
    await _prefs.remove('lat');
  }

  Future<bool> setCode({required String value}) async {
    // final _prefs = await SharedPreferences.getInstance();
    return _prefs.setString('code', value);
  }

  Future<String> getCode() async {
    // final prefs = await SharedPreferences.getInstance();
    return _prefs.getString('code') ?? '';
  }

  Future<void> deleteCode() async {
    // final prefs = await SharedPreferences.getInstance();
    await _prefs.remove('code');
  }

  Future<bool> setCharge({required String value}) async {
    // final _prefs = await SharedPreferences.getInstance();
    return _prefs.setString('charge', value);
  }

  Future<String> getCharge() async {
    // final prefs = await SharedPreferences.getInstance();
    return _prefs.getString('charge') ?? '';
  }

  Future<void> deleteCharge() async {
    // final prefs = await SharedPreferences.getInstance();
    await _prefs.remove('charge');
  }
}
