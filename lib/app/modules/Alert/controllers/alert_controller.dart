import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:serviceman/utils/Constant.dart';

class NotificationController extends GetxController {
  var isLoading = true.obs;
  RxList notifications = [].obs;

  @override
  void onInit() {
    fetchNotifications();
    super.onInit();
  }

  void fetchNotifications() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('${Constants.reminder}'));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data['status'] == 'success') {
          // Assign the list of JSON objects directly to the notifications list
          notifications.assignAll(data['data']);
        } else {
          Get.snackbar("Error", "Failed to fetch notifications.");
        }
      } else {
        Get.snackbar("Error", "Failed to fetch notifications. Status code: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch notifications. Error: $e");
    } finally {
      isLoading(false);
    }
  }
}
