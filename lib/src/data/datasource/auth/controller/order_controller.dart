import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:lastmile/src/data/models/orders_model.dart';
import 'package:http/http.dart' as http;
import 'package:lastmile/src/data/models/orders_result_model.dart';

import '../../../../core/core.dart';
import '../../../api/global_services.dart';

class LastMileDB {
  final _ordersController = StreamController<List<Orders>>.broadcast();
  final _errorController = StreamController<String>.broadcast();

  Stream<List<Orders>> getOrders() {
    _fetchOrders(); // Start fetching orders when the stream is requested
    return _ordersController.stream;
  }

  Stream<String> get errors => _errorController.stream;

  void _fetchOrders() async {
    String authToken =
        await GlobalService.sharedPreferencesManager.getAuthToken();
    print('authToken');
    print(authToken);
    while (true) {
      try {
        final response = await http.get(
          Uri.parse(
            AppConstants.BASE_URL + AppConstants.RECENT_ORDER,
          ),
          headers: {
            // 'Content-type': 'application/json; charset=UTF-8',
            // 'Accept': 'application/json',
            'Authorization': 'Bearer $authToken',
          },
        );

        if (response.statusCode == 200) {
          print(response.body);
          final orders =
              OrdersResultModel.fromJson(json.decode(response.body)).orders;
          // final List<Orders> orders = List<Orders>.from(
          //   json
          //       .decode(response.body)
          //       .map((dynamic data) => Orders.fromJson(data)),
          // );
          print('orders');
          print(orders);

          _ordersController.add(orders);
        } else {
          // Handle error
          final errorMessage =
              'Failed to fetch orders. Status Code: ${response.statusCode} ${response.body} ${response.reasonPhrase}';
          _errorController.add(errorMessage);
          // Optional: You can still add an empty list to the orders stream if needed
          _ordersController.add(<Orders>[]);
        }
      } catch (error) {
        // Handle error
        final errorMessage = 'Failed to fetch orders. Error: $error';
        _errorController.add(errorMessage);
        // Optional: You can still add an empty list to the orders stream if needed
        _ordersController.add(<Orders>[]);
      }

      // Add a delay before making the next request
      await Future.delayed(Duration(minutes: 1));
    }
  }

  void dispose() {
    _ordersController.close();
    _errorController.close();
  }
}

class OrderController extends GetxController {
  final order = <Orders>[].obs;
  final _lastMileDB = LastMileDB();

  @override
  void onInit() {
    super.onInit();
    order.bindStream(_lastMileDB.getOrders());
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
