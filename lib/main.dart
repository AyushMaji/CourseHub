// ignore_for_file: prefer_const_constructors
import 'package:e_learning/controller/appbar/appbar_controller.dart';
import 'package:e_learning/controller/coursePage/coursePage_controller.dart';

import 'package:e_learning/controller/sidenav/sidenav_controller.dart';
import 'package:e_learning/controller/subject/subject_controller.dart';
import 'package:e_learning/page/spalsh/spalsh_page.dart';
import 'package:e_learning/service/addcourse/addcourse_service.dart';
import 'package:e_learning/service/feedback/feedback.dart';
import 'package:e_learning/service/login/login_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SideNavController()),
          ChangeNotifierProvider(create: (_) => AppbarController()),
          ChangeNotifierProvider(create: (_) => LoginService()),
          ChangeNotifierProvider(create: (_) => AddCourseService()),
          ChangeNotifierProvider(create: (_) => SubjectController()),
          ChangeNotifierProvider(create: (_) => FeedBackService()),
          ChangeNotifierProvider(create: (_) => CoursePageController()),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Course Hub',
            home:
                //  ShowCoursePage()
                SpalshPage() // MAIN PAGE

            ));
  }
}
