// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_skeleton/loader_skeleton.dart';
import 'package:page_transition/page_transition.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ShowVideoRender extends StatefulWidget {
  final String videourl;
  final String courseIde;
  final int videono;
  final String videoId;

  const ShowVideoRender(
      {Key? key,
      required this.videourl,
      required this.courseIde,
      required this.videono,
      required this.videoId})
      : super(key: key);

  @override
  State<ShowVideoRender> createState() => _ShowVideoRenderState();
}

class _ShowVideoRenderState extends State<ShowVideoRender> {
  late YoutubePlayerController _controller;

  void runyoutubePlayer() {
    String url = widget.videourl;

    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: YoutubePlayerFlags(
        enableCaption: false,
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void initState() {
    runyoutubePlayer();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        showVideoProgressIndicator: true,
        progressIndicatorColor: Color.fromRGBO(0, 197, 126, 1),
        controller: _controller,
      ),
      builder: (context, player) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromRGBO(0, 197, 126, 1),
            child: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          body: Column(
            children: [
              player,
              SizedBox(height: 20),
              Container(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Course')
                      .doc(widget.courseIde)
                      .collection("Videos")
                      .orderBy("timeStamp")
                      .snapshots(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: CardListSkeleton(
                            isCircularImage: true,
                            isBottomLinesActive: true,
                            length: 2,
                          ));
                    }
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (BuildContext context, i) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 6),
                          child: Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width / 1.1,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: (widget.videoId ==
                                          snapshot.data.docs[i]['videoId'])
                                      ? Colors.red
                                      : Colors.white),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.07999999821186066),
                                    offset: Offset(0, 4),
                                    blurRadius: 10)
                              ],
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      print(snapshot.data.docs[i]['videoLink']);
                                      Navigator.pushReplacement(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType
                                                  .rightToLeft,
                                              child: ShowVideoRender(
                                                videourl: snapshot.data.docs[i]
                                                    ['videoLink'],
                                                courseIde: snapshot.data.docs[i]
                                                    ['courseId'],
                                                videono: i,
                                                videoId: snapshot.data.docs[i]
                                                    ['videoId'],
                                              )));
                                    },
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/iconPic/play.png",
                                          height: 37,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 180,
                                                child: Text(
                                                    "${snapshot.data.docs[i]['videoTittle']}",
                                                    textScaleFactor: 0.85,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: GoogleFonts.koHo(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        color: const Color
                                                                .fromRGBO(
                                                            0, 0, 0, 0.58))),
                                              ),
                                              const SizedBox(height: 6),
                                              Text("LEC-${(i + 1).toString()}",
                                                  textScaleFactor: 0.85,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: GoogleFonts.koHo(
                                                      fontSize: 9,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          const Color.fromRGBO(
                                                              0, 0, 0, 0.58))),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
