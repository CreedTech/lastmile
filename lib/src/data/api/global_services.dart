import 'package:flutter/material.dart';

import '../datasource/local_storage/shared_preference_manager.dart';

class GlobalService {
  // all services should be initialized here
  static late SharedPreferencesManager sharedPreferencesManager;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    // configLoading();

    sharedPreferencesManager = await SharedPreferencesManager().init();
  }
}
