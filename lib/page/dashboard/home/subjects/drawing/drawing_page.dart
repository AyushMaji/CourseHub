import 'package:e_learning/controller/subject/subject_controller.dart';
import 'package:e_learning/page/dashboard/home/courselist/courselist_page.dart';
import 'package:e_learning/widget/sujectcard/subject_card.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Drawing_page extends StatelessWidget {
  const Drawing_page({Key? key}) : super(key: key);

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
            // ====== CartoonDrawing and FigureDrawing =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SubjectCard(
                  subRating: "3.4",
                  subName: "Cartoon Drawing",
                  subNameColor: const Color.fromRGBO(154, 194, 63, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("CartoonDrawing")
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
                  subName: "Figure Drawing",
                  subNameColor: const Color.fromRGBO(202, 105, 152, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("FigureDrawing")
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
            // ====== CartoonDrawing and FigureDrawing =====
            const SizedBox(height: 39),
            // ====== GestureDrawing and PerspectiveDrawing =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SubjectCard(
                  subRating: "3.4",
                  subName: "Gesture Drawing",
                  subNameColor: const Color.fromRGBO(98, 139, 201, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("GestureDrawing")
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
                  subName: "Perspective Draw.",
                  subNameColor: const Color.fromRGBO(222, 135, 7, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("PerspectiveDrawing")
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
            // ====== GestureDrawingand App Dev =====

            const SizedBox(height: 39),
            // ====== LineDrawing and Oillpainting =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SubjectCard(
                  subRating: "3.4",
                  subName: "Line Drawing",
                  subNameColor: const Color.fromRGBO(185, 52, 202, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("LineDrawing")
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
                  subName: "Oill Painting",
                  subNameColor: const Color.fromRGBO(50, 79, 164, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("Oillpainting")
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
            // ====== LineDrawing and Oillpainting =====

            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
