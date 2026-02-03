import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Applinks.dart';
import 'package:my_app/app/models/copy.dart';
import 'package:my_app/app/modules/home/controllers/home_controller.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ExamService {
  // onini
  Future<ExamResult> getExamResult(int lessonId, ) async {
    final response = await http.get(
      Uri.parse(
        '${Applinks.baseurl}/userquestion/my/allpercents?lessonId=$lessonId',
      ),
    );

    if (response.statusCode == 200) {
      return ExamResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load exam result');
    }
  }
}

// class ExamResultController extends GetxController {
 
// }


class InlineCounterTextFieldScreen extends StatefulWidget {
  const InlineCounterTextFieldScreen({super.key});

  @override
  _InlineCounterTextFieldScreenState createState() => _InlineCounterTextFieldScreenState();
}
class _InlineCounterTextFieldScreenState extends State<InlineCounterTextFieldScreen> {
  

  
  
  
  
  

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: HomeController(), builder: (controller)=> Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: controller.titles,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(12),
              border: InputBorder.none,
              hintTextDirection: TextDirection.rtl,
              hintText: 'ادخل السؤال',
              hintStyle: TextStyle(
                color: Color.fromARGB(255, 154, 175, 228),
              ),
            ),
          ),
        ],
      ),
      )  );
  }
}
