import 'package:lastmile/src/data/models/orders_model.dart';

class OrdersResultModel {
  late final List<Orders> orders;

  OrdersResultModel({required this.orders});

  factory OrdersResultModel.fromJson(Map<String, dynamic> json) {
    var orders = List<Orders>.empty(growable: true);
    if (json['data'] != null) {
      json['data'].forEach((v) {
        final ordersModel = Orders.fromJson(v);
        orders.add(ordersModel);
      });
    }
    return OrdersResultModel(orders: orders);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.orders.map((v) => v.toJson()).toList();
    return data;
  }
}
