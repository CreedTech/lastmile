import 'package:flutter/material.dart';

import '../../core/core.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        widthFactor: 0.4,
        child: Container(
          height:27,
          width:27,
          decoration: BoxDecoration(
              //borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'), fit: BoxFit.contain)),
          child: SizedBox(
            height:100,
            width:100,
            child: const CircularProgressIndicator(
              color: colorPrimary,
            ),
          ),
        ));

    //  Image.asset(
    //   appLogo,
    //   fit: BoxFit.fitWidth,
    //   height:40,
    //   width:40,
    // );
    //Stack(
    //   alignment: Alignment.center,
    //   children: [
    //     Center(
    //         child: Container(
    //   height: 20,
    //   width: 20,
    //   decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(10),
    //       image:
    //           DecorationImage(image: AssetImage(appLogo), fit: BoxFit.contain)),
    // )

    // Image.asset(

    //   appLogo,

    //   fit: BoxFit.fitWidth,
    //   height:40,
    //   width:40,
    // ),
    // );
    // Center(
    //   child: SizedBox(
    //     height:70,
    //     width:70,
    //     child: const CircularProgressIndicator(
    //         // color: backgroundColor,
    //         ),
    //   ),
    // )
    //   ],
    // );
  }
}
