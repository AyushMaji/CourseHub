import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning/page/dashboard/home/home/teacher/course/addcourse/addcourse_catagory.dart';
import 'package:e_learning/page/dashboard/home/home/teacher/course/addcourse/addcouse_page.dart';
import 'package:e_learning/page/dashboard/home/home/teacher/course/editcourse/course_page.dart';
import 'package:e_learning/service/addcourse/addcourse_service.dart';
import 'package:e_learning/service/login/login_service.dart';
import 'package:e_learning/widget/EditCourseCard/Edit_course_card.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_skeleton/loader_skeleton.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class TeacherHomePage extends StatelessWidget {
  const TeacherHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Image.asset("assets/images/othersPic/teacherhome.png"),
            // ==================== create course buttom ====== >>>>>>>
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        reverseDuration: const Duration(milliseconds: 400),
                        duration: const Duration(milliseconds: 500),
                        type: PageTransitionType.rightToLeftWithFade,
                        child: AddCourseCatagoryPage()));
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.07999999821186066),
                        offset: Offset(0, 4),
                        blurRadius: 25)
                  ],
                  color: Color.fromRGBO(0, 197, 126, 1),
                ),
                child: Center(
                  child: Text("CREATE YOUR OWN COURSE",
                      textScaleFactor: 0.85,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GoogleFonts.roboto(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // ==================== create course buttom ====== >>>>>>>

            Container(
              height: 600,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Course')
                    .where('ownerId',
                        isEqualTo:
                            Provider.of<LoginService>(context, listen: true)
                                .getobtainUserId)
                    .snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: CardListSkeleton(
                          isCircularImage: false,
                          isBottomLinesActive: true,
                          length: 4,
                        ));
                  }
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (BuildContext context, i) {
                      return EditCourseCard(
                          onTap: () {
                            Navigator.of(context).push(SwipeablePageRoute(
                              transitionDuration: Duration(milliseconds: 870),
                              canOnlySwipeFromEdge: false,
                              canSwipe: false,
                              builder: (BuildContext context) => EditCoursePage(
                                courseId: snapshot.data.docs[i]['courseId'],
                              ),
                            ));
                          },
                          onDelete: () {
                            showAlertDialog(
                                context,
                                snapshot.data.docs[i]['courseId'],
                                snapshot.data.docs[i]['ownerId']);
                          },
                          courseName: snapshot.data.docs[i]['courseName'],
                          videoNumber: snapshot.data.docs[i]
                              ['courseTotalVideo'],
                          totalEnroll: snapshot.data.docs[i]['courseEnroll'],
                          rating: snapshot.data.docs[i]['totalRating'],
                          coursePoster: snapshot.data.docs[i]['courseposter']);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ========================================== For Course Delete Course
showAlertDialog(BuildContext context, courseId, userId) {
  // set up the buttons
  Widget cancelButton = ElevatedButton(
    style: ElevatedButton.styleFrom(primary: Color.fromRGBO(0, 197, 126, 1)),
    child: Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop(); // dismiss dialog
    },
  );
  Widget continueButton = ElevatedButton(
    style: ElevatedButton.styleFrom(primary: Color.fromRGBO(242, 82, 135, 1)),
    child: const Text("Ok"),
    onPressed: () async {
      Provider.of<AddCourseService>(context, listen: false)
          .deleteCourse(courseId, userId)
          .whenComplete(() {
        Navigator.of(context).pop();
        Fluttertoast.showToast(
            msg: "Successfully delete your course",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black26,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Delete Your Course",
        textScaleFactor: 0.85,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: GoogleFonts.roboto(
            fontSize: 20, fontWeight: FontWeight.w700, color: Colors.red)),
    content: Text("Are You Sure You Want to delete your course ?",
        style: GoogleFonts.roboto(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(0, 0, 0, 0.63))),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
// ========================================== For For Course Delete Course
