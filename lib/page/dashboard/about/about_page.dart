// ignore_for_file: prefer_const_constructors

import 'package:e_learning/widget/appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Center(
            child: Image.asset(
              "assets/images/othersPic/about.png",
              height: 300,
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/othersPic/about1.png",
                  height: 25,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, top: 12, right: 35),
            child: Text(
                "Course Hub enables the teacher and the student to set their own learning pace, and there's the added flexibility of setting a schedule that fits everyone's agenda. Studying online teaches you vital time management skills, which makes finding a good work-study balance easier.",
                textScaleFactor: 0.85,
                textAlign: TextAlign.justify,
                style: GoogleFonts.hind(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(187, 187, 187, 1))),
          ),
          SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/othersPic/about2.png",
                  height: 25,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, top: 12, right: 35),
            child: Text(
                "Course Hub are the modern version of courses: you can create and share learning content in an organized way that allows users to progress in their understanding of a certain topic. Online courses can include videos, images, text and hyperlinks.",
                textScaleFactor: 0.85,
                textAlign: TextAlign.justify,
                style: GoogleFonts.hind(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(187, 187, 187, 1))),
          ),
        ]),
      ),
    );
    ;
  }
}
