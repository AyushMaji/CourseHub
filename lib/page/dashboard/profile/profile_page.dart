// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning/page/course/course_page.dart';
import 'package:e_learning/page/dashboard/bookmark/bookmark_page.dart';
import 'package:e_learning/service/addcourse/addcourse_service.dart';
import 'package:e_learning/service/login/login_service.dart';
import 'package:e_learning/widget/EditCourseCard/Edit_course_card.dart';
import 'package:e_learning/widget/appbar/custom_appbar.dart';
import 'package:e_learning/widget/appbar/custom_course_appbar.dart';
import 'package:e_learning/widget/searchcard/search_card.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_skeleton/loader_skeleton.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: CustomAppBar(),
      ),
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
                  child: CardProfileSkeleton(
                    isCircularImage: true,
                    isBottomLinesActive: true,
                  ));
            }

            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 15),
                  CircleAvatar(
                    backgroundColor: Color.fromRGBO(0, 197, 126, 1),
                    radius: 58,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 56,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: CachedNetworkImage(
                          imageUrl: snapshot.data.docs[0]['picture'],
                          height: 100.9,
                          width: 100.9,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(
                            child: Shimmer.fromColors(
                              baseColor: Color.fromRGBO(225, 225, 225, 1),
                              highlightColor: Colors.white,
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 52,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 79),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(
                                131, 131, 131, 0.15000000596046448),
                            offset: Offset(0, -4),
                            blurRadius: 27)
                      ],
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/othersPic/profileline.png",
                            width: 80,
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  Navigator.of(context).push(SwipeablePageRoute(
                                      transitionDuration:
                                          Duration(milliseconds: 870),
                                      canOnlySwipeFromEdge: false,
                                      canSwipe: false,
                                      builder: (BuildContext context) =>
                                          ProfilecourseEnrollPage()));
                                },
                                child: Container(
                                  height: 165,
                                  width: 150,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
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
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(
                                          "assets/images/othersPic/profile1.png",
                                          height: 85),
                                      Text("Course Enroll",
                                          textScaleFactor: 0.85,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: GoogleFonts.koHo(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w700,
                                              color: Color.fromRGBO(
                                                  141, 138, 138, 0.88))),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  Navigator.of(context).push(SwipeablePageRoute(
                                      transitionDuration:
                                          Duration(milliseconds: 870),
                                      canOnlySwipeFromEdge: false,
                                      canSwipe: false,
                                      builder: (BuildContext context) =>
                                          ProfilePaymentPage()));
                                },
                                child: Container(
                                  height: 165,
                                  width: 150,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
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
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(
                                          "assets/images/othersPic/money.png",
                                          height: 85),
                                      Text("Payment His..",
                                          textScaleFactor: 0.85,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: GoogleFonts.koHo(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w700,
                                              color: Color.fromRGBO(
                                                  141, 138, 138, 0.88))),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 25),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(SwipeablePageRoute(
                                  transitionDuration:
                                      Duration(milliseconds: 870),
                                  canOnlySwipeFromEdge: false,
                                  canSwipe: false,
                                  builder: (BuildContext context) =>
                                      ProfileBookmarkPage()));
                            },
                            child: Container(
                              height: 65,
                              width: MediaQuery.of(context).size.width / 1.1,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                                color: Color.fromRGBO(0, 197, 126, 1),
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 50, right: 10),
                                            child: Icon(
                                              Icons.book_rounded,
                                              color: Colors.white,
                                            )),
                                        Text("  Your Saved Course ",
                                            textScaleFactor: 0.85,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: GoogleFonts.koHo(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white)),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Image.asset(
                                        "assets/images/iconPic/click.png",
                                        height: 40,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                          SizedBox(height: 25),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(SwipeablePageRoute(
                                  transitionDuration:
                                      Duration(milliseconds: 870),
                                  canOnlySwipeFromEdge: false,
                                  canSwipe: false,
                                  builder: (BuildContext context) =>
                                      yourcreatedPage()));
                            },
                            child: Container(
                              height: 65,
                              width: MediaQuery.of(context).size.width / 1.1,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                                color: Color.fromRGBO(0, 197, 126, 1),
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 40, right: 10),
                                            child: Icon(
                                              Icons.upload_file,
                                              color: Colors.white,
                                            )),
                                        Text("     your created course",
                                            textScaleFactor: 0.85,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: GoogleFonts.koHo(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white)),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Image.asset(
                                        "assets/images/iconPic/click.png",
                                        height: 40,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

// ====================== Course Enrolll  ==============

//  ======================== your saved video  =====================
class ProfileBookmarkPage extends StatelessWidget {
  const ProfileBookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: CustomCourseAppBar(
          apptittle: 'Save Course',
          icon: Icon(
            Icons.bookmark_add,
            color: Colors.amber,
          ),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('BookMark')
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
              return Center(
                child: Lottie.asset(
                  'assets/images/othersPic/nosave.json',
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
                      return EditCourseCard(
                        onTap: () {
                          Navigator.of(context).push(SwipeablePageRoute(
                              transitionDuration: Duration(milliseconds: 870),
                              canOnlySwipeFromEdge: false,
                              canSwipe: false,
                              builder: (BuildContext context) => ShowCoursePage(
                                    courseId: snapshot.data.docs[0]['courseId'],
                                  )));
                        },
                        onDelete: () {
                          Provider.of<AddCourseService>(context, listen: false)
                              .deleteBookMark(snapshot.data.docs[0]['ownerId'],
                                  snapshot.data.docs[0]['courseId'])
                              .whenComplete(() => {
                                    Fluttertoast.showToast(
                                        msg:
                                            "Successfully delete from bookmarkpage",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.black26,
                                        textColor: Colors.white,
                                        fontSize: 16.0)
                                  });
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

//  ======================== your saved video  =====================

//  ======================== your Enroll Course  =====================
class ProfilecourseEnrollPage extends StatelessWidget {
  const ProfilecourseEnrollPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: CustomCourseAppBar(
          apptittle: 'Course Enroll',
          icon: Icon(
            Icons.bookmark_add,
            color: Colors.amber,
          ),
        ),
      ),
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
              return Center(
                child: Lottie.asset(
                  'assets/images/othersPic/noenroll.json',
                  height: 300,
                ),
              );
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

//  ======================== your created course  =====================
class yourcreatedPage extends StatelessWidget {
  const yourcreatedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: CustomCourseAppBar(
          apptittle: 'Course Enroll',
          icon: Icon(
            Icons.bookmark_add,
            color: Colors.amber,
          ),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Course')
              .where('ownerId',
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
              return Center(
                child: Lottie.asset(
                  'assets/images/othersPic/noenroll2.json',
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
                    Navigator.of(context).push(SwipeablePageRoute(
                        transitionDuration: Duration(milliseconds: 870),
                        canOnlySwipeFromEdge: false,
                        canSwipe: false,
                        builder: (BuildContext context) => ShowCoursePage(
                              courseId: snapshot.data.docs[i]['courseId'],
                            )));
                  },
                  courseName: snapshot.data.docs[i]['courseName'],
                  coursePoster: snapshot.data.docs[i]['courseposter'],
                  rating: snapshot.data.docs[i]['totalRating'],
                  videoNumber: snapshot.data.docs[i]['courseTotalVideo'],
                  totalEnroll: snapshot.data.docs[i]['courseEnroll'],
                );
              },
            );
          }),
    );
  }
}

//  ======================== you rcreated course  =====================

//  ======================== Paymment History  =====================

class ProfilePaymentPage extends StatelessWidget {
  const ProfilePaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: CustomCourseAppBar(
          apptittle: 'Paument History',
          icon: Icon(
            Icons.payment,
            color: Colors.amber,
          ),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Payment')
              .where('userId',
                  isEqualTo: Provider.of<LoginService>(context, listen: false)
                      .obtainUserId)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CardListSkeleton(
                length: 10,
                isBottomLinesActive: true,
              );
            }
            if (snapshot.data.docs.length == 0) {
              return Center(
                child: Lottie.asset(
                  'assets/images/othersPic/nopayment.json',
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
                return StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Course')
                        .where('courseId',
                            isEqualTo: snapshot.data.docs[i]['courseId'])
                        .snapshots(),
                    builder: (BuildContext context, AsyncSnapshot snapshots) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CardListSkeleton(
                          length: 10,
                          isBottomLinesActive: true,
                        );
                      }

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Container(
                          height: 90,
                          width: MediaQuery.of(context).size.width / 1.1,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        imageUrl: snapshots.data.docs[0]
                                            ['courseposter'],
                                        height: 70.9,
                                        width: 90.9,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) => Center(
                                          child: Shimmer.fromColors(
                                            baseColor: Color.fromRGBO(
                                                225, 225, 225, 1),
                                            highlightColor: Colors.white,
                                            child: Image.asset(
                                              "assets/images/othersPic/placeholder.png",
                                              height: 70,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 180,
                                            child: Text(
                                                snapshots.data.docs[0]
                                                    ['courseName'],
                                                textScaleFactor: 0.85,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: GoogleFonts.roboto(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w900,
                                                    color: Color.fromRGBO(
                                                        1, 118, 178, 1))),
                                          ),
                                          SizedBox(height: 5),
                                          Text(snapshot.data.docs[i]['status'],
                                              textScaleFactor: 0.85,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: GoogleFonts.hind(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                  color: snapshot.data.docs[i]
                                                              ['status'] ==
                                                          "Successful"
                                                      ? Colors.green
                                                      : Colors.red)),
                                          SizedBox(height: 2),
                                          Text("2monts ago ",
                                              textScaleFactor: 0.85,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: GoogleFonts.koHo(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.grey)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: Text(
                                    "Rs. ${snapshots.data.docs[0]['courseOfferPrice']} ",
                                    textScaleFactor: 0.85,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: GoogleFonts.roboto(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black45)),
                              ),
                            ],
                          ),
                        ),
                      );

                      // );
                    });
              },
            );
          }),
    );
  }
}

//  ======================== Paymment History  =====================

