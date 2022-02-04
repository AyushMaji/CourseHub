// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:e_learning/page/course/description/description_page.dart';
import 'package:e_learning/page/course/review/review_page.dart';
import 'package:e_learning/page/course/video/video_page.dart';
import 'package:e_learning/page/dashboard/sidenav_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class ShowCoursePage extends StatelessWidget {
  final String? courseId;

  const ShowCoursePage({
    Key? key,
    required this.courseId,
    // required this.courseId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: AppBar(
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Image.asset("assets/images/iconPic/back.png"),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Container(
                  height: 10,
                  width: 216,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: Color.fromRGBO(203, 237, 255, 1),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Icon(
                          Icons.bubble_chart,
                          color: Colors.green,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Text("CourseHub",
                            textScaleFactor: 0.85,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: GoogleFonts.koHo(
                                fontSize: 17,
                                fontWeight: FontWeight.w800,
                                color: Colors.black)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 13,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(231, 230, 230, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Color.fromRGBO(0, 197, 126, 1),
                    indicator: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                              offset: Offset(0, 4),
                              blurRadius: 3)
                        ],
                        borderRadius:
                            BorderRadius.circular(10), // Creates border
                        color: Color.fromRGBO(0, 197, 126, 1)),
                    tabs: [
                      Container(
                        height: 35,
                        child: Center(
                          child: Text("Course",
                              textScaleFactor: 0.85,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.roboto(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              )),
                        ),
                      ),
                      Container(
                        height: 35,
                        child: Center(
                          child: Text("Video",
                              textScaleFactor: 0.85,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.roboto(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              )),
                        ),
                      ),
                      Container(
                        height: 35,
                        child: Center(
                          child: Text("Review",
                              textScaleFactor: 0.85,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.roboto(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ShowDescriptionPage(
                    courseId: courseId,
                  ),
                  ShowVideoPage(
                    courseId: courseId,
                  ),
                  ShowReviewPage(
                    courseId: courseId,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
