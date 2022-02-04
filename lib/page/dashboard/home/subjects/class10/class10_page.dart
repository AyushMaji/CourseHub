import 'package:e_learning/controller/subject/subject_controller.dart';
import 'package:e_learning/page/dashboard/home/courselist/courselist_page.dart';
import 'package:e_learning/widget/sujectcard/subject_card.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Class10_page extends StatelessWidget {
  const Class10_page({Key? key}) : super(key: key);

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
            // ====== physics and Math =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SubjectCard(
                  subRating: "3.4",
                  subName: "Physics",
                  subNameColor: const Color.fromRGBO(141, 62, 153, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("PhysicalScience")
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
                  subName: "Mathematics",
                  subNameColor: const Color.fromRGBO(255, 22, 78, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("Mathematics")
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
            // ====== physics and Math =====
            const SizedBox(height: 39),
            // ====== biology and chemistry =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SubjectCard(
                  subRating: "3.4",
                  subName: "Biology",
                  subNameColor: const Color.fromRGBO(154, 194, 63, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("LifeScience")
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
                  subName: "Chemistry",
                  subNameColor: const Color.fromRGBO(202, 105, 152, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("Chemistry")
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
            // ====== biology and chemistry =====
            const SizedBox(height: 39),
            // ====== History and Geography =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SubjectCard(
                  subRating: "3.4",
                  subName: "History",
                  subNameColor: const Color.fromRGBO(219, 153, 107, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("History")
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
                  subName: "Geography",
                  subNameColor: const Color.fromRGBO(89, 170, 205, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("Geography")
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
            // ====== History and Geography =====
            const SizedBox(height: 39),
            // ====== Bengali and EngLish =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SubjectCard(
                  subRating: "3.4",
                  subName: "Bengali",
                  subNameColor: const Color.fromRGBO(119, 132, 211, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("Bengali")
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
                  subName: "English",
                  subNameColor: const Color.fromRGBO(220, 182, 57, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("English")
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
            // ====== Bengali and EngLish =====
            const SizedBox(height: 39),
            // ====== Hindi and Sanskrit =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SubjectCard(
                  subRating: "3.4",
                  subName: "Hindi",
                  subNameColor: const Color.fromRGBO(199, 109, 197, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("Hindi")
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
                  subName: "Sanskrit",
                  subNameColor: const Color.fromRGBO(212, 114, 126, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("Sanskrit")
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
            // ====== Hindi and Sanskrit =====
            const SizedBox(height: 39),
            // ====== Computer andEconomics =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SubjectCard(
                  subRating: "3.4",
                  subName: "Computer",
                  subNameColor: const Color.fromRGBO(219, 153, 107, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("Computer")
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
                  subName: "Economics",
                  subNameColor: const Color.fromRGBO(75, 224, 133, 1),
                  press: () => {
                    Provider.of<SubjectController>(context, listen: false)
                        .SelectSubject("Economics")
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
            // ====== Bengali and Economics =====
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
