import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubjectCard extends StatelessWidget {
  final String subRating;
  final String subName;
  final Color subNameColor;
  final GestureTapCallback press;

  const SubjectCard({
    Key? key,
    required this.subRating,
    required this.subName,
    required this.subNameColor,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: press,
      child: Container(
        height: 166,
        width: 145,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                offset: Offset(0, 4),
                blurRadius: 40)
          ],
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 22, top: 16),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 10,
                        color: Color.fromRGBO(0, 197, 126, 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Text(subRating,
                            textScaleFactor: 0.85,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: GoogleFonts.koHo(
                                fontSize: 10,
                                fontWeight: FontWeight.w900,
                                color: Color.fromRGBO(21, 21, 21, 0.42))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Image.asset(
              "assets/images/subjectPic/$subName.png",
              height: 70,
            ),
            Column(
              children: [
                Text(subName,
                    textScaleFactor: 0.85,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: GoogleFonts.hind(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: subNameColor)),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
            Image.asset(
              "assets/images/subjectPic/${subName}line.png",
              width: 98,
            ),
          ],
        ),
      ),
    );
  }
}
