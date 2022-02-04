// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning/page/dashboard/home/home/teacher/course/editcourse/video/editvideo/Edit_video.dart';
import 'package:e_learning/page/dashboard/home/home/teacher/course/editcourse/video/showvideo/showvideo.dart';
import 'package:e_learning/page/dashboard/home/home/teacher/course/editcourse/video/uplodevideo/uplode_video.dart';
import 'package:e_learning/service/addcourse/addcourse_service.dart';
import 'package:e_learning/service/login/login_service.dart';
import 'package:e_learning/widget/editvideocard/edit_video_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_skeleton/loader_skeleton.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class VideoPage extends StatelessWidget {
  final String? courseId;
  const VideoPage({
    Key? key,
    required this.courseId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {
          Navigator.of(context).push(SwipeablePageRoute(
              transitionDuration: Duration(milliseconds: 870),
              canOnlySwipeFromEdge: false,
              canSwipe: false,
              builder: (BuildContext context) => UplodeVideoPage(
                    courseId: courseId,
                  )))
        },
        icon: Icon(Icons.upload_rounded),
        label: Text("Uplode your video Course",
            textScaleFactor: 0.85,
            style: GoogleFonts.roboto(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.white)),
      ),
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
                      .doc(courseId)
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
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (BuildContext context, i) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: EditVideoCard(
                            videoNumber: (i + 1).toString(),
                            videoTitie: snapshot.data.docs[i]['videoTittle'],
                            onDelete: () {
                              Provider.of<AddCourseService>(context,
                                      listen: false)
                                  .deletevideo(courseId,
                                      snapshot.data.docs[i]['videoId']);
                            },
                            onEdit: () {
                              Navigator.of(context).push(SwipeablePageRoute(
                                  transitionDuration:
                                      Duration(milliseconds: 870),
                                  canOnlySwipeFromEdge: false,
                                  canSwipe: false,
                                  builder: (BuildContext context) =>
                                      EditVideoPage(
                                        courseId: courseId,
                                        videoId: snapshot.data.docs[i]
                                            ['videoId'],
                                      )));
                            },
                            onTap: () {
                              Navigator.of(context).push(SwipeablePageRoute(
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
                                      )));
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
