import 'package:e_learning/controller/subject/subject_controller.dart';
import 'package:e_learning/page/dashboard/home/courselist/courselist_page.dart';
import 'package:e_learning/widget/sujectcard/subject_card.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class Music_page extends StatelessWidget {
  const Music_page({Key? key}) : super(key: key);

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
            // ====== GuitarMusic and PianoClass =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SubjectCard(
                  subRating: "3.4",
                  subName: "Guitar",
                  subNameColor: const Color.fromRGBO(228, 144, 87, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("GuitarMusic")
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
                  subName: "Piano",
                  subNameColor: const Color.fromRGBO(184, 72, 86, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("PianoClass")
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
            // ====== GuitarMusic and PianoClass =====
            const SizedBox(height: 39),
            // ====== Music and PerspectiveDrawing =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SubjectCard(
                  subRating: "3.4",
                  subName: "Music",
                  subNameColor: const Color.fromRGBO(223, 194, 71, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("Music")
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
                  subName: "Others",
                  subNameColor: const Color.fromRGBO(131, 153, 203, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("Others")
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
            // ====== Music and App Dev =====

            const SizedBox(height: 39),

            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
