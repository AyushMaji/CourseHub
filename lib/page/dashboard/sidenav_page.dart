// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning/controller/sidenav/sidenav_controller.dart';
import 'package:e_learning/page/dashboard/about/about_page.dart';
import 'package:e_learning/page/dashboard/bookmark/bookmark_page.dart';
import 'package:e_learning/page/dashboard/contact/contact_page.dart';
import 'package:e_learning/page/dashboard/home/bottomnavbar/bottomnav_page.dart';
import 'package:e_learning/page/dashboard/profile/profile_page.dart';
import 'package:e_learning/page/spalsh/spalsh_page.dart';
import 'package:e_learning/service/login/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class SidenavPage extends StatefulWidget {
  const SidenavPage({Key? key}) : super(key: key);

  @override
  State<SidenavPage> createState() => _SidenavPageState();
}

class _SidenavPageState extends State<SidenavPage> {
  @override
  Widget build(BuildContext context) => ZoomDrawer(
        style: DrawerStyle.Style1,
        slideWidth: MediaQuery.of(context).size.width * 0.79,
        borderRadius: 32,
        angle: -6,
        shadowLayer1Color: Color.fromRGBO(0, 197, 126, 0.06),
        showShadow: true,
        backgroundColor: Color.fromRGBO(0, 197, 126, 0.19),
        menuScreen: MenuPage(),
        mainScreen: getScreen(context),
      );
}

Widget getScreen(context) {
  String? getScreenNumber =
      Provider.of<SideNavController>(context, listen: true).getiteamselector;
  if (getScreenNumber == "home") {
    return BottomNavPage();
  } else if (getScreenNumber == "profile") {
    return ProfilePage();
  } else if (getScreenNumber == "bookmark") {
    return BookmarkPage();
  } else if (getScreenNumber == "about") {
    return AboutPage();
  } else if (getScreenNumber == "contact") {
    return ContactPage();
  } else {
    return BottomNavPage();
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          height: 90,
          width: MediaQuery.of(context).size.width / 1.1,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: InkWell(
                  onTap: () {
                    Provider.of<SideNavController>(context, listen: false)
                        .SideNavIteamSelector("home")
                        .whenComplete(() => {ZoomDrawer.of(context)!.close()});
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                    child: Image.asset(
                      "assets/images/iconPic/cross.png",
                      height: 30,
                    ),
                  ),
                ),
              ),
              Text("Back to Home",
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
        backgroundColor: Color.fromRGBO(220, 243, 255, 1),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 55,
                        ),
                        CircleAvatar(
                          backgroundColor: Color.fromRGBO(0, 197, 126, 1),
                          radius: 57.9,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 56,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Image.asset(
                                      "assets/images/othersPic/studentsidebar.png"),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        InkWell(
                          onTap: () => {
                            Provider.of<SideNavController>(context,
                                    listen: false)
                                .SideNavIteamSelector("home")
                                .whenComplete(
                                    () => {ZoomDrawer.of(context)!.close()})
                          },
                          child: Container(
                            height: 39,
                            width: 190,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(7),
                                topRight: Radius.circular(7),
                                bottomLeft: Radius.circular(7),
                                bottomRight: Radius.circular(7),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                    offset: Offset(0, 4),
                                    blurRadius: 8)
                              ],
                              color: Color.fromRGBO(0, 197, 126, 1),
                            ),
                            child: Center(
                              child: Text("Dashboard",
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
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
                ListTile(
                  onTap: () {
                    Provider.of<SideNavController>(context, listen: false)
                        .SideNavIteamSelector("profile")
                        .whenComplete(() => {ZoomDrawer.of(context)!.close()});
                  },
                  leading: Icon(
                    Icons.person_outline_outlined,
                    color: Color.fromRGBO(0, 197, 126, 1),
                  ),
                  title: Text(
                    "Profile",
                    textScaleFactor: 0.85,
                    style: GoogleFonts.hind(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.green),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Provider.of<SideNavController>(context, listen: false)
                        .SideNavIteamSelector("bookmark")
                        .whenComplete(() => {ZoomDrawer.of(context)!.close()});
                  },
                  leading: Icon(
                    Icons.bookmark_added,
                    color: Color.fromRGBO(0, 197, 126, 1),
                  ),
                  title: Text(
                    "Bookmark",
                    textScaleFactor: 0.85,
                    style: GoogleFonts.hind(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.green),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Provider.of<SideNavController>(context, listen: false)
                        .SideNavIteamSelector("about")
                        .whenComplete(() => {ZoomDrawer.of(context)!.close()});
                  },
                  leading: Icon(
                    Icons.messenger_outline,
                    color: Color.fromRGBO(0, 197, 126, 1),
                  ),
                  title: Text(
                    "About",
                    textScaleFactor: 0.85,
                    style: GoogleFonts.hind(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.green),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Provider.of<SideNavController>(context, listen: false)
                        .SideNavIteamSelector("contact")
                        .whenComplete(() => {ZoomDrawer.of(context)!.close()});
                  },
                  leading: Icon(
                    Icons.contact_support_sharp,
                    color: Color.fromRGBO(0, 197, 126, 1),
                  ),
                  title: Text(
                    "Contact",
                    textScaleFactor: 0.85,
                    style: GoogleFonts.hind(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.green),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Provider.of<LoginService>(context, listen: false)
                        .signOutWithGoogle()
                        .whenComplete(() => {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: SpalshPage()))
                            });
                  },
                  leading: Icon(
                    Icons.logout,
                    color: Color.fromRGBO(0, 197, 126, 1),
                  ),
                  title: Text(
                    "sign out",
                    textScaleFactor: 0.85,
                    style: GoogleFonts.hind(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.green[500]),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
