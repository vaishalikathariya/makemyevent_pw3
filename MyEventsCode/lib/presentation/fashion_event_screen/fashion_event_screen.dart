import 'controller/fashion_event_controller.dart';
import 'package:makemyevent/core/app_export.dart';
import 'package:makemyevent/widgets/custom_button.dart';
import 'package:makemyevent/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class FashionEventScreen extends GetWidget<FashionEventController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.black90001,
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding:
                            getPadding(left: 29, top: 14, right: 34, bottom: 5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgArrowleft,
                                  height: getVerticalSize(52.00),
                                  width: getHorizontalSize(42.00),
                                  onTap: () {
                                    onTapImgArrowleft();
                                  }),
                              CustomImageView(
                                  imagePath: ImageConstant.imgImage5,
                                  height: getVerticalSize(450.00),
                                  width: getHorizontalSize(322.00),
                                  margin: getMargin(left: 5, top: 23),
                                  onTap: () {
                                    onBackPressed();
                                  }),
                              CustomButton(
                                  height: 49,
                                  width: 250,
                                  text: "lbl_register".tr,
                                  margin: getMargin(top: 28),
                                  alignment: Alignment.center),
                              CustomTextFormField(
                                  width: 322,
                                  focusNode: FocusNode(),
                                  controller: controller.groupThreeController,
                                  hintText: "lbl_description".tr,
                                  margin: getMargin(left: 5, top: 11),
                                  textInputAction: TextInputAction.done,
                                  maxLines: 8)
                            ])))),
            bottomNavigationBar: Container(
                height: getVerticalSize(73.00),
                width: getHorizontalSize(164.00),
                margin: getMargin(left: 113, right: 113, bottom: 9),
                child: Stack(alignment: Alignment.center, children: [
                  Align(
                      alignment: Alignment.center,
                      child: Container(
                          height: getVerticalSize(73.00),
                          width: getHorizontalSize(164.00),
                          decoration: BoxDecoration(
                              color: ColorConstant.red300,
                              borderRadius: BorderRadius.circular(
                                  getHorizontalSize(82.00))))),
                  CustomImageView(
                      imagePath: ImageConstant.imgImage11,
                      height: getVerticalSize(51.00),
                      width: getHorizontalSize(45.00),
                      alignment: Alignment.center)
                ]))));
  }

  onTapImgArrowleft() {
    Get.back();
  }

  onBackPressed() {
    Get.back();
  }
}
