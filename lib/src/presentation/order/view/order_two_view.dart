import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lastmile/src/core/core.dart';
import 'package:lastmile/src/presentation/order/view/order_three_view.dart';

import '../../../data/api/global_services.dart';
import '../../../data/datasource/auth/controller/auth_controller.dart';
import '../../widgets/custom_text_field.dart';

class OrderTwoView extends ConsumerStatefulWidget {
  const OrderTwoView(
      {super.key,
      required this.pickup_address,
      required this.delivery_address,
      required this.title,
      required this.weight,
      required this.house_number,
      required this.street,
      required this.area,
      required this.lng,
      required this.lat});
  final String pickup_address;
  final String delivery_address;
  final String title;
  final String weight;
  final String lng;
  final String lat;
  final String house_number;
  final String street;
  final String area;

  @override
  ConsumerState<OrderTwoView> createState() => _OrderTwoViewConsumerState();
}

class _OrderTwoViewConsumerState extends ConsumerState<OrderTwoView> {
  final TextEditingController _senderFullName = TextEditingController();
  final TextEditingController _senderPhoneNumber = TextEditingController();
  final TextEditingController _receiverFullName = TextEditingController();
  final TextEditingController _receiverPhoneNumber = TextEditingController();
  final TextEditingController _note = TextEditingController();
  final stepTwoKey = GlobalKey<FormState>();
  String _terminal_lng = '';
  String _terminal_lat = '';

  Future<void> initializeData() async {
    final terminalValue =
        await GlobalService.sharedPreferencesManager.getFromSharedPreferences();
    // String address;
    // String address = terminalValue['address'];
    setState(() {
      _terminal_lng = terminalValue['lng'];
      _terminal_lat = terminalValue['lat'];
      print('_terminal');
      print(_terminal_lng);
      print(_terminal_lat);
    });
  }

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
    final authState = ref.watch(authControllerProvider.notifier);
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
            Icons.arrow_back,
            color: colorsBlack,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.all(12.sp),
          child: Column(
            children: [
              Text(
                'Send Package',
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w500,
                  fontSize: 22.sp,
                  color: colorsBlack,
                ),
              ),
              Text(
                'Step 2 of 3',
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  color: colorGray,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30.h, right: 16.sp, left: 16.sp),
                child: Column(
                  children: [
                    Form(
                      key: stepTwoKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 12.sp),
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Sender information',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: colorsBlack),
                              ),
                            ),
                          ),
                          CustomTextField(
                            prefixIcon: Image.asset(
                              'assets/icons/person.png',
                              scale: 4,
                            ),
                            // labelText: 'Email Address',
                            hintText: '',
                            controller: _senderFullName,
                            legend: 'Full Name',

                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Input your package title';
                              }
                              return null;
                            },
                          ),
                          CustomTextField(
                            prefixIcon: Image.asset(
                              'assets/icons/phone_black.png',
                              scale: 4,
                            ),
                            hintText: '',
                            controller: _senderPhoneNumber,
                            legend: 'Phone Number',
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Input your phone number';
                              }
                              if (value.length < 11) {
                                return 'phone is invalid';
                              }
                              if (int.tryParse(value) == null) {
                                return 'enter valid number';
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 12.sp),
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Receiver information',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: colorsBlack),
                              ),
                            ),
                          ),
                          CustomTextField(
                            prefixIcon: Image.asset(
                              'assets/icons/person.png',
                              scale: 4,
                            ),
                            // labelText: 'Email Address',
                            hintText: '',
                            controller: _receiverFullName,
                            legend: 'Full Name',

                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Input your package title';
                              }
                              return null;
                            },
                          ),
                          CustomTextField(
                            prefixIcon: Image.asset(
                              'assets/icons/phone_black.png',
                              scale: 4,
                            ),
                            hintText: '',
                            controller: _receiverPhoneNumber,
                            legend: 'Phone Number',
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Input your phone number';
                              }
                              if (value.length < 11) {
                                return 'phone is invalid';
                              }
                              if (int.tryParse(value) == null) {
                                return 'enter valid number';
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 12.sp),
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Rider Note',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: colorsBlack),
                              ),
                            ),
                          ),
                          TextFormField(
                            minLines: 3,
                            keyboardType: TextInputType.multiline,
                            controller: _note,
                            maxLines: null,
                            decoration: InputDecoration(
                              hintText: 'Leave additional information...',
                            ),
                            // labelText: 'Email Address',
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 120.sp),
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.of(context)
                                //     .pushNamedAndRemoveUntil(
                                //   home,
                                //   (route) => false,
                                // );

                                print(widget.pickup_address);
                                print(widget.delivery_address);
                                print(widget.lng);
                                print(widget.lat);
                                print(_terminal_lng);
                                print(_terminal_lat);
                                print(widget.delivery_address);
                                print(widget.delivery_address);
                                print(widget.delivery_address);
                                if (stepTwoKey.currentState!.validate()) {
                                  authState
                                      .calculatePoint(
                                          context, widget.lat, widget.lng)
                                      .then(
                                        (value) => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                OrderThreeView(
                                              lng: widget.lng,
                                              lat: widget.lat,
                                              terminal_lng: _terminal_lng,
                                              terminal_lat: _terminal_lat,
                                              pickup_address:
                                                  widget.pickup_address,
                                              delivery_address:
                                                  widget.delivery_address,
                                              title: widget.title,
                                              weight: widget.weight,
                                              sender_full_name:
                                                  _senderFullName.text,
                                              sender_phone_number:
                                                  _senderPhoneNumber.text,
                                              receiver_full_name:
                                                  _receiverFullName.text,
                                              note: _note.text,
                                              receiver_phone_number:
                                                  _receiverPhoneNumber.text,
                                                  house_number: widget.house_number,
                                                  street: widget.street,
                                                  area:widget.area
                                            ),
                                          ),
                                        ),
                                      );
                                }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(vertical: 15.h),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: colorPrimary,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(88.sp),
                                  ),
                                ),
                                child: Text(
                                  'Continue',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
