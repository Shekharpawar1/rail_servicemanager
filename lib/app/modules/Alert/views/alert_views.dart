import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../utils/Constant.dart';
import '../controllers/alert_controller.dart';

class NotificationScreen extends StatelessWidget {
  final NotificationController controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Constants.pimaryColor,
        title: Text(
          "Alert's",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w400,
              fontSize: 22),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (controller.notifications.isEmpty) {
          return Center(child: Text('No notifications available.'));
        }
        return ListView.builder(
          itemCount: controller.notifications.length,
          itemBuilder: (context, index) {
            var notification = controller.notifications[index];
            return Container(
              margin:EdgeInsets.all(5),
              child: Card(
                child: ListTile(
                  title: Text(notification['v_name']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Train Code: ${notification['train_code']}'),
                      Text('Message: ${notification['r_message']}'),
                      Text('Date: ${notification['r_date']}'),
                    ],
                  ),
                  trailing: notification['r_isread'] == '0'
                      ? Icon(Icons.markunread, color: Colors.red)
                      : Icon(Icons.mark_email_read, color: Colors.green),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
