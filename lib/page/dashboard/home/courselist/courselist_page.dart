// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning/controller/appbar/appbar_controller.dart';
import 'package:e_learning/controller/coursePage/coursePage_controller.dart';
import 'package:e_learning/controller/subject/subject_controller.dart';
import 'package:e_learning/page/course/course_page.dart';
import 'package:e_learning/page/dashboard/home/courselist/appbar/courselist_appbar.dart';
import 'package:e_learning/widget/searchcard/search_card.dart';
import 'package:flutter/material.dart';
import 'package:loader_skeleton/loader_skeleton.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class CourseListPage extends StatelessWidget {
  const CourseListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? catagory =
        Provider.of<AppbarController>(context, listen: true).getselectdata;
    String? subject =
        Provider.of<SubjectController>(context, listen: false).getsub;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: CourselistAppBar(),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(catagory!)
              .where("courseSubject", isEqualTo: subject)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CardListSkeleton(
                    isCircularImage: false,
                    isBottomLinesActive: true,
                    length: 5,
                  ));
            }
            if (snapshot.data.docs.length == 0) {
              return Center(
                child: Lottie.asset(
                  'assets/images/othersPic/nosearch.json',
                  height: 200,
                ),
              );
            }
            return ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (BuildContext context, i) {
                return SearchCourseCard(
                    onTap: () {
                      Provider.of<CoursePageController>(context, listen: false)
                          .CoursePageId(snapshot.data.docs[i]['courseId'])
                          .whenComplete(() => {
                                Navigator.of(context).push(SwipeablePageRoute(
                                    transitionDuration:
                                        Duration(milliseconds: 870),
                                    canOnlySwipeFromEdge: false,
                                    canSwipe: false,
                                    builder: (BuildContext context) =>
                                        ShowCoursePage(
                                          courseId: snapshot.data.docs[i]
                                              ['courseId'],
                                        )))
                              });
                    },
                    courseName: snapshot.data.docs[i]['courseName'],
                    videoNumber: snapshot.data.docs[i]['courseTotalVideo'],
                    totalEnroll: snapshot.data.docs[i]['courseEnroll'],
                    rating: snapshot.data.docs[i]['totalRating'],
                    coursePoster: snapshot.data.docs[i]['courseposter']);
                ;
              },
            );
          }),
    );
  }
}
