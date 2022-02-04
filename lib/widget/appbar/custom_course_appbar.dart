import 'package:e_learning/controller/appbar/appbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomCourseAppBar extends StatelessWidget {
  final String apptittle;
  final Widget icon;
  const CustomCourseAppBar(
      {Key? key, required this.apptittle, required this.icon})
      : super(key: key);

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
                Navigator.pop(context);
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
                  child: icon,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Text(apptittle,
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
      ],
    );
  }
// =================== choses your catagory ===========================

}
