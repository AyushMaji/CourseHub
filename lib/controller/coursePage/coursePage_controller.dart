import 'package:flutter/material.dart';

class CoursePageController extends ChangeNotifier {
  String? courseId;
  String? get getcourseId => courseId;

  Future CoursePageId(gCourseId) async {
    courseId = gCourseId;
    notifyListeners();
  }
}