//  ======================== your Enroll Course  =====================
// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning/page/course/course_page.dart';
import 'package:e_learning/service/login/login_service.dart';
import 'package:e_learning/widget/searchcard/search_card.dart';
import 'package:flutter/material.dart';
import 'package:loader_skeleton/loader_skeleton.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class EnrollPage extends StatelessWidget {
  const EnrollPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('EnrollCourse')
              .where('userId',
                  isEqualTo: Provider.of<LoginService>(context, listen: false)
                      .obtainUserId)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CardListSkeleton(
                    length: 10,
                    isBottomLinesActive: true,
                  ));
            }
            if (snapshot.data.docs.length == 0) {
              return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Lottie.asset("assets/images/othersPic/noenroll.json"));
            }
            return ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (BuildContext context, i) {
                return StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Course')
                        .where('courseId',
                            isEqualTo: snapshot.data.docs[i]['courseId'])
                        .snapshots(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: CardListSkeleton(
                              length: 1,
                              isBottomLinesActive: true,
                            ));
                      }
                      return SearchCourseCard(
                        onTap: () {
                          Navigator.of(context).push(SwipeablePageRoute(
                              transitionDuration: Duration(milliseconds: 870),
                              canOnlySwipeFromEdge: false,
                              canSwipe: false,
                              builder: (BuildContext context) => ShowCoursePage(
                                    courseId: snapshot.data.docs[0]['courseId'],
                                  )));
                        },
                        courseName: snapshot.data.docs[0]['courseName'],
                        coursePoster: snapshot.data.docs[0]['courseposter'],
                        rating: snapshot.data.docs[0]['totalRating'],
                        videoNumber: snapshot.data.docs[0]['courseTotalVideo'],
                        totalEnroll: snapshot.data.docs[0]['courseEnroll'],
                      );
                    });
              },
            );
          }),
    );
  }
}

//  ======================== your Enroll Course  =====================