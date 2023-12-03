import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lastmile/src/core/core.dart';
import 'package:lastmile/src/presentation/order/view/order_view.dart';

class PickupTerminalView extends StatefulWidget {
  const PickupTerminalView({super.key});

  @override
  State<PickupTerminalView> createState() => _PickupTerminalViewState();
}

class _PickupTerminalViewState extends State<PickupTerminalView> {
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
          'Pickup Terminals',
        ),
        titleTextStyle: TextStyle(
            color: colorsBlack, fontSize: 20.sp, fontWeight: FontWeight.w500),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        PickupTerminalWidget(
                          name: 'Terminal 1',
                          address:
                              'No 17 Alhaji Usman complex opp Unity bank, Akpangbo, garaki Abuja',
                        ),
                        PickupTerminalWidget(
                          name: 'Terminal 1',
                          address:
                              'No 17 Alhaji Usman complex opp Unity bank, Akpangbo, garaki Abuja',
                        ),
                        PickupTerminalWidget(
                          name: 'Terminal 1',
                          address:
                              'No 17 Alhaji Usman complex opp Unity bank, Akpangbo, garaki Abuja',
                        ),
                        PickupTerminalWidget(
                          name: 'Terminal 1',
                          address:
                              'No 17 Alhaji Usman complex opp Unity bank, Akpangbo, garaki Abuja',
                        ),
                        PickupTerminalWidget(
                          name: 'Terminal 1',
                          address:
                              'No 17 Alhaji Usman complex opp Unity bank, Akpangbo, garaki Abuja',
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderView(
                          pickup_address:
                              'No 17 Alhaji Usman complex opp Unity bank, Akpangbo, garaki Abuja',
                          delivery_address: '',
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 16.0, bottom: 80.h, right: 20.w, left: 20.w),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: colorPrimary,
                        borderRadius: BorderRadius.all(Radius.circular(88.sp)),
                      ),
                      child: Text(
                        'Select Terminal',
                        style: TextStyle(fontSize: 14.sp, color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PickupTerminalWidget extends StatelessWidget {
  const PickupTerminalWidget({
    super.key,
    required this.name,
    required this.address,
  });
  final String name;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 345.w,
        height: 100.h,
        decoration: BoxDecoration(
          // color: colorGray,
          color: Color(0xffFCFCFC),
          borderRadius: BorderRadius.circular(
            8.sp,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   width: 16.w,
              //   height: 16.h,
              //   decoration: BoxDecoration(
              //     color: Color(0xffF3F3F3),
              //     borderRadius: BorderRadius.circular(
              //       50.sp,
              //     ),
              //   ),
              // ),
              Container(
                width: 14.w,
                height: 14.h,
                child: Radio.adaptive(
                  value: '',
                  groupValue: 'n',
                  onChanged: (val) {},
                  overlayColor: MaterialStateColor.resolveWith(
                    (states) => colorLightGray,
                  ),
                  fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return colorPrimary;
                    }
                    return colorLightGray;
                  }),
                  focusColor: MaterialStateColor.resolveWith(
                    (states) => colorPrimary,
                  ),
                  splashRadius: 15,
                  useCupertinoCheckmarkStyle: true,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: colorsBlack,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    softWrap: true,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8.h),
                    width: 300.w,
                    child: Text(
                      address,
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
    );
  }
}
