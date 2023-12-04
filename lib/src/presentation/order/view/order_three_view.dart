import 'package:flutter/material.dart';

class OrderThreeView extends StatefulWidget {
  const OrderThreeView(
      {super.key,
      required this.pickup_terminal,
      required this.delivery_address,
      required this.title,
      required this.weight});
  final String pickup_terminal;
  final String delivery_address;
  final String title;
  final String weight;

  @override
  State<OrderThreeView> createState() => _OrderThreeViewState();
}

class _OrderThreeViewState extends State<OrderThreeView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
