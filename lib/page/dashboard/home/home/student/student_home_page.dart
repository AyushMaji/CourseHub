// ignore_for_file: prefer_const_constructors_in_immutables, avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning/page/course/course_page.dart';
import 'package:e_learning/page/dashboard/home/courselist/courselist_page.dart';
import 'package:e_learning/service/addcourse/addcourse_service.dart';
import 'package:e_learning/service/login/login_service.dart';
import 'package:e_learning/widget/searchcard/search_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_skeleton/loader_skeleton.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({Key? key}) : super(key: key);

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  @override
  void initState() {
    Provider.of<AddCourseService>(context, listen: false).userCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Users')
                .where('id',
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
              return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, i) {
                    return SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Center(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25, bottom: 20, top: 10),
                                  child: Text(
                                      "Hi ${snapshot.data.docs[0]['name']} !!",
                                      textScaleFactor: 0.85,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: GoogleFonts.galada(
                                          fontSize: 32,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color.fromRGBO(0, 197, 126, 1))),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(SwipeablePageRoute(
                                    transitionDuration:
                                        Duration(milliseconds: 870),
                                    canOnlySwipeFromEdge: false,
                                    canSwipe: false,
                                    builder: (BuildContext context) =>
                                        CourseListPage()));
                              },
                              child: Container(
                                height: 170,
                                width: MediaQuery.of(context).size.width / 1.12,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(
                                            0, 0, 0, 0.07999999821186066),
                                        offset: Offset(0, 4),
                                        blurRadius: 25)
                                  ],
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Image.asset(
                                        "assets/images/othersPic/studenthome.png",
                                        height: 140,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 5),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Course Hub",
                                                textScaleFactor: 0.85,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: GoogleFonts.roboto(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w900,
                                                    color: Color.fromRGBO(
                                                        124, 159, 231, 1))),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "${Provider.of<AddCourseService>(context, listen: true).gettotalcourse.toString()} courses",
                                                    textScaleFactor: 0.85,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 0.44))),
                                                SizedBox(height: 3),
                                                Text(
                                                    "${Provider.of<AddCourseService>(context, listen: true).getTotalUserCount.toString()} user",
                                                    textScaleFactor: 0.85,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 0.44))),
                                              ],
                                            ),
                                            Container(
                                              height: 30,
                                              width: 90,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10),
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromRGBO(
                                                          0,
                                                          0,
                                                          0,
                                                          0.07999999821186066),
                                                      offset: Offset(0, 4),
                                                      blurRadius: 25)
                                                ],
                                                color: Color.fromRGBO(
                                                    255, 103, 140, 1),
                                              ),
                                              child: Center(
                                                child: Text("JOIN NOW",
                                                    textScaleFactor: 0.85,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: GoogleFonts.hind(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 23, top: 30, bottom: 20),
                              child: Row(
                                children: [
                                  Text("Top Teacher",
                                      textScaleFactor: 0.85,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: GoogleFonts.hind(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color:
                                              Color.fromRGBO(0, 181, 116, 1))),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Container(
                                height: 190,
                                child: StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection('Users')
                                        .where("profession",
                                            isEqualTo: "teacher")
                                        .snapshots(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshots) {
                                      if (snapshots.connectionState ==
                                          ConnectionState.waiting) {
                                        return CardSkeleton(
                                          isBottomLinesActive: true,
                                        );
                                      }

                                      return ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          physics: BouncingScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: snapshots.data.docs.length,
                                          itemBuilder: (context, i) {
                                            return Container(
                                              height: 120,
                                              width: 120,
                                              child: Stack(
                                                overflow: Overflow.visible,
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        Colors.green,
                                                    radius: 54,
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.white,
                                                      radius: 52,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl: snapshots
                                                                  .data.docs[i]
                                                              ['picture'],
                                                          height: 100.9,
                                                          width: 100.9,
                                                          fit: BoxFit.cover,
                                                          placeholder:
                                                              (context, url) =>
                                                                  Center(
                                                            child: Shimmer
                                                                .fromColors(
                                                              baseColor: Color
                                                                  .fromRGBO(
                                                                      225,
                                                                      225,
                                                                      225,
                                                                      1),
                                                              highlightColor:
                                                                  Colors.white,
                                                              child:
                                                                  CircleAvatar(
                                                                backgroundColor:
                                                                    Colors.grey,
                                                                radius: 52,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 97,
                                                    left: 12,
                                                    child: Container(
                                                      width: 85,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  32),
                                                          topRight:
                                                              Radius.circular(
                                                                  32),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  32),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  32),
                                                        ),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                              color: Color.fromRGBO(
                                                                  0,
                                                                  197,
                                                                  125,
                                                                  0.3700000047683716),
                                                              offset:
                                                                  Offset(0, 4),
                                                              blurRadius: 8)
                                                        ],
                                                        color: Color.fromRGBO(
                                                            0, 197, 126, 1),
                                                      ),
                                                      child: Center(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      4),
                                                          child: Text(
                                                              snapshots.data
                                                                      .docs[i]
                                                                  ['name'],
                                                              textScaleFactor:
                                                                  0.85,
                                                              overflow:
                                                                  TextOverflow
                                                                      .fade,
                                                              maxLines: 1,
                                                              style: GoogleFonts.koHo(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Colors
                                                                      .white)),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          });
                                    }),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 23, top: 10, bottom: 10),
                              child: Row(
                                children: [
                                  Text("All Courses",
                                      textScaleFactor: 0.85,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: GoogleFonts.hind(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromRGBO(0, 0, 0, 1))),
                                ],
                              ),
                            ),
                            StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('Course')
                                    .snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshotsss) {
                                  if (snapshotsss.connectionState ==
                                      ConnectionState.waiting) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 90.0),
                                      child: CardProfileSkeleton(
                                        isCircularImage: true,
                                        isBottomLinesActive: true,
                                      ),
                                    );
                                  }
                                  return ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: snapshotsss.data.docs.length,
                                      itemBuilder: (context, i) {
                                        return SearchCourseCard(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  SwipeablePageRoute(
                                                      transitionDuration:
                                                          Duration(
                                                              milliseconds:
                                                                  870),
                                                      canOnlySwipeFromEdge:
                                                          false,
                                                      canSwipe: false,
                                                      builder: (BuildContext
                                                              context) =>
                                                          ShowCoursePage(
                                                            courseId:
                                                                snapshotsss.data
                                                                        .docs[i]
                                                                    [
                                                                    'courseId'],
                                                          )));
                                            },
                                            courseName: snapshotsss.data.docs[i]
                                                ['courseName'],
                                            videoNumber: snapshotsss.data
                                                .docs[i]['courseTotalVideo'],
                                            totalEnroll: snapshotsss
                                                .data.docs[i]['courseEnroll'],
                                            rating: snapshotsss.data.docs[i]
                                                ['totalRating'],
                                            coursePoster: snapshotsss
                                                .data.docs[i]['courseposter']);
                                      });
                                })
                          ],
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
