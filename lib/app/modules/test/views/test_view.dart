import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/Constant.dart';
import '../controllers/test_controller.dart';

class TestScreen extends GetView<TestController> {
  var title;
  TestScreen({super.key, required this.title});
  final TestController controller = Get.put(TestController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 25,),
        ),
        centerTitle: true,
        backgroundColor: Constants.pimaryColor,
        title: Text("${title}",textScaler: TextScaler.linear(1),textAlign: TextAlign.center,style: TextStyle(color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.w400,fontSize: 22
        ),),
      ),
      body: Obx(() {
        if (controller.questions.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.isSubmitting.value) {
          return Center(child: Text('Submitting...'));
        } else {
          final question = controller.questions[controller.currentQuestionIndex.value];
          return Column(
            children: [
              Expanded(
                child: QuestionWidget(question: question),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: controller.nextQuestion,
                      child: Text(controller.currentQuestionIndex.value < controller.questions.length - 1
                          ? 'Next'
                          : 'Submit'),
                    ),
                    ElevatedButton(
                      onPressed: controller.submitAnswers,
                      child: Text('Submit Test'),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Obx(() => Text('Time Left: ${controller.remainingTime.value} seconds')),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Obx(() => Text(
              //       'Questions Answered Correctly: ${controller.correctAnswersCount.value}/${controller.questions.length}')),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(() {
                  // Show the correct answers count only after submission
                  if (controller.isTestSubmitted.value) {
                    // Ensure the correct answers count is calculated only once upon submission
                    if (!controller.correctAnswersCalculated.value) {
                      controller.calculateCorrectAnswers();
                    }
                    return Text(
                      'Questions Answered Correctly: ${controller.correctAnswersCount.value}/${controller.questions.length}',
                    );
                  } else {
                    return SizedBox.shrink(); // Return an empty widget if not submitted
                  }
                }),
              ),
            ],
          );
        }
      }),
    );
  }
}
class QuestionWidget extends StatelessWidget {
  final dynamic question;

  QuestionWidget({required this.question});

  @override
  Widget build(BuildContext context) {
    final TestController controller = Get.find<TestController>();

    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(question['que'], style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            _buildOption(context, 'A', question['opt1']),
            _buildOption(context, 'B', question['opt2']),
            if (question['opt3'].isNotEmpty) _buildOption(context, 'C', question['opt3']),
            if (question['opt4'].isNotEmpty) _buildOption(context, 'D', question['opt4']),
          ],
        ),
      ),
    );
  }

  // Widget _buildOption(BuildContext context, String optionKey, String optionText) {
  //   final TestController controller = Get.find<TestController>();
  //
  //   return Obx(() {
  //     final selectedAnswer = controller.selectedAnswers[question['id']];
  //     final isCorrect = optionKey == question['ans'];
  //     final isSelected = selectedAnswer == optionKey;
  //
  //     return InkWell(
  //       onTap: () {
  //         controller.selectAnswer(question['id'], optionKey);
  //       },
  //       child: Container(
  //         padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
  //         margin: EdgeInsets.all(5),
  //         width: double.infinity,
  //         decoration: BoxDecoration(
  //           color: isSelected
  //               ? (isCorrect ? Colors.green : Colors.red)
  //               : Colors.transparent,
  //         ),
  //         child: Text(optionText),
  //       ),
  //     );
  //   });
  // }
  Widget _buildOption(BuildContext context, String optionKey, String optionText) {
    final TestController controller = Get.find<TestController>();

    return Obx(() {
      final selectedAnswer = controller.selectedAnswers[question['id']];
      final isCorrect = optionKey == question['ans'];
      final isSelected = selectedAnswer == optionKey;

      // Determine the color of the option
      Color? backgroundColor;
      if (isSelected) {
        backgroundColor = isCorrect ? Colors.green : Colors.red;
      } else if (selectedAnswer != null && isCorrect) {
        backgroundColor = Colors.green;
      } else {
        backgroundColor = Colors.transparent;
      }

      return InkWell(
        onTap: () {
          controller.selectAnswer(question['id'], optionKey);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          margin: EdgeInsets.all(5),
          width: double.infinity,
          decoration: BoxDecoration(
            color: backgroundColor,
          ),
          child: Text(optionText),
        ),
      );
    });
  }

}
