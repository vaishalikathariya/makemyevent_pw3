import '../controller/fashion_event_controller.dart';
import 'package:get/get.dart';

class FashionEventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FashionEventController());
  }
}
