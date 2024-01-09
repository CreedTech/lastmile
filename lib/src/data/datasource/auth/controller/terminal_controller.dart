import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lastmile/src/data/models/terminal_model.dart';
import 'package:lastmile/src/data/models/terminal_result_model.dart';

import '../../../../core/core.dart';
import '../../../api/global_services.dart';

class LastMileDB {
  final _terminalsController = StreamController<List<Terminal>>.broadcast();
  final _errorController = StreamController<String>.broadcast();

  Stream<List<Terminal>> getTerminals() {
    _fetchTerminal(); // Start fetching Terminal when the stream is requested
    return _terminalsController.stream;
  }

  Stream<String> get errors => _errorController.stream;

  void _fetchTerminal() async {
    String authToken =
        await GlobalService.sharedPreferencesManager.getAuthToken();
    print('authToken');
    print(authToken);
    while (true) {
      try {
        final response = await http.get(
          Uri.parse(
            AppConstants.BASE_URL + AppConstants.GET_TERMINALS,
          ),
          headers: {
            // 'Content-type': 'application/json; charset=UTF-8',
            // 'Accept': 'application/json',
            'Authorization': 'Bearer $authToken',
          },
        );

        if (response.statusCode == 200) {
          final terminals =
              TerminalsResultModel.fromJson(json.decode(response.body))
                  .terminals;
          // final List<Terminal> Terminal = List<Terminal>.from(
          //   json
          //       .decode(response.body)
          //       .map((dynamic data) => Terminal.fromJson(data)),
          // );
          print('terminals');
          print(terminals);

          _terminalsController.add(terminals);
        } else {
          // Handle error
          final errorMessage =
              'Failed to fetch terminals. Status Code: ${response.statusCode} ${response.body} ${response.reasonPhrase}';
          _errorController.add(errorMessage);
          // Optional: You can still add an empty list to the Terminal stream if needed
          _terminalsController.add(<Terminal>[]);
        }
      } catch (error) {
        // Handle error
        final errorMessage = 'Failed to fetch terminals. Error: $error';
        _errorController.add(errorMessage);
        // Optional: You can still add an empty list to the Terminal stream if needed
        _terminalsController.add(<Terminal>[]);
      }

      // Add a delay before making the next request
      await Future.delayed(Duration(minutes: 1));
    }
  }

  void dispose() {
    _terminalsController.close();
    _errorController.close();
  }
}

class TerminalController extends GetxController {
  final terminal = <Terminal>[].obs;
  final _lastMileDB = LastMileDB();

  @override
  void onInit() {
    super.onInit();
    terminal.bindStream(_lastMileDB.getTerminals());
    _lastMileDB.errors.listen((error) {
      // Handle and display errors in your application
      print('Error: $error');
    });
  }

  @override
  void onClose() {
    super.onClose();
    _lastMileDB.dispose();
  }
}
