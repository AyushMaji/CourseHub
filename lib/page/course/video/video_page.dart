// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning/service/addcourse/addcourse_service.dart';
import 'package:e_learning/service/login/login_service.dart';
import 'package:e_learning/widget/showcoursevideo/show_video_card.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_skeleton/loader_skeleton.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import 'showvideo/showvideo.dart';

class ShowVideoPage extends StatefulWidget {
  final String? courseId;
  const ShowVideoPage({
    Key? key,
    required this.courseId,
  }) : super(key: key);

  @override
  State<ShowVideoPage> createState() => _ShowVideoPageState();
}

class _ShowVideoPageState extends State<ShowVideoPage> {
  @override
  void initState() {
    Provider.of<AddCourseService>(context, listen: false).cheackEnroll(
        Provider.of<LoginService>(context, listen: false).getobtainUserId,
        widget.courseId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              ///// backendata fetch =======================
              Container(
                height: 600,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Course')
                      .doc(widget.courseId)
                      .collection("Videos")
                      .orderBy("timeStamp")
                      .snapshots(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: CardListSkeleton(
                            isCircularImage: true,
                            isBottomLinesActive: true,
                            length: 2,
                          ));
                    }
                    if (snapshot.data.docs.length == 0) {
                      return Center(
                        child: Lottie.asset(
                          'assets/images/othersPic/novideo.json',
                          height: 600,
                        ),
                      );
                    }

                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (BuildContext context, i) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: ShowVideoCard(
                            videoNumber: (i + 1).toString(),
                            videoTitie: snapshot.data.docs[i]['videoTittle'],
                            onTap: () {
                              Provider.of<AddCourseService>(context,
                                              listen: true)
                                          .getisEnroll ==
                                      true
                                  ? Navigator.of(context).push(
                                      SwipeablePageRoute(
                                          transitionDuration:
                                              Duration(milliseconds: 870),
                                          canOnlySwipeFromEdge: false,
                                          canSwipe: false,
                                          builder: (BuildContext context) =>
                                              ShowVideoRender(
                                                videourl: snapshot.data.docs[i]
                                                    ['videoLink'],
                                                courseIde: snapshot.data.docs[i]
                                                    ['courseId'],
                                                videono: i,
                                                videoId: snapshot.data.docs[i]
                                                    ['videoId'],
                                              )))
                                  : showAlertDialog(context);
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ========================================== For Course not enroll
showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = ElevatedButton(
    style: ElevatedButton.styleFrom(primary: Color.fromRGBO(0, 197, 126, 1)),
    child: Text("Ok"),
    onPressed: () {
      Navigator.of(context).pop(); // dismiss dialog
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Enroll This  Course",
        textScaleFactor: 0.85,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: GoogleFonts.roboto(
            fontSize: 20, fontWeight: FontWeight.w700, color: Colors.red)),
    content: Text(
        "If you want to unlock this course then you need to be admitted in this course",
        style: GoogleFonts.roboto(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(0, 0, 0, 0.63))),
    actions: [
      cancelButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
// ========================================== For For Course not enroll
