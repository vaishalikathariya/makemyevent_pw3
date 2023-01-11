import 'controller/home_page_controller.dart';
import 'package:auth/auth.dart';
import 'package:makemyevent/core/app_export.dart';
import 'package:makemyevent/widgets/app_bar/appbar_image.dart';
import 'package:makemyevent/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends GetWidget<HomePageController> {
  HomePageScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.black900,
            appBar: CustomAppBar(
                height: getVerticalSize(56.00),
                leadingWidth: 41,
                leading: AppbarImage(
                    height: getVerticalSize(36.00),
                    width: getHorizontalSize(31.00),
                    imagePath: ImageConstant.imgImage10,
                    margin: getMargin(left: 10, top: 4, bottom: 5)),
                actions: [
                  Padding(
                      padding: getPadding(left: 15, top: 10, bottom: 15),
                      child: Text("lbl_clubs".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterRegular15)),
                  AppbarImage(
                      height: getVerticalSize(12.00),
                      width: getHorizontalSize(13.00),
                      svgPath: ImageConstant.imgArrowdown,
                      margin: getMargin(left: 6, top: 16, bottom: 17)),
                  AppbarImage(
                      height: getSize(31.00),
                      width: getSize(31.00),
                      svgPath: ImageConstant.imgSearch,
                      margin: getMargin(left: 15, top: 7, bottom: 7)),
                  AppbarImage(
                      height: getVerticalSize(33.00),
                      width: getHorizontalSize(31.00),
                      svgPath: ImageConstant.imgUser,
                      margin: getMargin(left: 20, top: 8, right: 15, bottom: 4))
                ]),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Container(
                        width: size.width,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgImage1,
                                  height: getVerticalSize(330.00),
                                  width: getHorizontalSize(390.00)),
                              Padding(
                                  padding: getPadding(left: 28, top: 16),
                                  child: Text("lbl_fashion_events".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          AppStyle.txtJuliusSansOneRegular16)),
                              Padding(
                                  padding: getPadding(left: 6, top: 11),
                                  child: Row(children: [
                                    CustomImageView(
                                        imagePath: ImageConstant.imgImage2,
                                        height: getVerticalSize(143.00),
                                        width: getHorizontalSize(102.00)),
                                    CustomImageView(
                                        imagePath: ImageConstant.imgImage3,
                                        height: getVerticalSize(143.00),
                                        width: getHorizontalSize(108.00),
                                        margin: getMargin(left: 33)),
                                    CustomImageView(
                                        imagePath: ImageConstant.imgImage4,
                                        height: getVerticalSize(143.00),
                                        width: getHorizontalSize(105.00),
                                        margin: getMargin(left: 26),
                                        onTap: () {
                                          Fashionevent();
                                        })
                                  ])),
                              Container(
                                  height: getVerticalSize(275.00),
                                  width: size.width,
                                  margin: getMargin(top: 10),
                                  child: Stack(
                                      alignment: Alignment.topLeft,
                                      children: [
                                        CustomImageView(
                                            svgPath: ImageConstant.imgArrowdown,
                                            height: getVerticalSize(30.00),
                                            width: getHorizontalSize(34.00),
                                            alignment: Alignment.bottomRight,
                                            margin: getMargin(
                                                right: 166, bottom: 61)),
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Padding(
                                                padding: getPadding(left: 10),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text("lbl_tech_events".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtJuliusSansOneRegular16),
                                                      CustomImageView(
                                                          imagePath:
                                                              ImageConstant
                                                                  .imgImage5,
                                                          height:
                                                              getVerticalSize(
                                                                  165.00),
                                                          width:
                                                              getHorizontalSize(
                                                                  98.00),
                                                          margin: getMargin(
                                                              top: 10),
                                                          onTap: () {
                                                            Techevent();
                                                          })
                                                    ]))),
                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                                width: size.width,
                                                margin: getMargin(top: 211),
                                                padding: getPadding(
                                                    left: 52,
                                                    top: 3,
                                                    right: 52,
                                                    bottom: 3),
                                                decoration: AppDecoration
                                                    .fillRed300
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .circleBorder32),
                                                child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CustomImageView(
                                                          imagePath:
                                                              ImageConstant
                                                                  .imgImage11,
                                                          height:
                                                              getVerticalSize(
                                                                  51.00),
                                                          width:
                                                              getHorizontalSize(
                                                                  45.00),
                                                          margin: getMargin(
                                                              bottom: 7)),
                                                      CustomImageView(
                                                          imagePath:
                                                              ImageConstant
                                                                  .imgImage8,
                                                          height:
                                                              getVerticalSize(
                                                                  47.00),
                                                          width:
                                                              getHorizontalSize(
                                                                  53.00),
                                                          margin: getMargin(
                                                              left: 79,
                                                              right: 109,
                                                              bottom: 11))
                                                    ]))),
                                        CustomImageView(
                                            imagePath: ImageConstant.imgImage7,
                                            height: getVerticalSize(174.00),
                                            width: getHorizontalSize(100.00),
                                            alignment: Alignment.topRight,
                                            margin:
                                                getMargin(top: 13, right: 10)),
                                        CustomImageView(
                                            imagePath: ImageConstant.imgImage6,
                                            height: getVerticalSize(174.00),
                                            width: getHorizontalSize(122.00),
                                            alignment: Alignment.topCenter,
                                            margin: getMargin(top: 13)),
                                        Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Container(
                                                height: getVerticalSize(64.00),
                                                width: getHorizontalSize(3.00),
                                                margin: getMargin(left: 141),
                                                decoration: BoxDecoration(
                                                    color: ColorConstant
                                                        .black90001))),
                                        Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                                height: getVerticalSize(64.00),
                                                width: getHorizontalSize(3.00),
                                                margin: getMargin(right: 138),
                                                decoration: BoxDecoration(
                                                    color: ColorConstant
                                                        .black90001)))
                                      ]))
                            ]))))));
  }

  Fashionevent() {
    Get.toNamed(AppRoutes.fashionEventOneScreen);
  }

  Techevent() {
    Get.toNamed(AppRoutes.fashionEventScreen);
  }
}
