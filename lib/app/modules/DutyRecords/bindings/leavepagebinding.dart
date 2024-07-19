import 'package:get/get.dart';
import 'package:serviceman/app/modules/DutyRecords/controllers/leavepage_controller.dart';

class LeavePageBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<LeavePageController>(() => LeavePageController());
  }

}