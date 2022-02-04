// ignore_for_file: prefer_const_constructors

import 'package:e_learning/page/dashboard/sidenav_page.dart';
import 'package:e_learning/page/login/catagory/catagory_page.dart';
import 'package:e_learning/service/login/login_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  SimpleFontelicoProgressDialog? _dialog;

  bool isloding = true;
  void _showDialog(BuildContext context, SimpleFontelicoProgressDialogType type,
      String text, isloding) async {
    _dialog ??= SimpleFontelicoProgressDialog(
        context: context, barrierDimisable: false);
    if (type == SimpleFontelicoProgressDialogType.custom) {
      _dialog!.show(
          message: text,
          elevation: 2.2,
          type: type,
          width: 150.0,
          height: 75.0,
          loadingIndicator: Text(
            'C',
            style: TextStyle(fontSize: 24.0),
          ));
    } else {
      _dialog!.show(
          message: text,
          type: type,
          horizontal: true,
          elevation: 2.2,
          width: 150.0,
          height: 75.0,
          hideText: true);
    }
    if (isloding == false) {
      _dialog!.hide();
      print("loding off");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 120,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: InkWell(
            onTap: () => {professionoption(context)}, // === bottomsheet
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
                child: Text("Chouse your catagory",
                    textScaleFactor: 0.85,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: GoogleFonts.hind(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                'assets/images/othersPic/login.png',
              ),
            ),
            Text("Great Learning Platform",
                textScaleFactor: 0.85,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: GoogleFonts.josefinSans(
                    fontSize: 21,
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(0, 197, 126, 1))),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
              child: Text(
                  "Course Hub are the modern version of courses: you can create and share learning content in an organized way that allows users to progress in their understanding of a certain topic .  Online courses can include videos, images, text and hyperlinks .",
                  textScaleFactor: 0.85,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 9,
                  style: GoogleFonts.hind(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(187, 187, 187, 1))),
            ),
          ],
        ),
      ),
    );
  }

// ==========================  bootoomSheet ============================ >>>>>>>>>>>
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
                  // ==================================== teacher ====================== >>>>>>>
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
                  // ==================================== teacher ====================== >>>>>>>

                  // ==================================== student ======================= >>>>>>>
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
                  // ==================================== student ======================= >>>>>>>
                ],
              ),
              // =========================== botton ==================== >>>>>>>>>
              InkWell(
                onTap: () => {
                  _showDialog(
                      context,
                      SimpleFontelicoProgressDialogType.phoenix,
                      'Loding ....',
                      isloding),
                  Provider.of<LoginService>(context, listen: false)
                      .signInWithGoogle()
                      .whenComplete(() => {
                            setState(() {
                              isloding = false;
                              print("loding off btn");
                            }),
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: Provider.of<LoginService>(context,
                                                    listen: false)
                                                .getIslogin ==
                                            true
                                        ? SidenavPage()
                                        : CatagoryPage()))
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
              // =========================== botton ==================== >>>>>>>>>
            ],
          ),
        );
      },
    );
  }
// ==========================  bootoomSheet ============================== >>>>>>>>>>>>

}
