// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_skeleton/loader_skeleton.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'package:timeago/timeago.dart' as timeago;

class DescriptionPage extends StatelessWidget {
  final String? courseId;
  const DescriptionPage({
    Key? key,
    required this.courseId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<Object>(
          stream: FirebaseFirestore.instance
              .collection('Course')
              .where('courseId', isEqualTo: courseId)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CardProfileSkeleton(
                    isCircularImage: true,
                    isBottomLinesActive: true,
                  ));
            }
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color:
                                  Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                              offset: Offset(0, 4),
                              blurRadius: 25)
                        ],
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: Container(
                        height: 250,
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: snapshot.data.docs[0]['courseposter'],
                            height: 85.9,
                            width: 108.9,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Center(
                              child: Shimmer.fromColors(
                                baseColor: Color.fromRGBO(225, 225, 225, 1),
                                highlightColor: Colors.white,
                                child: Image.asset(
                                  "assets/images/othersPic/placeholder.png",
                                  height: 70,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 17),
                      child: Text("${snapshot.data.docs[0]['courseName']}",
                          textScaleFactor: 0.85,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: GoogleFonts.hind(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: const Color.fromRGBO(0, 0, 0, 0.46))),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                      ),
                      child: Text("Description",
                          textScaleFactor: 0.85,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.hind(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: const Color.fromRGBO(0, 197, 126, 1))),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 10),
                      child: Text(
                        "${snapshot.data.docs[0]['courseAbout']}",
                        textScaleFactor: 0.85,
                        style: GoogleFonts.hind(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(187, 187, 187, 1),
                        ),
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(children: [
                              Image.asset(
                                "assets/images/iconPic/lesson.png",
                                height: 70,
                              ),
                              Text(
                                  "${snapshot.data.docs[0]['courseTotalVideo']} lectures",
                                  textScaleFactor: 0.85,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: GoogleFonts.koHo(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color:
                                          const Color.fromRGBO(0, 0, 0, 0.46))),
                            ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Container(
                              child: Row(children: [
                                Image.asset(
                                  "assets/images/iconPic/rating.png",
                                  height: 70,
                                ),
                                Text("${snapshot.data.docs[0]['totalRating']}",
                                    textScaleFactor: 0.85,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: GoogleFonts.koHo(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: const Color.fromRGBO(
                                            0, 0, 0, 0.46))),
                              ]),
                            ),
                          ),
                        ]),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 10),
                      child: Text("This course includes",
                          textScaleFactor: 0.85,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.hind(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: const Color.fromRGBO(0, 197, 126, 1))),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 5),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.all_inclusive_outlined),
                              Text(
                                "     Full Time Acces",
                                textScaleFactor: 0.85,
                                style: GoogleFonts.hind(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(187, 187, 187, 1),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(Icons.videocam_outlined),
                              Text(
                                "     ${snapshot.data.docs[0]['courseTotalVideo']} Video Lesson",
                                textScaleFactor: 0.85,
                                style: GoogleFonts.hind(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(187, 187, 187, 1),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(Icons.access_time),
                              Text(
                                "      ${timeago.format(snapshot.data.docs[0]['timeStamp'].toDate(), locale: 'en')}",
                                textScaleFactor: 0.85,
                                style: GoogleFonts.hind(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(187, 187, 187, 1),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(Icons.people),
                              Text(
                                "     ${snapshot.data.docs[0]['courseEnroll']} student",
                                textScaleFactor: 0.85,
                                style: GoogleFonts.hind(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(187, 187, 187, 1),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 5),
                      child: Text("Who this course for : ",
                          textScaleFactor: 0.85,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.hind(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: const Color.fromRGBO(0, 197, 126, 1))),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 10),
                      child: Text(
                        "${snapshot.data.docs[0]['courseFor']}",
                        textScaleFactor: 0.85,
                        style: GoogleFonts.hind(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(187, 187, 187, 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 2),
                      child: Text("Prerequisite",
                          textScaleFactor: 0.85,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.hind(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: const Color.fromRGBO(0, 197, 126, 1))),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 10),
                      child: Text(
                        "${snapshot.data.docs[0]['coursePerequesatory']}",
                        textScaleFactor: 0.85,
                        style: GoogleFonts.hind(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(187, 187, 187, 1),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 2),
                      child: Text("Instructor",
                          textScaleFactor: 0.85,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.hind(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: const Color.fromRGBO(0, 197, 126, 1))),
                    ),
                    SizedBox(height: 16),
                    Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width / 1.1,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(26),
                          topRight: Radius.circular(26),
                          bottomLeft: Radius.circular(26),
                          bottomRight: Radius.circular(26),
                        ),
                        color: Color.fromRGBO(238, 249, 255, 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 19, right: 13),
                            child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(19),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      '${snapshot.data.docs[0]['ownerPic']}',
                                  height: 90,
                                  width: 90,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Center(
                                    child: Shimmer.fromColors(
                                      baseColor:
                                          Color.fromRGBO(225, 225, 225, 1),
                                      highlightColor: Colors.white,
                                      child: Image.asset(
                                        "assets/images/othersPic/placeholder.png",
                                        height: 70,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text("${snapshot.data.docs[0]['courseEmail']}",
                              textScaleFactor: 0.85,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.koHo(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.green)),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width / 1.1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          color: Color.fromRGBO(255, 255, 255, 1),
                          border: Border.all(
                              color: Color.fromRGBO(0, 197, 126, 1))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "${snapshot.data.docs[0]['courseOffer']} % off",
                                    textScaleFactor: 0.85,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: GoogleFonts.koHo(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.green)),
                                Text.rich(
                                  TextSpan(
                                    text:
                                        "${snapshot.data.docs[0]['coursePrice']}",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text("Total Amount",
                                      textScaleFactor: 0.85,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: GoogleFonts.koHo(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          color: Color.fromRGBO(
                                              255, 22, 78, 0.7))),
                                ),
                                Text(
                                    "${snapshot.data.docs[0]['courseOfferPrice']}",
                                    textScaleFactor: 0.85,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: GoogleFonts.koHo(
                                        fontSize: 50,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.green)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),

                    // InkWell(
                    //   onTap: () {},
                    //   child: Container(
                    //     height: 52,
                    //     width: MediaQuery.of(context).size.width / 1.1,
                    //     decoration: const BoxDecoration(
                    //       borderRadius: BorderRadius.only(
                    //         topLeft: Radius.circular(10),
                    //         topRight: Radius.circular(10),
                    //         bottomLeft: Radius.circular(10),
                    //         bottomRight: Radius.circular(10),
                    //       ),
                    //       boxShadow: [
                    //         BoxShadow(
                    //             color: Color.fromRGBO(
                    //                 0, 0, 0, 0.07999999821186066),
                    //             offset: Offset(0, 4),
                    //             blurRadius: 25)
                    //       ],
                    //       color: Color.fromRGBO(0, 197, 126, 1),
                    //     ),
                    //     child: Center(
                    //       child: Text("EDIT DEYAILS",
                    //           textScaleFactor: 0.85,
                    //           overflow: TextOverflow.ellipsis,
                    //           maxLines: 1,
                    //           style: GoogleFonts.roboto(
                    //               fontSize: 17,
                    //               fontWeight: FontWeight.w700,
                    //               color: Colors.white)),
                    //     ),
                    //   ),
                    // ),

                    SizedBox(height: 20),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
