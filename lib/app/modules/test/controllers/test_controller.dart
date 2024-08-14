import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;
import 'package:serviceman/app/modules/test/views/test_subcategory.dart';
import 'package:serviceman/app/modules/test/views/test_view.dart';
import 'package:serviceman/utils/Constant.dart';

class TestController extends GetxController {
  RxList<dynamic> questions = <dynamic>[].obs;
  RxMap<String, String> selectedAnswers = <String, String>{}.obs;
  RxBool isSubmitting = false.obs;
  RxInt remainingTime = (30 * 60).obs; // 30 minutes in seconds
  RxInt currentQuestionIndex = 0.obs; // Track the current question index
  RxInt correctAnswersCount = 0.obs;
  RxList category=[].obs;
  Timer? _timer;

  @override
  void onInit() {

    super.onInit();
    fetchCategory();
    _startTimer();
  }

  RxBool isLoading=false.obs;
  Future<void> fetchCategory() async {
    print("Hiiii");
    try {
      isLoading.value=true;
      final response = await http.get(Uri.parse('${Constants.testcategory}')); // Replace with your API URL
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        category.value = data['data'];
        print("${category.value}");
      } else {
        print("Failed to load questions");
      }
    } catch (e) {
      print("Error fetching questions: $e");
    }finally{
      isLoading.value=false;
    }
  }
  RxList subCategory=[].obs;
  Future<void> fetchSubCategory(String id,String title) async {
    print("Hiiii");
    try {
      isLoading.value=true;
      final response = await http.get(Uri.parse('${Constants.testsubcategory}/$id')); // Replace with your API URL
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        subCategory.value = data['data'];
        Get.to(TestSubCategory(title:title));
        print("${subCategory.value}");
      } else {
        print("Failed to load questions");
      }
    } catch (e) {
      print("Error fetching questions: $e");
    }finally{
      isLoading.value=false;
    }
  }
  Future<void> fetchQuestions(String id,String title) async {
    try {
      final response = await http.get(Uri.parse('${Constants.test}/$id')); // Replace with your API URL
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        questions.value = data['data'];
        Get.to(TestScreen(title:title));
      } else {
        print("Failed to load questions");
      }
    } catch (e) {
      print("Error fetching questions: $e");
    }
  }

  void selectAnswer(String questionId, String answer) {
    selectedAnswers[questionId] = answer;
    if (answer == questions[currentQuestionIndex.value]['ans']) {
      correctAnswersCount.value++;
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
    } else {
      submitAnswers();
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        submitAnswers();
      }
    });
  }
  var correctAnswersCalculated = false.obs;
  void submitAnswers() {
    isTestSubmitted.value = true;
    calculateCorrectAnswers();
  }
  void calculateCorrectAnswers() {
    correctAnswersCount.value = selectedAnswers.entries
        .where((entry) => entry.value == questions.firstWhere((q) => q['id'] == entry.key)['ans'])
        .length;
    correctAnswersCalculated.value = true;
  }
  var isTestSubmitted = false.obs;
  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
