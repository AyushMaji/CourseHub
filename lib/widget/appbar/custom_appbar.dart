import 'package:e_learning/controller/appbar/appbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final tooltipController = JustTheController();

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
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => ZoomDrawer.of(context)!.toggle(),
              child: Image.asset(
                "assets/images/iconPic/appbar.png",
              ),
            ),
          ],
        ),
      ),
      actions: [
        JustTheTooltip(
          backgroundColor: const Color.fromRGBO(0, 197, 126, 0.45),
          controller: tooltipController,
          elevation: 4,
          shadow: const BoxShadow(
              color: Color.fromRGBO(178, 178, 178, 0.25),
              offset: Offset(0, 4),
              blurRadius: 15),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          preferredDirection: AxisDirection.down,
          tailLength: 20.0,
          isModal: true,
          child: Padding(
            padding: const EdgeInsets.all(9.0),
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
          content: Container(
            height: 490,
            // width: 380,
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
                              .whenComplete(tooltipController.hideTooltip);
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
                              .whenComplete(tooltipController.hideTooltip);
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
                              .whenComplete(tooltipController.hideTooltip);
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
                                      color: const Color.fromRGBO(
                                          82, 10, 174, 0.82))),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Provider.of<AppbarController>(context, listen: false)
                              .selectCatagory("Class 9")
                              .whenComplete(tooltipController.hideTooltip);
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
                                      color: const Color.fromRGBO(
                                          82, 10, 174, 0.82))),
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
                              .whenComplete(tooltipController.hideTooltip);
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
                                        color: const Color.fromRGBO(
                                            82, 10, 174, 0.82))),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Provider.of<AppbarController>(context, listen: false)
                              .selectCatagory("Class 7")
                              .whenComplete(tooltipController.hideTooltip);
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
                                      color: const Color.fromRGBO(
                                          82, 10, 174, 0.82))),
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
                              .whenComplete(tooltipController.hideTooltip);
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
                            color: Color.fromRGBO(223, 223, 223, 0.41),
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
                                      color:
                                          const Color.fromRGBO(96, 96, 96, 1))),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Provider.of<AppbarController>(context, listen: false)
                              .selectCatagory("Dance")
                              .whenComplete(tooltipController.hideTooltip);
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
                            color: Color.fromRGBO(223, 223, 223, 0.41),
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
                                      color:
                                          const Color.fromRGBO(96, 96, 96, 1))),
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
                              .whenComplete(tooltipController.hideTooltip);
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
                            color: Color.fromRGBO(223, 223, 223, 0.25),
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
                                        color: const Color.fromRGBO(
                                            96, 96, 96, 1))),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Provider.of<AppbarController>(context, listen: false)
                              .selectCatagory("Music")
                              .whenComplete(tooltipController.hideTooltip);
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
                            color: Color.fromRGBO(223, 223, 223, 0.41),
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
                                        color: const Color.fromRGBO(
                                            96, 96, 96, 1))),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        )
      ],
    );
  }
}
