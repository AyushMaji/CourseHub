// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning/page/dashboard/home/enrollcourse/enrollcourse_page.dart';
import 'package:e_learning/page/dashboard/home/home/student/student_home_page.dart';
import 'package:e_learning/page/dashboard/home/home/teacher/teacher_home_page.dart';
import 'package:e_learning/page/dashboard/home/setting/setting_page.dart';
import 'package:e_learning/page/dashboard/home/subjects/subject_page.dart';
import 'package:e_learning/service/login/login_service.dart';
import 'package:e_learning/widget/appbar/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:loader_skeleton/loader_skeleton.dart';
import 'package:provider/provider.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({Key? key}) : super(key: key);

  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  static const List<Widget> _widgetOptions = <Widget>[
    StudentHomePage(),
    SubjectPage(),
    EnrollPage(),
    SettingPage()
  ];

  static const List<Widget> _twidgetOptions = <Widget>[
    TeacherHomePage(),
    SubjectPage(),
    EnrollPage(),
    SettingPage()
  ];

  static final List<Widget> _seltonoption = <Widget>[
    CardProfileSkeleton(
      isCircularImage: false,
      isBottomLinesActive: true,
    ),
    SubjectPage(),
    EnrollPage(),
    SettingPage()
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .where('id',
                isEqualTo: Provider.of<LoginService>(context, listen: false)
                    .obtainUserId)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(65),
                child: CustomAppBar(),
              ),
              backgroundColor: Colors.white,
              body: Center(child: _seltonoption.elementAt(_selectedIndex)),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors.black.withOpacity(.1),
                    )
                  ],
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 8),
                    child: GNav(
                      rippleColor: Colors.grey[300]!,
                      hoverColor: Colors.grey[100]!,
                      gap: 8,
                      activeColor: Colors.white,
                      iconSize: 24,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      duration: Duration(milliseconds: 400),
                      tabBackgroundColor: Color.fromRGBO(0, 197, 126, 1),
                      color: Color.fromRGBO(0, 197, 126, 1),
                      tabs: const [
                        GButton(
                          icon: Icons.space_dashboard_rounded,
                          text: 'Home',
                        ),
                        GButton(
                          icon: Icons.subject_rounded,
                          text: 'Subjects',
                        ),
                        GButton(
                          icon: Icons.add_box_rounded,
                          text: 'BookMark',
                        ),
                        GButton(
                          icon: CupertinoIcons.settings,
                          text: 'Setting',
                        ),
                      ],
                      selectedIndex: _selectedIndex,
                      onTabChange: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                    ),
                  ),
                ),
              ),
            );
          }

          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(65),
              child: CustomAppBar(),
            ),
            backgroundColor: Colors.white,
            body: Center(
                child: (snapshot.data.docs[0]['profession'] == "student")
                    ? _widgetOptions.elementAt(_selectedIndex)
                    : _twidgetOptions.elementAt(_selectedIndex)),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black.withOpacity(.1),
                  )
                ],
              ),
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: GNav(
                    rippleColor: Colors.grey[300]!,
                    hoverColor: Colors.grey[100]!,
                    gap: 8,
                    activeColor: Colors.white,
                    iconSize: 24,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    duration: Duration(milliseconds: 400),
                    tabBackgroundColor: Color.fromRGBO(0, 197, 126, 1),
                    color: Color.fromRGBO(0, 197, 126, 1),
                    tabs: const [
                      GButton(
                        icon: Icons.space_dashboard_rounded,
                        text: 'Home',
                      ),
                      GButton(
                        icon: Icons.subject_rounded,
                        text: 'Subjects',
                      ),
                      GButton(
                        icon: Icons.add_box_rounded,
                        text: 'Enroll Course',
                      ),
                      GButton(
                        icon: CupertinoIcons.settings,
                        text: 'Setting',
                      ),
                    ],
                    selectedIndex: _selectedIndex,
                    onTabChange: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  ),
                ),
              ),
            ),
          );
        });
  }
}
