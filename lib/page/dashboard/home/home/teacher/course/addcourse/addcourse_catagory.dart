// ignore_for_file: prefer_const_constructors

import 'package:e_learning/controller/appbar/appbar_controller.dart';
import 'package:e_learning/page/dashboard/home/home/teacher/course/addcourse/addcouse_page.dart';
import 'package:e_learning/service/addcourse/addcourse_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AddCourseCatagoryPage extends StatelessWidget {
  AddCourseCatagoryPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 50),
                  child: Image.asset(
                    "assets/images/othersPic/courseDomain.png",
                    width: 250,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Container(
              height: 490,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            Provider.of<AddCourseService>(context,
                                    listen: false)
                                .addCourseselectCatagory("Class 12")
                                .whenComplete(() => Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: AddCoursePage())));
                          },
                          child: Container(
                            height: 55,
                            width: 134,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                                color: Color.fromRGBO(28, 233, 159, 0.13)),
                            child: Row(
                              children: [
                                Image.asset(
                                    "assets/images/catagoryPic/class12.png"),
                                Text("Class 12",
                                    textScaleFactor: 0.85,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: GoogleFonts.koHo(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.green)),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Provider.of<AddCourseService>(context,
                                    listen: false)
                                .addCourseselectCatagory("Class 11")
                                .whenComplete(() => Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: AddCoursePage())));
                          },
                          child: Container(
                            height: 55,
                            width: 134,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              color: Color.fromRGBO(28, 233, 159, 0.13),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Image.asset(
                                        "assets/images/catagoryPic/class11.png"),
                                  ),
                                  Text("class 11",
                                      textScaleFactor: 0.85,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: GoogleFonts.koHo(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.green)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            Provider.of<AddCourseService>(context,
                                    listen: false)
                                .addCourseselectCatagory("Class 10")
                                .whenComplete(() => Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: AddCoursePage())));
                          },
                          child: Container(
                            height: 55,
                            width: 134,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              color: Color.fromRGBO(219, 230, 255, 1),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Image.asset(
                                      "assets/images/catagoryPic/class10.png"),
                                ),
                                Text("Class 10",
                                    textScaleFactor: 0.85,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: GoogleFonts.koHo(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color:
                                            Color.fromRGBO(82, 10, 174, 0.82))),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Provider.of<AddCourseService>(context,
                                    listen: false)
                                .addCourseselectCatagory("Class 9")
                                .whenComplete(() => Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: AddCoursePage())));
                          },
                          child: Container(
                            height: 55,
                            width: 134,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              color: Color.fromRGBO(219, 230, 255, 1),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Image.asset(
                                      "assets/images/catagoryPic/class9.png"),
                                ),
                                Text("Class 9",
                                    textScaleFactor: 0.85,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: GoogleFonts.koHo(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color:
                                            Color.fromRGBO(82, 10, 174, 0.82))),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            Provider.of<AddCourseService>(context,
                                    listen: false)
                                .addCourseselectCatagory("Class 8")
                                .whenComplete(() => Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: AddCoursePage())));
                          },
                          child: Container(
                            height: 55,
                            width: 134,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              color: Color.fromRGBO(219, 230, 255, 1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Image.asset(
                                        "assets/images/catagoryPic/class8.png"),
                                  ),
                                  Text("Class 8",
                                      textScaleFactor: 0.85,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: GoogleFonts.koHo(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          color: Color.fromRGBO(
                                              82, 10, 174, 0.82))),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Provider.of<AddCourseService>(context,
                                    listen: false)
                                .addCourseselectCatagory("Class 7")
                                .whenComplete(() => Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: AddCoursePage())));
                          },
                          child: Container(
                            height: 55,
                            width: 134,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              color: Color.fromRGBO(219, 230, 255, 1),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Image.asset(
                                      "assets/images/catagoryPic/class7.png"),
                                ),
                                Text("Class 7",
                                    textScaleFactor: 0.85,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: GoogleFonts.koHo(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color:
                                            Color.fromRGBO(82, 10, 174, 0.82))),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            Provider.of<AddCourseService>(context,
                                    listen: false)
                                .addCourseselectCatagory("Coding")
                                .whenComplete(() => Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: AddCoursePage())));
                          },
                          child: Container(
                            height: 55,
                            width: 134,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              color: Color.fromRGBO(233, 28, 28, 0.11),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Image.asset(
                                      "assets/images/catagoryPic/coding.png"),
                                ),
                                Text("Coding",
                                    textScaleFactor: 0.85,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: GoogleFonts.koHo(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(174, 10, 50, 1))),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Provider.of<AddCourseService>(context,
                                    listen: false)
                                .addCourseselectCatagory("Dance")
                                .whenComplete(() => Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: AddCoursePage())));
                          },
                          child: Container(
                            height: 55,
                            width: 134,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              color: Color.fromRGBO(233, 28, 28, 0.11),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                    "assets/images/catagoryPic/dance.png"),
                                Text("Dance",
                                    textScaleFactor: 0.85,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: GoogleFonts.koHo(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(174, 10, 50, 1))),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            Provider.of<AddCourseService>(context,
                                    listen: false)
                                .addCourseselectCatagory("Drawing")
                                .whenComplete(() => Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: AddCoursePage())));
                          },
                          child: Container(
                            height: 55,
                            width: 134,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              color: Color.fromRGBO(233, 28, 28, 0.11),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Image.asset(
                                        "assets/images/catagoryPic/drawing.png"),
                                  ),
                                  Text("Drawing",
                                      textScaleFactor: 0.85,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: GoogleFonts.koHo(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          color:
                                              Color.fromRGBO(174, 10, 50, 1))),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Provider.of<AddCourseService>(context,
                                    listen: false)
                                .addCourseselectCatagory("Music")
                                .whenComplete(() => Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: AddCoursePage())));
                          },
                          child: Container(
                            height: 55,
                            width: 134,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              color: Color.fromRGBO(233, 28, 28, 0.11),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Image.asset(
                                      "assets/images/catagoryPic/music.png",
                                    ),
                                  ),
                                  Text("Music",
                                      textScaleFactor: 0.85,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: GoogleFonts.koHo(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          color:
                                              Color.fromRGBO(174, 10, 50, 1))),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
