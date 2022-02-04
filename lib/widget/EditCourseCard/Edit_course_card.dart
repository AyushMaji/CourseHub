// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class EditCourseCard extends StatelessWidget {
  final String courseName;
  final String videoNumber;
  final String totalEnroll;
  final String coursePoster;
  final String rating;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onDelete;

  const EditCourseCard(
      {Key? key,
      required this.courseName,
      required this.videoNumber,
      required this.totalEnroll,
      required this.rating,
      required this.coursePoster,
      this.onTap,
      this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 114,
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22),
            topRight: Radius.circular(22),
            bottomLeft: Radius.circular(22),
            bottomRight: Radius.circular(22),
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
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: onTap,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: CachedNetworkImage(
                        imageUrl:coursePoster,
                        height: 85.9,
                        width: 108.9,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Center(
                          child: Shimmer.fromColors(
                            baseColor: Color.fromRGBO(225, 225, 225, 1),
                            highlightColor: Colors.white,
                            child: Image.asset(
                              "assets/images/othersPic/placeholder.png",
                              height: 108,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 130,
                          child: Text(courseName,
                              textScaleFactor: 0.85,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(0, 181, 116, 1))),
                        ),
                        SizedBox(height: 8),
                        Text("$videoNumber Lesson",
                            textScaleFactor: 0.85,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: GoogleFonts.hind(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(21, 21, 21, 0.28))),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.people,
                                    size: 15,
                                    color: Color.fromRGBO(0, 181, 116, 1),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 7),
                                    child: Text(totalEnroll,
                                        textScaleFactor: 0.85,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: GoogleFonts.roboto(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w900,
                                            color: Color.fromRGBO(
                                                21, 21, 21, 0.28))),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Color.fromRGBO(0, 181, 116, 1),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(rating,
                                        textScaleFactor: 0.85,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: GoogleFonts.roboto(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w900,
                                            color: Color.fromRGBO(
                                                21, 21, 21, 0.28))),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: onDelete,
                child: Icon(
                  Icons.delete_outline,
                  size: 26,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
