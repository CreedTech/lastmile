import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import '../../order/view/order_view.dart';
import '../../widgets/custom_text_field.dart';

class DeliveryAddressView extends StatefulWidget {
  const DeliveryAddressView({super.key});

  @override
  State<DeliveryAddressView> createState() => _DeliveryAddressViewState();
}

class _DeliveryAddressViewState extends State<DeliveryAddressView> {
  final TextEditingController _houseNumberController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _landmarkController = TextEditingController();
  final deliveryFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _houseNumberController.dispose();
    _streetController.dispose();
    _areaController.dispose();
    _landmarkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorWhite,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: colorsBlack,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Delivery Address',
        ),
        titleTextStyle: TextStyle(
            color: colorsBlack, fontSize: 20.sp, fontWeight: FontWeight.w500),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Receiver information',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Form(
                  key: deliveryFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        prefixIcon: Icon(
                          Icons.house_outlined,
                          color: colorsBlack,
                        ),
                        // labelText: 'Email Address',
                        hintText: '',
                        controller: _houseNumberController,
                        legend: 'House Number',
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Input a valid House Number';
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        prefixIcon: Image.asset(
                          'assets/icons/marker.png',
                          scale: 4,
                        ),
                        // labelText: 'Email Address',
                        hintText: '',
                        controller: _streetController,
                        legend: 'Street',
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Input a valid Street';
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        prefixIcon: Icon(
                          Icons.location_on_outlined,
                          color: colorsBlack,
                        ),
                        // labelText: 'Email Address',
                        hintText: '',
                        controller: _areaController,
                        legend: 'Area',
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Input a valid Area';
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        prefixIcon: Image.asset(
                          'assets/icons/landmark.png',
                          scale: 4,
                        ),
                        // labelText: 'Email Address',
                        hintText: '',
                        controller: _landmarkController,
                        legend: 'Landmark',
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Input a valid Landmark';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderView(
                        pickup_address: '',
                        delivery_address:
                            '${_houseNumberController.text}${_streetController.text}${' , '}${_areaController.text}${' , '}${_landmarkController.text}',
                      ),
                    ),
                  );
                  // if (loginFormKey.currentState!.validate()) {
                  //   authState.signIn(
                  //       context,
                  //       _emailController.text.trim(),
                  //       _passwordController.text.trim());
                  // }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  // padding: EdgeInsets.symmetric(vertical: 15.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: colorPrimary,
                    borderRadius: BorderRadius.all(Radius.circular(88.sp)),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 14.sp, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
