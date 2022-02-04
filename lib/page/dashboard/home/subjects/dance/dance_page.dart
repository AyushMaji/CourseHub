import 'package:e_learning/controller/subject/subject_controller.dart';
import 'package:e_learning/page/dashboard/home/courselist/courselist_page.dart';
import 'package:e_learning/widget/sujectcard/subject_card.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class Dance_Page extends StatelessWidget {
  const Dance_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            // ====== Contemporary and HipHop =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SubjectCard(
                  subRating: "3.4",
                  subName: "Contemporary",
                  subNameColor: const Color.fromRGBO(159, 117, 112, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("Contemporary")
                        .whenComplete(() => {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: const CourseListPage()))
                            })
                  },
                ),
                SubjectCard(
                  subRating: "4.4",
                  subName: "HipHop",
                  subNameColor: const Color.fromRGBO(217, 193, 149, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("HipHop")
                        .whenComplete(() => {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: const CourseListPage()))
                            })
                  },
                ),
              ],
            ),
            // ====== Contemporary and HipHop =====
            const SizedBox(height: 39),
            // ====== FolkDance and PerspectiveDrawing =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SubjectCard(
                  subRating: "3.4",
                  subName: "Folk Dance",
                  subNameColor: const Color.fromRGBO(228, 144, 87, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("FolkDance")
                        .whenComplete(() => {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: const CourseListPage()))
                            })
                  },
                ),
                SubjectCard(
                  subRating: "3.4",
                  subName: "Modern Dance",
                  subNameColor: const Color.fromRGBO(131, 153, 203, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("ModernDance")
                        .whenComplete(() => {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: const CourseListPage()))
                            })
                  },
                ),
              ],
            ),
            // ====== FolkDance and App Dev =====

            const SizedBox(height: 39),
            // ====== SwingDance and Ballroom =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SubjectCard(
                  subRating: "3.4",
                  subName: "Swing Dance",
                  subNameColor: const Color.fromRGBO(223, 140, 158, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("SwingDance")
                        .whenComplete(() => {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: const CourseListPage()))
                            })
                  },
                ),
                SubjectCard(
                  subRating: "3.4",
                  subName: "Ballroom",
                  subNameColor: const Color.fromRGBO(195, 188, 199, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("Ballroom")
                        .whenComplete(() => {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: const CourseListPage()))
                            })
                  },
                ),
              ],
            ),
            // ====== SwingDance and Ballroom =====

            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
