import '../controller/fashion_event_one_controller.dart';
import 'package:get/get.dart';

class FashionEventOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FashionEventOneController());
  }
}
