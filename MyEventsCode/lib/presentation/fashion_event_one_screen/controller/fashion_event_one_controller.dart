import 'package:makemyevent/core/app_export.dart';
import 'package:makemyevent/presentation/fashion_event_one_screen/models/fashion_event_one_model.dart';
import 'package:flutter/material.dart';

class FashionEventOneController extends GetxController {
  TextEditingController groupSixController = TextEditingController();

  Rx<FashionEventOneModel> fashionEventOneModelObj = FashionEventOneModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    groupSixController.dispose();
  }
}
