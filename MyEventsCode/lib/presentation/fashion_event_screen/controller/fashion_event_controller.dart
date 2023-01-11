import 'package:makemyevent/core/app_export.dart';
import 'package:makemyevent/presentation/fashion_event_screen/models/fashion_event_model.dart';
import 'package:flutter/material.dart';

class FashionEventController extends GetxController {
  TextEditingController groupThreeController = TextEditingController();

  Rx<FashionEventModel> fashionEventModelObj = FashionEventModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    groupThreeController.dispose();
  }
}
