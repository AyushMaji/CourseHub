// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditVideoCard extends StatelessWidget {
  final String videoTitie;
  final String videoNumber;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onDelete;
  final GestureTapCallback? onEdit;

  const EditVideoCard(
      {Key? key,
      required this.videoTitie,
      required this.videoNumber,
      required this.onTap,
      required this.onDelete,
      required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                offset: Offset(0, 4),
                blurRadius: 10)
          ],
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: onTap,
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/iconPic/play.png",
                      height: 37,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 180,
                            child: Text(videoTitie,
                                textScaleFactor: 0.85,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: GoogleFonts.koHo(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w800,
                                    color:
                                        const Color.fromRGBO(0, 0, 0, 0.58))),
                          ),
                          const SizedBox(height: 6),
                          Text("LEC-$videoNumber",
                              textScaleFactor: 0.85,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.koHo(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromRGBO(0, 0, 0, 0.58))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 2),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: onEdit,
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.red,
                      ),
                      onPressed: onDelete,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
