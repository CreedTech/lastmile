import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lastmile/src/core/core.dart';

class OrderTwoView extends StatefulWidget {
  const OrderTwoView(
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
  State<OrderTwoView> createState() => _OrderTwoViewState();
}

class _OrderTwoViewState extends State<OrderTwoView> {
  final TextEditingController _senderFullName = TextEditingController();
  final TextEditingController _senderPhoneNumber = TextEditingController();
  final TextEditingController _receiverFullName = TextEditingController();
  final TextEditingController _receiverPhoneNumber = TextEditingController();
  final TextEditingController _note = TextEditingController();
  final stepTwoKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _senderFullName.dispose();
    _senderPhoneNumber.dispose();
    _receiverFullName.dispose();
    _receiverPhoneNumber.dispose();
    _note.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorWhite,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.close,
            color: colorsBlack,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.all(12.sp),
          child: Column(
            children: [
              Text('Send Package'),
              Text('Step 1 of 3'),
            ],
          ),
        ),
      ),
    );
  }
}
