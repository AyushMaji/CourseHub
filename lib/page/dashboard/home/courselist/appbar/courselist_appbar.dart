import 'package:e_learning/controller/appbar/appbar_controller.dart';
import 'package:e_learning/page/dashboard/sidenav_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class CourselistAppBar extends StatelessWidget {
  const CourselistAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: SidenavPage()));
              },
              child: Image.asset(
                "assets/images/iconPic/back.png",
              ),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(9.0),
          child: InkWell(
            onTap: () {
              showDialogBox(context); // dialog box
            },
            child: Container(
              height: 10,
              width: 216,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Color.fromRGBO(203, 237, 255, 1),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: Image.asset(
                      "assets/images/iconPic/dropdown.png",
                      height: 13,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Text(
                        "${Provider.of<AppbarController>(context, listen: true).getselectdata}",
                        textScaleFactor: 0.85,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.koHo(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: Colors.black)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
// =================== choses your catagory ===========================

  Future<dynamic> showDialogBox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext cxt) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          insetAnimationDuration: const Duration(milliseconds: 200),
          insetAnimationCurve: Curves.elasticIn,
          child: Container(
            height: 490,
            width: 343,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(178, 178, 178, 0.25),
                    offset: Offset(0, 4),
                    blurRadius: 25)
              ],
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Provider.of<AppbarController>(context, listen: false)
                              .selectCatagory("Class 12")
                              .whenComplete(
                                  () => Navigator.pop(context, false));
                        },
                        child: Container(
                          height: 55,
                          width: 134,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              color: Color.fromRGBO(28, 233, 159, 0.13)),
                          child: Row(
                            children: [
                              Image.asset(
                                  "assets/images/catagoryPic/class12.png"),
                              Text("Class 12",
                                  textScaleFactor: 0.85,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: GoogleFonts.koHo(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.green)),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Provider.of<AppbarController>(context, listen: false)
                              .selectCatagory("Class 11")
                              .whenComplete(
                                  () => Navigator.pop(context, false));
                        },
                        child: Container(
                          height: 55,
                          width: 134,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: Color.fromRGBO(28, 233, 159, 0.13),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Image.asset(
                                      "assets/images/catagoryPic/class11.png"),
                                ),
                                Text("class 11",
                                    textScaleFactor: 0.85,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: GoogleFonts.koHo(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.green)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Provider.of<AppbarController>(context, listen: false)
                              .selectCatagory("Class 10")
                              .whenComplete(
                                  () => Navigator.pop(context, false));
                        },
                        child: Container(
                          height: 55,
                          width: 134,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: Color.fromRGBO(219, 230, 255, 1),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image.asset(
                                    "assets/images/catagoryPic/class10.png"),
                              ),
                              Text("Class 10",
                                  textScaleFactor: 0.85,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: GoogleFonts.koHo(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color:
                                          Color.fromRGBO(82, 10, 174, 0.82))),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Provider.of<AppbarController>(context, listen: false)
                              .selectCatagory("Class 9")
                              .whenComplete(
                                  () => Navigator.pop(context, false));
                        },
                        child: Container(
                          height: 55,
                          width: 134,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: Color.fromRGBO(219, 230, 255, 1),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Image.asset(
                                    "assets/images/catagoryPic/class9.png"),
                              ),
                              Text("Class 9",
                                  textScaleFactor: 0.85,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: GoogleFonts.koHo(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color:
                                          Color.fromRGBO(82, 10, 174, 0.82))),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Provider.of<AppbarController>(context, listen: false)
                              .selectCatagory("Class 8")
                              .whenComplete(
                                  () => Navigator.pop(context, false));
                        },
                        child: Container(
                          height: 55,
                          width: 134,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: Color.fromRGBO(219, 230, 255, 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Image.asset(
                                      "assets/images/catagoryPic/class8.png"),
                                ),
                                Text("Class 8",
                                    textScaleFactor: 0.85,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: GoogleFonts.koHo(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color:
                                            Color.fromRGBO(82, 10, 174, 0.82))),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Provider.of<AppbarController>(context, listen: false)
                              .selectCatagory("Class 7")
                              .whenComplete(
                                  () => Navigator.pop(context, false));
                        },
                        child: Container(
                          height: 55,
                          width: 134,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: Color.fromRGBO(219, 230, 255, 1),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset(
                                    "assets/images/catagoryPic/class7.png"),
                              ),
                              Text("Class 7",
                                  textScaleFactor: 0.85,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: GoogleFonts.koHo(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color:
                                          Color.fromRGBO(82, 10, 174, 0.82))),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Provider.of<AppbarController>(context, listen: false)
                              .selectCatagory("Coding")
                              .whenComplete(
                                  () => Navigator.pop(context, false));
                        },
                        child: Container(
                          height: 55,
                          width: 134,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: Color.fromRGBO(233, 28, 28, 0.11),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Image.asset(
                                    "assets/images/catagoryPic/coding.png"),
                              ),
                              Text("Coding",
                                  textScaleFactor: 0.85,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: GoogleFonts.koHo(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(174, 10, 50, 1))),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Provider.of<AppbarController>(context, listen: false)
                              .selectCatagory("Dance")
                              .whenComplete(
                                  () => Navigator.pop(context, false));
                        },
                        child: Container(
                          height: 55,
                          width: 134,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: Color.fromRGBO(233, 28, 28, 0.11),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                  "assets/images/catagoryPic/dance.png"),
                              Text("Dance",
                                  textScaleFactor: 0.85,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: GoogleFonts.koHo(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(174, 10, 50, 1))),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Provider.of<AppbarController>(context, listen: false)
                              .selectCatagory("Drawing")
                              .whenComplete(
                                  () => Navigator.pop(context, false));
                        },
                        child: Container(
                          height: 55,
                          width: 134,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: Color.fromRGBO(233, 28, 28, 0.11),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset(
                                      "assets/images/catagoryPic/drawing.png"),
                                ),
                                Text("Drawing",
                                    textScaleFactor: 0.85,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: GoogleFonts.koHo(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(174, 10, 50, 1))),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Provider.of<AppbarController>(context, listen: false)
                              .selectCatagory("Music")
                              .whenComplete(
                                  () => Navigator.pop(context, false));
                        },
                        child: Container(
                          height: 55,
                          width: 134,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: Color.fromRGBO(233, 28, 28, 0.11),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Image.asset(
                                    "assets/images/catagoryPic/music.png",
                                  ),
                                ),
                                Text("Music",
                                    textScaleFactor: 0.85,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: GoogleFonts.koHo(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(174, 10, 50, 1))),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        );
      },
    );
  }
}
