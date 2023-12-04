import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lastmile/src/core/core.dart';
import 'package:lastmile/src/presentation/order/view/order_two_view.dart';

import '../../widgets/custom_text_field.dart';

class OrderView extends StatefulWidget {
  const OrderView(
      {super.key,
      required this.pickup_address,
      required this.delivery_address});
  final String pickup_address;
  final String delivery_address;

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final packageInfoKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _titleController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30.h, right: 16.sp, left: 16.sp),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12.sp),
                      child: Column(
                        children: [
                          Text('Send Package'),
                          Text('Step 1 of 3'),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            top: 16.sp,
                          ),
                          child: DottedBorder(
                            color: colorGray,
                            strokeWidth: 1,
                            borderType: BorderType.RRect,
                            radius: Radius.circular(8.sp),
                            dashPattern: [8, 8],
                            child: Container(
                              height: 130,
                              width: double.infinity,
                              padding: EdgeInsets.all(14.sp),
                              child: widget.pickup_address.length == 0
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'Pickup Terminal',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            minimumSize: Size(135.w, 40.h),
                                            backgroundColor: colorPrimary,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                88,
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushNamed(pickup_terminal);
                                          },
                                          child: Text(
                                            'Select Terminal',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                color: colorWhite),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Pickup Terminal',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16.sp,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'Change',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12.sp,
                                                      color: colorsBlack),
                                                ),
                                                SizedBox(
                                                  width: 6.w,
                                                ),
                                                Icon(
                                                  Icons.edit_outlined,
                                                  size: 14,
                                                  color: colorPrimary,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              alignment: Alignment.bottomLeft,
                                              padding:
                                                  EdgeInsets.only(top: 8.h),
                                              width: 300.w,
                                              child: Text(
                                                widget.pickup_address,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: colorGray,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                softWrap: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ),
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: colorPrimary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.sp),
                            ),
                          ),
                        ),
                        Container(
                          height: 40.h,
                          width: 1,
                          color: colorPrimary,
                        ),
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: colorPrimary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.sp),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            bottom: 16.sp,
                          ),
                          child: DottedBorder(
                            color: colorGray,
                            strokeWidth: 1,
                            borderType: BorderType.RRect,
                            radius: Radius.circular(8.sp),
                            dashPattern: [8, 8],
                            child: Container(
                              height: 130,
                              width: double.infinity,
                              padding: EdgeInsets.all(14.sp),
                              child: widget.delivery_address.length == 0
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'Delivery Location',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            minimumSize: Size(135.w, 40.h),
                                            backgroundColor: colorPrimary,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                88,
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushNamed(delivery_address);
                                          },
                                          child: Text(
                                            'Add address',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                color: colorWhite),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Delivery Location',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16.sp,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'Change',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12.sp,
                                                      color: colorsBlack),
                                                ),
                                                SizedBox(
                                                  width: 6.w,
                                                ),
                                                Icon(
                                                  Icons.edit_outlined,
                                                  size: 14,
                                                  color: colorPrimary,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              alignment: Alignment.bottomLeft,
                                              padding:
                                                  EdgeInsets.only(top: 8.h),
                                              width: 300.w,
                                              child: Text(
                                                widget.delivery_address,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: colorGray,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                softWrap: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 12.sp),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Package information',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: colorsBlack),
                            ),
                          ),
                        ),
                        Form(
                          key: packageInfoKey,
                          child: Column(
                            children: [
                              CustomTextField(
                                prefixIcon: Icon(
                                  Icons.info_outline,
                                  color: colorsBlack,
                                ),
                                // labelText: 'Email Address',
                                hintText: '',
                                controller: _titleController,
                                legend: 'Enter package title',

                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Input your package title';
                                  }
                                  return null;
                                },
                              ),
                              CustomTextField(
                                prefixIcon: Image.asset(
                                  'assets/icons/folder.png',
                                  scale: 3,
                                ),
                                hintText: '',
                                controller: _weightController,
                                legend: 'Enter package weight Kg',
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Input your package weight in kg';
                                  }
                                  return null;
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 30.sp),
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigator.of(context)
                                    //     .pushNamedAndRemoveUntil(
                                    //   home,
                                    //   (route) => false,
                                    // );
                                    if (packageInfoKey.currentState!
                                        .validate()) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => OrderTwoView(
                                            pickup_terminal:
                                                widget.pickup_address,
                                            delivery_address:
                                                widget.delivery_address,
                                            title: _titleController.text,
                                            weight: _weightController.text,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 15.h),
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
