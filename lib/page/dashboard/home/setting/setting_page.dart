// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning/page/course/course_page.dart';
import 'package:e_learning/page/dashboard/sidenav_page.dart';
import 'package:e_learning/page/spalsh/spalsh_page.dart';
import 'package:e_learning/service/addcourse/addcourse_service.dart';
import 'package:e_learning/service/login/login_service.dart';
import 'package:e_learning/widget/EditCourseCard/Edit_course_card.dart';
import 'package:e_learning/widget/appbar/custom_course_appbar.dart';
import 'package:e_learning/widget/searchcard/search_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_skeleton/loader_skeleton.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
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
                  isCircularImage: true,
                  isBottomLinesActive: true,
                  length: 3,
                ));
          }

          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 35),
                  // =======================  profile pic document ============== >>>>>>>>>>
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: InkWell(
                      onTap: () => {professionoption(context)},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 100,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(22),
                              topRight: Radius.circular(22),
                              bottomLeft: Radius.circular(22),
                              bottomRight: Radius.circular(22),
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
                                padding: const EdgeInsets.only(left: 20),
                                child: CircleAvatar(
                                  backgroundColor:
                                      Color.fromRGBO(0, 197, 126, 1),
                                  radius: 34,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 32,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Color.fromRGBO(120, 104, 230, 1),
                                      radius: 30,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: CachedNetworkImage(
                                          imageUrl: snapshot.data.docs[0]
                                              ['picture'],
                                          height: 100.9,
                                          width: 100.9,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) => Center(
                                            child: Shimmer.fromColors(
                                              baseColor: Color.fromRGBO(
                                                  225, 225, 225, 1),
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
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(snapshot.data.docs[0]['name'],
                                      textScaleFactor: 0.85,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: GoogleFonts.roboto(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w900,
                                          color:
                                              Color.fromRGBO(0, 197, 126, 1))),
                                  SizedBox(height: 5),
                                  Text(
                                      "( ${snapshot.data.docs[0]['profession']} )",
                                      textScaleFactor: 0.85,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: GoogleFonts.hind(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Color.fromRGBO(
                                              21, 21, 21, 0.42))),
                                ],
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(right: 25),
                                  child: Icon(Icons.mode_edit_outlined))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // ======================= profile pic document ============== >>>>>>>>>>

                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(SwipeablePageRoute(
                              transitionDuration: Duration(milliseconds: 870),
                              canOnlySwipeFromEdge: false,
                              canSwipe: false,
                              builder: (BuildContext context) =>
                                  settingBookmarkPage()));
                        },
                        highlightColor: Colors.transparent,
                        child: Container(
                          height: 70,
                          width: 160,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            color: Color.fromRGBO(155, 155, 155, 0.07),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/iconPic/saved.png"),
                              Text("Saved",
                                  textScaleFactor: 0.85,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: GoogleFonts.koHo(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(0, 0, 0, 0.61))),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Navigator.of(context).push(SwipeablePageRoute(
                              transitionDuration: Duration(milliseconds: 870),
                              canOnlySwipeFromEdge: false,
                              canSwipe: false,
                              builder: (BuildContext context) =>
                                  SettingcourseEnrollPage()));
                        },
                        child: Container(
                          height: 70,
                          width: 160,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            color: Color.fromRGBO(155, 155, 155, 0.07),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/iconPic/setting.png",
                                height: 45,
                              ),
                              Text("   Enroll",
                                  textScaleFactor: 0.85,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: GoogleFonts.koHo(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(0, 0, 0, 0.61))),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(SwipeablePageRoute(
                              transitionDuration: Duration(milliseconds: 870),
                              canOnlySwipeFromEdge: false,
                              canSwipe: false,
                              builder: (BuildContext context) =>
                                  setttingPaymentPage()));
                        },
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Container(
                          height: 70,
                          width: 160,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            color: Color.fromRGBO(155, 155, 155, 0.07),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/iconPic/terms.png",
                                height: 54,
                              ),
                              Text("   payment",
                                  textScaleFactor: 0.85,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: GoogleFonts.koHo(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(0, 0, 0, 0.61))),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Fluttertoast.showToast(
                              msg: "after publish app in playstore",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black26,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        },
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Container(
                          height: 70,
                          width: 160,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            color: Color.fromRGBO(155, 155, 155, 0.07),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/iconPic/share.png",
                                height: 45,
                              ),
                              Text("   Share",
                                  textScaleFactor: 0.85,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: GoogleFonts.koHo(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(0, 0, 0, 0.61))),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: Color.fromRGBO(155, 155, 155, 0.07),
                    ),
                    child: InkWell(
                      onTap: () {
                        FlutterPhoneDirectCaller.callNumber("9749003015");
                      },
                      highlightColor: Colors.transparent,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 55, right: 10),
                                    child: Icon(
                                      Icons.phone_sharp,
                                      color: Color.fromRGBO(0, 197, 126, 1),
                                    )),
                                Text("   Contact with Us",
                                    textScaleFactor: 0.85,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: GoogleFonts.koHo(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(0, 0, 0, 0.61))),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Image.asset(
                                "assets/images/iconPic/click.png",
                                height: 54,
                              ),
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Provider.of<LoginService>(context, listen: false)
                          .signOutWithGoogle()
                          .whenComplete(() => {
                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: SpalshPage()))
                              });
                    },
                    child: Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width / 1.1,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        color: Color.fromRGBO(155, 155, 155, 0.07),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 55, right: 10),
                                    child: Icon(
                                      Icons.logout_rounded,
                                      color: Color.fromRGBO(0, 197, 126, 1),
                                    )),
                                Text("   Sign Out ",
                                    textScaleFactor: 0.85,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: GoogleFonts.koHo(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(0, 0, 0, 0.61))),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Image.asset(
                                "assets/images/iconPic/click.png",
                                height: 54,
                              ),
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        });
  }

  // bootoomSheet ============================
  professionoption(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(42.0),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height / 2.1,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(42),
              topRight: Radius.circular(42),
            ),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                  offset: Offset(0, 4),
                  blurRadius: 42)
            ],
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // teacher ==========
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Provider.of<LoginService>(context, listen: false)
                              .choseProfession("teacher");
                        },
                        child: Container(
                          width: 140,
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color:
                                Provider.of<LoginService>(context, listen: true)
                                            .getprofession ==
                                        "teacher"
                                    ? Color.fromRGBO(81, 195, 254, 0.61)
                                    : Color.fromRGBO(81, 195, 254, 0.28),
                            border: Border.all(
                              color: Provider.of<LoginService>(context,
                                              listen: true)
                                          .getprofession ==
                                      "teacher"
                                  ? Color.fromRGBO(81, 119, 254, 1)
                                  : Color.fromRGBO(255, 255, 255, 1),
                              width: 1,
                            ),
                          ),
                          child: Image.asset(
                              "assets/images/othersPic/teacher.png"),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Teacher",
                          textScaleFactor: 0.85,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.koHo(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.green)),
                    ],
                  ),
                  // student ==========
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Provider.of<LoginService>(context, listen: false)
                              .choseProfession("student");
                        },
                        child: Container(
                          width: 140,
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color:
                                Provider.of<LoginService>(context, listen: true)
                                            .getprofession ==
                                        "student"
                                    ? Color.fromRGBO(215, 14, 26, 0.45)
                                    : Color.fromRGBO(214, 14, 26, 0.08),
                            border: Border.all(
                              color: Provider.of<LoginService>(context,
                                              listen: true)
                                          .getprofession ==
                                      "student"
                                  ? Color.fromRGBO(214, 14, 26, 1)
                                  : Color.fromRGBO(255, 255, 255, 1),
                              width: 1,
                            ),
                          ),
                          child: Image.asset(
                              "assets/images/othersPic/student.png"),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Student",
                          textScaleFactor: 0.85,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.koHo(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.green)),
                    ],
                  ),
                ],
              ),
              // botton =======
              InkWell(
                onTap: () => {
                  Provider.of<LoginService>(context, listen: false)
                      .updateProfession()
                      .whenComplete(() => {
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: SidenavPage()))
                          })
                },
                child: Container(
                  height: 46,
                  width: MediaQuery.of(context).size.width / 1.17,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(129, 129, 129, 0.25),
                          offset: Offset(0, 4),
                          blurRadius: 20)
                    ],
                    color: Color.fromRGBO(0, 197, 126, 1),
                  ),
                  child: Center(
                    child: Text("Next",
                        textScaleFactor: 0.85,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.koHo(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
// bootoomSheet ============================
}

//  ======================== your saved video  =====================
class settingBookmarkPage extends StatelessWidget {
  const settingBookmarkPage({Key? key}) : super(key: key);

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
                  'assets/images/othersPic/nobookmark.json',
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
                                        msg: "Successfully remove",
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
class SettingcourseEnrollPage extends StatelessWidget {
  const SettingcourseEnrollPage({Key? key}) : super(key: key);

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
class SettingyourcreatedPage extends StatelessWidget {
  const SettingyourcreatedPage({Key? key}) : super(key: key);

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

class setttingPaymentPage extends StatelessWidget {
  const setttingPaymentPage({Key? key}) : super(key: key);

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