import 'package:e_learning/controller/subject/subject_controller.dart';
import 'package:e_learning/page/dashboard/home/courselist/courselist_page.dart';
import 'package:e_learning/widget/sujectcard/subject_card.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Coding_page extends StatelessWidget {
  const Coding_page({Key? key}) : super(key: key);

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

            // ====== WebDevelopment and ARTech =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SubjectCard(
                  subRating: "3.4",
                  subName: "Web Dev",
                  subNameColor: const Color.fromRGBO(140, 151, 226, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("WebDevelopment")
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
                  subName: "AR & VR",
                  subNameColor: const Color.fromRGBO(202, 105, 152, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("ARTech")
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
            // ====== WebDevelopment and ARTech =====

            const SizedBox(height: 39),

            // ====== CompetitiveCoding and App Dev =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SubjectCard(
                  subRating: "3.4",
                  subName: "Coding",
                  subNameColor: const Color.fromRGBO(74, 213, 231, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("CompetitiveCoding")
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
                  subName: "App Dev",
                  subNameColor: const Color.fromRGBO(227, 194, 65, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("AppDevelopment")
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
            // ====== CompetitiveCoding and App Dev =====
            const SizedBox(height: 39),
            // ====== MLAndAI and CyberSecurity =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SubjectCard(
                  subRating: "3.4",
                  subName: "ML & AI",
                  subNameColor: const Color.fromRGBO(205, 135, 82, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("MLAndAI")
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
                  subName: "Cyber Security",
                  subNameColor: const Color.fromRGBO(82, 81, 80, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("CyberSecurity")
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
            // ====== MLAndAI and CyberSecurity =====
            const SizedBox(height: 39),
            // ====== DataScience and GraphicDesign =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SubjectCard(
                  subRating: "3.4",
                  subName: "Data Science",
                  subNameColor: const Color.fromRGBO(202, 32, 54, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("DataScience")
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
                  subName: "Graphic Design",
                  subNameColor: const Color.fromRGBO(184, 0, 137, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("GraphicDesign")
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
            // ====== DataScience and GraphicDesign == =====

            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
