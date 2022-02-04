// ignore_for_file: prefer_const_constructors
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:async';
import 'package:e_learning/page/dashboard/sidenav_page.dart';
import 'package:e_learning/page/login/login_page.dart';
import 'package:e_learning/service/login/login_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpalshPage extends StatefulWidget {
  SpalshPage({Key? key}) : super(key: key);

  @override
  _SpalshPageState createState() => _SpalshPageState();
}

class _SpalshPageState extends State<SpalshPage> {
  String? obtainUserId;

  @override
  void initState() {
    getValidationData().whenComplete(() => {
          Timer(Duration(milliseconds: 3000), () {
            Navigator.pushReplacement(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: obtainUserId == null ? LoginPage() : SidenavPage()));
          })
        });

    super.initState();
  }

  Future getValidationData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userId = preferences.getString('ID');
    if (userId == null) {
    } else {
      Provider.of<LoginService>(context, listen: false).gettingObtainUserId(
          preferences
              .getString('ID')); // this code for getting id for use whole app
    }

    setState(() {
      obtainUserId = userId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: DefaultTextStyle(
              style: GoogleFonts.roboto(
                  color: Color.fromRGBO(242, 82, 135, 1),
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  height: 1,
                  letterSpacing: 6),
              child: AnimatedTextKit(
                pause: Duration(milliseconds: 10),
                isRepeatingAnimation: true,
                animatedTexts: [
                  FadeAnimatedText('COURSE HUB'),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 330),
          Center(
              child: Image.asset(
            "assets/images/othersPic/spalash.png",
            height: 150,
          )),
        ],
      ),
    );
  }
}
