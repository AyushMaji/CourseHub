// ignore_for_file: prefer_const_constructors

import 'package:e_learning/widget/appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          FlutterPhoneDirectCaller.callNumber("9749003015");
        },
        autofocus: true,
        backgroundColor: Color.fromRGBO(0, 197, 126, 1),
        icon: Icon(Icons.support_agent_outlined),
        label: Text("Suport",
            textScaleFactor: 0.85,
            style: GoogleFonts.roboto(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.white)),
      ),
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Center(
            child: Image.asset(
              "assets/images/othersPic/contact.png",
              height: 300,
            ),
          ),
          Image.asset(
            "assets/images/othersPic/email.png",
            height: 60,
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
            padding: const EdgeInsets.only(left: 34, top: 10, right: 30),
            child: Text(
                "Course Hub have a huge team for support and help . If you face any problems or issues while using Orevent , please kindly inform us we will solve your issues as soon as possible.Our email id teacherPoint2722001@gmail.com And if you have any suggestions for improvement of Orevent please kindly write down your valuable suggestions in the comment box below.",
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
  }
}
