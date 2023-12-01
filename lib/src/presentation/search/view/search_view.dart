import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:lastmile/src/core/core.dart';
import 'package:lastmile/src/data/models/package_model.dart';
import 'package:super_cupertino_navigation_bar/super_cupertino_navigation_bar.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<Packages> _products = [];
  bool onSubmitted = false;
  // final general = General.instance;

  Future<List<Packages>> search(String text) async {
    try {
      var client = http.Client();

      final response = await client
          .get(Uri.parse('https://dummyjson.com/products/search?q=$text'));

      // print(UserList.fromJson(json.decode(response.body)).users!);
      if (response.statusCode == 200) {
        var products = (json.decode(response.body)['products'] as List)
            .map(
                (product) => Packages.fromJson(product as Map<String, dynamic>))
            .toList();

        return products;
        // return Packages.fromJson(json.decode(response.body)).products!;
      } else {
        throw Exception('Something Goes Wrong');
      }
    } catch (e) {
      throw Exception('$e');
    }
  }

  Widget createSuggestionList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Text(
            'Recent',
            textAlign: TextAlign.start,
          ).boldSized(16.sp),
        ),
        ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => setState(() {
              onSubmitted = true;
            }),
            child: Column(
              children: [
                ListTile(
                  // minLeadingWidth: 1,
                  horizontalTitleGap: 1,
                  dense: true,
                  // contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.access_time),
                  title: Text(
                    "${_products[index].title}",
                    textAlign: TextAlign.left,
                  ).normalSized(16.sp).colors(colorsBlack),
                  trailing: Icon(CupertinoIcons.arrow_up_right),
                ),
              ],
            ),
          ),
          itemCount: _products.length,
        ),
      ],
    );
  }

  Widget createSearchList() {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 100,
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFFFCFCFC),
              // border: Border.all(
              //   color: const Color(0xFFE1E1E1),
              // ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFFCFCFC).withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 1,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Macbook Pro 2022',
                        style: TextStyle(
                          color: colorsBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'R763489247523',
                        style: TextStyle(
                          color: colorGray,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/paid.png',
                              width: 20.w,
                              alignment: Alignment.center,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'Paid',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'In Transit',
                        style: TextStyle(
                          color: colorGray,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/box.png',
                            width: 14.w,
                            alignment: Alignment.center,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            '3.24 kg',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Text(
                        'June 20, 2023',
                        style: TextStyle(
                          color: colorsBlack,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      separatorBuilder: (c, i) => Divider(
        color: Colors.grey.withOpacity(0.25),
        height: 50,
      ),
      itemCount: _products.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        //inside CupertinoPageScaffold
        child: SuperCupertinoNavigationBar(
          largeTitle: const Text(""),
          appBarType:
              AppBarType.NormalNavbarWithPinnedSearch, // Set desired AppBarType

          searchFieldDecoration: SearchFieldDecoration(
            cursorColor: colorPrimary,
            // padding: const EdgeInsets.all( 30),
            decoration: BoxDecoration(
              color: colorLightGray,
              borderRadius: BorderRadius.circular(5.0),
            ),
            placeholderText: "Enter your package tracking number",

            // hideSearchBarOnInit: false,
            searchFieldBehaviour:
                SearchFieldBehaviour.ShowResultScreenAfterFieldInput,
            cancelButtonStyle: TextStyle(color: colorsBlack),
            onChanged: (text) {
              search(text).then((value) {
                _products = value;
                onSubmitted = false;
                setState(() {});
              });
            },
            onSubmitted: (text) {
              search(text).then((value) {
                _products = value;
                onSubmitted = true;
                setState(() {});
              });
            },
            onSuffixTap: () => setState(() {
              _products = [];
              onSubmitted = false;
            }),
            onCancelTap: () => setState(() {
              _products = [];
              onSubmitted = false;
            }),
            searchResultChildren: [
              onSubmitted ? createSearchList() : createSuggestionList()
            ],
          ), // There are 3 SearchFieldBehaviour

          slivers: [
            SliverFillRemaining(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/search_empty.png',
                          height: 200.h,
                        ),
                        Text('Search for your package'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
