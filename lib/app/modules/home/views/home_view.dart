// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final ThemeData dark = ThemeData(
      backgroundColor: const Color(0xff243441),
      primaryColor: const Color(0xffEB8034),
      brightness: Brightness.dark);
  final ThemeData light = ThemeData(
      backgroundColor: const Color(0xffEBEBEB),
      primaryColor: const Color(0xffEB8034),
      brightness: Brightness.light);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
    final heightApp = Get.height -
        context.mediaQueryPadding.top -
        context.mediaQueryPadding.bottom;
    final widhtApp = Get.width;
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(23),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: widhtApp,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                        child: Obx(
                          () => Text(
                            "${controller.hasil}",
                            style: TextStyle(
                              fontSize: 70),
                           ),
                          ),
                        ),
                        Obx(
                          () => Text(
                          "${controller.text}",
                          style: TextStyle(
                            fontSize: 30),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: heightApp * 0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ItemButtonCustom(
                            text: "^",
                            value: "^",
                            ),
                          ItemButtonCustom(
                            text: "C",
                            value: "Clear",
                            ),
                          ItemButtonCustom(
                            text: "AC",
                            value: "AllClear",
                            ),
                          Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 10,
                            color: context.theme.primaryColor,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: (() => Get.changeTheme(
                                    Get.isDarkMode ? light : dark,
                                  )),
                              child: Container(
                                width: Get.width * 0.17,
                                height: Get.width * 0.17,
                                //color: Colors.green,
                                child: Center(
                                  child: Icon(
                                    Icons.color_lens_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ItemButtonCustom(
                            text: "(",
                            value: "(",
                            ),
                          ItemButtonCustom(
                            text: ")",
                            value: ")",
                            ),
                          ItemButtonCustom(
                            text: "%",
                            value: "%",
                            ),
                          ItemButtonCustom(
                            text: ":",
                            value: "/",
                            ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ItemButtonCustom(
                            text: "7",
                            value: "7",
                            ),
                          ItemButtonCustom(
                            text: "8",
                            value: "8",
                            ),
                          ItemButtonCustom(
                            text: "9",
                            value: "9",
                            ),
                          ItemButtonCustom(
                            text: "x",
                            value: "*",
                            ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ItemButtonCustom(
                            text: "4",
                            value: "4",
                            ),
                          ItemButtonCustom(
                            text: "5",
                            value: "5",
                            ),
                          ItemButtonCustom(
                            text: "6",
                            value: "6",
                            ),
                          ItemButtonCustom(
                            text: "-",
                            value: "-",
                            ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ItemButtonCustom(
                            text: "1",
                            value: "1",
                            ),
                          ItemButtonCustom(
                            text: "2",
                            value: "2",
                            ),
                          ItemButtonCustom(
                            text: "3",
                            value: "3",
                            ),
                          ItemButtonCustom(
                            text: "+",
                            value: "+",
                            ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ItemButtonCustom(
                            text: "0",
                            value: "0",
                            ),
                          ItemButtonCustom(
                            text: ".",
                            value: ".",
                            ),
                          Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 10,
                            color: context.theme.primaryColor,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () => controller.eksekusi(),
                                
                              child: Container(
                                width: Get.width * 0.17 * 2.4,
                                height: Get.width * 0.17,
                                child: Center(
                                  child: const Text(
                                    "=",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      );
    }
  }

class ItemButtonCustom extends GetView<HomeController> {
  const ItemButtonCustom({
    Key? key,
    required this.text,
    required this.value,
  }) : super(key: key);

  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 10,
      color: context.theme.backgroundColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          controller.changeText(value);
        },
        child: Container(
          width: Get.width * 0.17,
          height: Get.width * 0.17,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
