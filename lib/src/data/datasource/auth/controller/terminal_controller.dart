// import 'dart:async';
// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:lastmile/src/data/models/terminal_model.dart';
// import 'package:lastmile/src/data/models/terminal_result_model.dart';

// import '../../../../core/core.dart';
// import '../../../api/global_services.dart';

// class LastMileDB {
//   final _terminalsController = StreamController<List<Terminal>>.broadcast();
//   final _errorController = StreamController<String>.broadcast();

//   Stream<List<Terminal>> getTerminals() {
//     _fetchTerminal(); // Start fetching Terminal when the stream is requested
//     return _terminalsController.stream;
//   }

//   Stream<String> get errors => _errorController.stream;

//   void _fetchTerminal() async {
//     String authToken =
//         await GlobalService.sharedPreferencesManager.getAuthToken();
//     print('authToken');
//     print(authToken);
//     while (true) {
//       try {
//         final response = await http.get(
//           Uri.parse(
//             AppConstants.BASE_URL + AppConstants.GET_TERMINALS,
//           ),
//           headers: {
//             // 'Content-type': 'application/json; charset=UTF-8',
//             // 'Accept': 'application/json',
//             'Authorization': 'Bearer $authToken',
//           },
//         );
//         print(response.body);
//         print(response.statusCode);

//         if (response.statusCode == 200) {
//           final dynamic responseData = jsonDecode(response.body)['data'];

//         if (responseData is List) {
//           // 'data' is a List, proceed with mapping and conversion
//           final List<Terminal> terminals = responseData
//               .map((dynamic data) => Terminal.fromJson(data))
//               .toList();

//           print('terminals');
//           print(terminals);

//           _terminalsController.add(terminals);
//         } else if (responseData is Map) {
//           // 'data' is a single object, treat it as a list with a single item
//           final Terminal terminal = Terminal.fromJson(responseData);
//           _terminalsController.add([terminal]);
//         } else {
//           // Handle other unexpected formats if needed
//           print('Invalid format for data field. Expected a List or Map, but received: $responseData');
//         }
//       }else {
//           // Handle error
//           final errorMessage =
//               'Failed to fetch terminals. Status Code: ${response.statusCode} ${response.body} ${response.reasonPhrase}';
//           _errorController.add(errorMessage);
//           // Optional: You can still add an empty list to the Terminal stream if needed
//           _terminalsController.add(<Terminal>[]);
//         }
//       } catch (error) {
//         // Handle error
//         final errorMessage = 'Failed to fetch terminals. Error: $error';
//         _errorController.add(errorMessage);
//         // Optional: You can still add an empty list to the Terminal stream if needed
//         _terminalsController.add(<Terminal>[]);
//       }

//       // Add a delay before making the next request
//       await Future.delayed(Duration(minutes: 1));
//     }
//   }

//   void dispose() {
//     _terminalsController.close();
//     _errorController.close();
//   }
// }

// class TerminalController extends GetxController {
//   final terminal = <Terminal>[].obs;
//   final _lastMileDB = LastMileDB();

//   @override
//   void onInit() {
//     super.onInit();
//     terminal.bindStream(_lastMileDB.getTerminals());
//     _lastMileDB.errors.listen((error) {
//       // Handle and display errors in your application
//       print('Error: $error');
//     });
//   }

//   @override
//   void onClose() {
//     super.onClose();
//     _lastMileDB.dispose();
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../presentation/widgets/custom_loader.dart';
import '../../../repository/terminal_repo.dart';

final appControllerProvider =
    StateNotifierProvider<AppController, AsyncValue<bool>>((ref) {
  final repository = ref.watch(appRepositoryProvider);

  return AppController(repository);
});
// AppStatus AppStatus = AppStatus.NOT_DETERMINED;

class AppController extends StateNotifier<AsyncValue<bool>> {
  AppRepository appRepository;
  bool isLoading = false;
  // bool get loading => _isLoading;
  AppController(this.appRepository) : super(const AsyncLoading());

  Future getTerminalsData(BuildContext context) async {
    isLoading = true;
    String message;
    try {
      isLoading = true;
      state = const AsyncLoading();
      // EasyLoading.show(
      //   indicator: CustomLoader(),
      //   maskType: EasyLoadingMaskType.clear,
      //   dismissOnTap: true,
      // );
      EasyLoading.show(
        indicator: CustomLoader(),
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: false,
      );
      var response = await AppRepository.getTerminals();
      state = const AsyncData(false);
      EasyLoading.dismiss();
      if (response.success) {
        // EasyLoading.dismiss();
        isLoading = false;
        // notifyListeners();
        state = AsyncValue.data(true);
        return;
      } else
        print('response.message.toString()');
      print(response.message.toString());

      // check for different reasons to enhance users experience
      if (response.success == false &&
          response.message.contains("invalid signature")) {
        message = "Terminals info could not be retrieved , Try again later.";
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );
        return;
      } else {
        // to capture other errors later
        message = "Something went wrong";
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );

        return;
      }
    } catch (e) {
      print('e here');
      print(e);
      EasyLoading.dismiss();
      state = AsyncError(e, StackTrace.current);
      message = "Ooops something went wrong";
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: message,
        ),
      );

      return;
    } finally {
      isLoading = false;
      // EasyLoading.dismiss();
      return;
    }
  }
}
