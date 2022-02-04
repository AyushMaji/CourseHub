// ignore_for_file: prefer_const_constructors

import 'package:e_learning/controller/appbar/appbar_controller.dart';
import 'package:e_learning/page/dashboard/home/subjects/class10/class10_page.dart';
import 'package:e_learning/page/dashboard/home/subjects/class11/class11_page.dart';
import 'package:e_learning/page/dashboard/home/subjects/class12/class12_page.dart';
import 'package:e_learning/page/dashboard/home/subjects/class7/class7_page.dart';
import 'package:e_learning/page/dashboard/home/subjects/class8/class8_page.dart';
import 'package:e_learning/page/dashboard/home/subjects/class9/class9_page.dart';
import 'package:e_learning/page/dashboard/home/subjects/coding/coding_page.dart';
import 'package:e_learning/page/dashboard/home/subjects/dance/dance_page.dart';
import 'package:e_learning/page/dashboard/home/subjects/drawing/drawing_page.dart';
import 'package:e_learning/page/dashboard/home/subjects/music/music_page.dart';
import 'package:e_learning/widget/sujectcard/subject_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubjectPage extends StatelessWidget {
  const SubjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sub =
        Provider.of<AppbarController>(context, listen: true).getselectdata;
    print(sub);

    if (sub == "Class 12") {
      return Class12_page();
    } else if (sub == "Class 11") {
      return Class11_page();
    } else if (sub == "Class 10") {
      return Class10_page();
    } else if (sub == "Class 9") {
      return Class9_page();
    } else if (sub == "Class 8") {
      return Class8_page();
    } else if (sub == "Class 7") {
      return Class7_page();
    } else if (sub == "Coding") {
      return Coding_page();
    } else if (sub == "Dance") {
      return Dance_Page();
    } else if (sub == "Drawing") {
      return Drawing_page();
    } else if (sub == "Music") {
      return Music_page();
    } else {
      return Class11_page();
    }
  }
}
