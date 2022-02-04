// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning/page/dashboard/home/home/teacher/teacher_home_page.dart';
import 'package:e_learning/service/feedback/feedback.dart';
import 'package:e_learning/service/login/login_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:loader_skeleton/loader_skeleton.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeago/timeago.dart' as timeago;

class ReviewPage extends StatelessWidget {
  final String? courseId;
  ReviewPage({Key? key, required this.courseId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String userID =
        Provider.of<LoginService>(context, listen: true).obtainUserId;
    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Course')
                .where("courseId", isEqualTo: courseId)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Padding(
                  padding: const EdgeInsets.only(top: 90.0),
                  child: CardProfileSkeleton(
                    isCircularImage: false,
                    isBottomLinesActive: true,
                  ),
                );
              }
              return Column(
                children: [
                  Image.asset("assets/images/othersPic/review.png"),
                  const SizedBox(height: 20),
                  Container(
                    height: 60,
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
                            color: Color.fromRGBO(0, 0, 0, 0.07999999821186066),
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
                          child: Text(
                              snapshot.data.docs[0]['totalRating'].toString(),
                              textScaleFactor: 0.85,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.koHo(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(0, 197, 126, 1))),
                        ),
                        RatingBarIndicator(
                          rating: double.parse(
                              snapshot.data.docs[0]['totalRating'].toString()),
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Color.fromRGBO(0, 197, 126, 1),
                          ),
                          itemCount: 5,
                          itemSize: 25.0,
                          direction: Axis.horizontal,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  snapshot.data.docs[0]['totalRatingNumber']
                                      .toString(),
                                  textScaleFactor: 0.85,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: GoogleFonts.koHo(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromRGBO(0, 197, 126, 1),
                                  )),
                              Text("REVIEW",
                                  textScaleFactor: 0.85,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: GoogleFonts.koHo(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromRGBO(0, 197, 126, 1),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )

                  // ============= coomentbox =========== >>>>>>>>>>>>>>>

                  // ===================================== comment box
                  ,
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 28,
                        ),
                        StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('Course')
                                .doc(courseId)
                                .collection('Comments')
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot snapshotssss) {
                              if (snapshotssss.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CardPageSkeleton(
                                  totalLines: 3,
                                ));
                              }
                              if (snapshotssss.data.docs.length == 0) {
                                return Center(
                                  child: Lottie.asset(
                                    'assets/images/othersPic/comment.json',
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              }
                              return ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: snapshotssss.data.docs.length,
                                  itemBuilder: (context, i) {
                                    return Center(
                                      child:
                                          snapshotssss.data.docs[i]['comment']
                                                      .length >
                                                  0
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(width: 10),
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl:
                                                                snapshotssss
                                                                        .data
                                                                        .docs[i]
                                                                    ['pic'],
                                                            height: 40.9,
                                                            width: 40.9,
                                                            fit: BoxFit.cover,
                                                            placeholder:
                                                                (context,
                                                                        url) =>
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
                                                                    Colors
                                                                        .white,
                                                                child:
                                                                    CircleAvatar(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .grey,
                                                                  radius: 35,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 10),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          30.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          30.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          30.0),
                                                                ),
                                                                color: Color
                                                                    .fromRGBO(
                                                                        232,
                                                                        233,
                                                                        243,
                                                                        0.69),
                                                              ),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SizedBox(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        1.5,
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                              .all(
                                                                          15.0),
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          InkWell(
                                                                            onLongPress:
                                                                                () {
                                                                              userID == snapshotssss.data.docs[i]['userID'] ? showAlertDialog(context, snapshotssss.data.docs[i]['courseId'], userID) : print("object");
                                                                            },
                                                                            child:
                                                                                Row(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Row(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      snapshotssss.data.docs[i]['Ownername'],
                                                                                      textScaleFactor: 0.85,
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                      style: GoogleFonts.hind(
                                                                                        fontSize: 14.5,
                                                                                        fontWeight: FontWeight.w800,
                                                                                        color: Color.fromRGBO(0, 0, 0, 0.6),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(width: 5),
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.only(top: 3),
                                                                                      child: Text(
                                                                                        " ${timeago.format(snapshotssss.data.docs[i]['timeStamp'].toDate())} ",
                                                                                        textScaleFactor: 0.85,
                                                                                        style: GoogleFonts.koHo(
                                                                                          fontSize: 9,
                                                                                          fontWeight: FontWeight.w700,
                                                                                          color: Color.fromRGBO(0, 0, 0, 0.4),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                userID == snapshotssss.data.docs[i]['userID']
                                                                                    ? InkWell(
                                                                                        onTap: () {
                                                                                          showAlertDialog(context, snapshotssss.data.docs[i]['courseId'], userID);
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.delete,
                                                                                          size: 17,
                                                                                          color: Colors.red,
                                                                                        ))
                                                                                    : Text(''),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                              height: 3),
                                                                          Text(
                                                                            snapshotssss.data.docs[i]['comment'],
                                                                            style:
                                                                                GoogleFonts.hind(
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w600,
                                                                              color: Color.fromRGBO(157, 157, 157, 1),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 14,
                                                    )
                                                  ],
                                                )
                                              : Container(),
                                    );
                                  });
                            }),
                      ],
                    ),
                  ),
                  // ===================================== comment box
                ],
              );
            }),
      ),
    );
  }
}

// ========================================== For Comment Dlt  conformation
showAlertDialog(BuildContext context, shopId, userId) {
  // set up the buttons
  Widget cancelButton = ElevatedButton(
    style: ElevatedButton.styleFrom(primary: Color.fromRGBO(120, 104, 230, 1)),
    child: Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop(); // dismiss dialog
    },
  );
  Widget continueButton = ElevatedButton(
    style: ElevatedButton.styleFrom(primary: Color.fromRGBO(242, 82, 135, 1)),
    child: Text("Ok "),
    onPressed: () async {
      Provider.of<FeedBackService>(context, listen: false)
          .CommentDlt(shopId, userId)
          .whenComplete(() {
        Navigator.of(context).pop();
        Fluttertoast.showToast(
            msg: "Successfully delete your feedback",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black26,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Delete Your FeedBack"),
    content: Text("Are You Sure You Want to delete your comment ?"),
    actions: [
      cancelButton,
      continueButton,
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
// ========================================== For Comment Dlt  conformation