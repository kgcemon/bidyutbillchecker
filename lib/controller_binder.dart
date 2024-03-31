import 'package:bidyutbillchecker/controller/bill_screen_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BillScreenControllers());
  }
}