import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning/service/login/login_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCourseService extends ChangeNotifier {
  File? coursePoster;
  String courseName = "";
  String courseEmail = "";
  String coursePhone = "";
  String courseCatagory = "";
  String courseAbout = "";
  String courseFor = "";
  String coursePerequesatory = "";
  String coursePrice = "";
  String courseOfferPrice = "";
  String courseOffer = "";
  String courseSubject = "";
  String videoTittle = "";
  String videoLink = "";
  UploadTask? imagePostUplodeTask;
  bool isBookMarked = true;
  bool get getisBookMarked => isBookMarked;

  File? get getcoursePoster => coursePoster;
  String get getcourseName => courseName;
  String get getcourseEmail => courseEmail;
  String get getcoursePhone => coursePhone;
  String get getcourseCatagory => courseCatagory;
  String get getcourseAbout => courseAbout;
  String get getcourseFor => courseFor;
  String get getcoursePerequesatory => coursePerequesatory;
  String get getcoursePrice => coursePrice;
  String get getcourseOfferPrice => courseOfferPrice;
  String get getcourseOffer => courseOffer;
  String get getcourseSubject => courseSubject;
  String get getvideoTittle => videoTittle;
  String get getvideoLink => videoLink;

  Future addCourseselectCatagory(gcourseCatagory) async {
    courseCatagory = gcourseCatagory;
  }

  Future addcoursedetails(
      gcoursePoster,
      gcourseName,
      gcourseEmail,
      gcoursePhone,
      gcourseSubject,
      gcourseAbout,
      gcourseFor,
      gcoursePerequesatory) async {
    courseName = gcourseName;
    courseEmail = gcourseEmail;
    coursePhone = gcoursePhone;
    courseSubject = gcourseSubject;
    courseAbout = gcourseAbout;
    courseFor = gcourseFor;
    coursePerequesatory = gcoursePerequesatory;
    coursePoster = gcoursePoster;
  }

  ///===============   uplode all  (create Course) course data  =============== >>>>>>>>>>>
  Future addcoursePrice(
    BuildContext context,
    gcourseOfferPrice,
    gcoursePrice,
    gcourseOffer,
  ) async {
    coursePrice = gcoursePrice;
    courseOfferPrice = gcourseOfferPrice;
    courseOffer = gcourseOffer.toString();

    String userUid =
        Provider.of<LoginService>(context, listen: false).getobtainUserId;
    String courseId = courseName + userUid + courseCatagory + courseOfferPrice;

    final firebaseFirestore = FirebaseFirestore.instance;

    Reference reference = FirebaseStorage.instance
        .ref()
        .child('CoursePoster/${coursePoster!.path}/${TimeOfDay.now()}');
    UploadTask uploadTask = reference.putFile(coursePoster!);
    TaskSnapshot snapshot = await uploadTask;
    await snapshot.ref.getDownloadURL().then((coursepic) => {
          firebaseFirestore
              .collection("Users")
              .where('id', isEqualTo: userUid)
              .get()
              .then((value) => {
                    value.docs.forEach((result) {
                      var userpic = result.data()['picture'];
                      var useremail = result.data()['email'];
                      var userName = result.data()['name'];

                      firebaseFirestore.collection("Course").doc(courseId).set({
                        'courseName': courseName,
                        'courseCatagory': courseCatagory,
                        'courseSubject': courseSubject,
                        'courseEmail': courseEmail,
                        'coursePhone': coursePhone,
                        'courseposter': coursepic,
                        'courseAbout': courseAbout,
                        'courseFor': courseFor,
                        'coursePerequesatory': coursePerequesatory,
                        'coursePrice': coursePrice,
                        'courseOfferPrice': courseOfferPrice,
                        'courseOffer': courseOffer,
                        'courseId': courseId,
                        'ownerId': userUid,
                        'ownerPic': userpic,
                        'totalRating': "0",
                        'totalRatingNumber': "0",
                        'courseEnroll': "0",
                        'courseTotalVideo': "0",
                        'userEmail': useremail,
                        'userName': userName,
                        'timeStamp': DateTime.now(),
                      }).whenComplete(() => {
                            firebaseFirestore
                                .collection(courseCatagory)
                                .doc(courseId)
                                .set({
                              'courseName': courseName,
                              'courseId': courseId,
                              'courseSubject': courseSubject,
                              'courseposter': coursepic,
                              'courseOfferPrice': courseOfferPrice,
                              'totalRating': "0",
                              'courseEnroll': "0",
                              'courseTotalVideo': "0",
                            })
                          });
                    })
                  })
        });
  }

  ///===============   uplode all (create Course)  course data  =============== >>>>>>>>>>>
  ///
  ///

  /// =================== delete all course data =================== >>>>>>>>>>>>>
  Future deleteCourse(gcourseId, guserId) async {
    String bookmarkId = gcourseId + guserId;
    String enrollId = gcourseId + guserId;
    final firebaseFirestore = FirebaseFirestore.instance;
    firebaseFirestore
        .collection("Course")
        .where('courseId', isEqualTo: gcourseId)
        .get()
        .then((value) => {
              value.docs.forEach((result) {
                Reference imageReferencedss = FirebaseStorage.instance
                    .refFromURL(result.data()['courseposter']);
                imageReferencedss.delete().whenComplete(() => {
                      firebaseFirestore
                          .collection("BookMark")
                          .doc(bookmarkId)
                          .delete()
                          .whenComplete(() => {
                                firebaseFirestore
                                    .collection("EnrollCourse")
                                    .doc(enrollId)
                                    .delete()
                                    .whenComplete(() => {
                                          firebaseFirestore
                                              .collection("Course")
                                              .doc(gcourseId)
                                              .collection('Videos')
                                              .get()
                                              .then((QuerySnapshot
                                                      querySnapshot) =>
                                                  {
                                                    querySnapshot.docs
                                                        .forEach((doc) {
                                                      doc.reference.delete();
                                                    })
                                                  })
                                              .whenComplete(() => {
                                                    firebaseFirestore
                                                        .collection("Course")
                                                        .doc(gcourseId)
                                                        .delete()
                                                        .whenComplete(() => {
                                                              print(
                                                                  "all course Data Delete"),
                                                            })
                                                  })
                                        })
                              })
                    });
              })
            });
  }

  /// =================== delete all course data =================== >>>>>>>>>>>>>

//////===============    VideoRelated Work data  =============== >>>>>>>>>>>

  Future uplodevideo(gcourseId, gvideotittle, gvideolink) async {
    String videoId =
        "${gvideotittle + DateTime.now().millisecondsSinceEpoch.toString()}";
    final firebaseFirestore = FirebaseFirestore.instance;
    firebaseFirestore
        .collection("Course")
        .doc(gcourseId)
        .collection('Videos')
        .doc(videoId)
        .set({
      'videoLink': gvideolink,
      'videoTittle': gvideotittle,
      'videoId': videoId,
      'courseId': gcourseId,
      'timeStamp': DateTime.now(),
    }).whenComplete(() {
      firebaseFirestore
          .collection("Course")
          .doc(gcourseId)
          .collection('Videos')
          .get()
          .then((value) {
        value.docs.forEach((result) {
          num videoNumber = value.docs.length;
          String video = videoNumber.toString();
          firebaseFirestore.collection("Course").doc(gcourseId).update({
            'courseTotalVideo': video,
          });
        });
      });
    });
  }

  Future editvideo(gcourseId, gvideoId, gvideotittle, gvideolink) async {
    String videoId =
        "${gvideotittle + DateTime.now().millisecondsSinceEpoch.toString()}";
    final firebaseFirestore = FirebaseFirestore.instance;
    firebaseFirestore
        .collection("Course")
        .doc(gcourseId)
        .collection('Videos')
        .doc(gvideoId)
        .update({
      'videoLink': gvideolink,
      'videoTittle': gvideotittle,
    }).whenComplete(() {
      print("all data saved");
    });
  }

  Future deletevideo(gcourseId, gvideoId) async {
    final firebaseFirestore = FirebaseFirestore.instance;
    firebaseFirestore
        .collection("Course")
        .doc(gcourseId)
        .collection('Videos')
        .doc(gvideoId)
        .delete()
        .whenComplete(() {
      firebaseFirestore
          .collection("Course")
          .doc(gcourseId)
          .collection('Videos')
          .get()
          .then((value) {
        value.docs.forEach((result) {
          num videoNumber = value.docs.length;
          String video = videoNumber.toString();
          firebaseFirestore.collection("Course").doc(gcourseId).update({
            'courseTotalVideo': video,
          });
        });
      });
    });
  }

  ///===============   VideoRelated Work data   =============== >>>>>>>>>>>

  ////// ===============   BookMarkCourse   =============== >>>>>>>>>>>

  Future bookmsrkcourse(gcourseId, guserId, gcourseName) async {
    String bookmarkId = gcourseId + guserId;
    final firebaseFirestore = FirebaseFirestore.instance;
    firebaseFirestore.collection("BookMark").doc(bookmarkId).set({
      "bookMarkId": bookmarkId,
      "courseId": gcourseId,
      "userId": guserId,
      "courseName": gcourseName,
    }).whenComplete(() {
      print("bookmark done");
    });
  }
  ////// ===============   BookMarkCourse   =============== >>>>>>>>>>>
  ///

////// ===============   BookMarkCourse cheack   =============== >>>>>>>>>>>
  ///

  Future cheackBookMark(guserId, gcourseId) async {
    String cheackingIde = gcourseId + guserId;
    final firebaseFirestore = FirebaseFirestore.instance;
    final doc =
        await firebaseFirestore.collection('BookMark').doc(cheackingIde).get();
    if (doc.exists) {
      print("it is alleady bookamred");
      isBookMarked = true;
    } else {
      print("it is not alleady bookamred");
      isBookMarked = false;
    }
    notifyListeners();
  }

  ////// ===============   BookMarkCourse cheack   =============== >>>>>>>>>>>

  Future deleteBookMark(guserId, gcourseId) async {
    String cheackingIde = gcourseId + guserId;
    final firebaseFirestore = FirebaseFirestore.instance;
    firebaseFirestore
        .collection("BookMark")
        .doc(cheackingIde)
        .delete()
        .whenComplete(() => {print("deletebookmark")});

    notifyListeners();
  }

  ///////// ===============  Check Enroll Course   =============== >>>>>>>>>>>
  ///
  bool isEnroll = false;
  bool get getisEnroll => isEnroll;

  Future cheackEnroll(guserId, gcourseId) async {
    String cheackingId = gcourseId + guserId;
    print(cheackingId);
    final firebaseFirestore = FirebaseFirestore.instance;
    final doc = await firebaseFirestore
        .collection('EnrollCourse')
        .doc(cheackingId)
        .get();
    if (doc.exists) {
      print("it is alleady Enrolled");
      isEnroll = true;
      notifyListeners();
    } else {
      print("it is not alleady UEnrolled");
      isEnroll = false;
      notifyListeners();
    }
    notifyListeners();
  }
  ///////// ===============  Check Enroll Course   =============== >>>>>>>>>>>

  ///////// ===============   Enroll Course   =============== >>>>>>>>>>>

  Future enrollcourse(gcourseId, guserId) async {
    String enrollId = gcourseId + guserId;
    final firebaseFirestore = FirebaseFirestore.instance;
    firebaseFirestore.collection("EnrollCourse").doc(enrollId).set({
      "enrollId": enrollId,
      "courseId": gcourseId,
      "userId": guserId,
      "timeStpamp": DateTime.now()
    }).whenComplete(() {
      firebaseFirestore
          .collection("EnrollCourse")
          .where('courseId', isEqualTo: gcourseId)
          .get()
          .then((value) {
        value.docs.forEach((result) {
          num enrollNum = value.docs.length;
          String enrollNumber = enrollNum.toString();
          firebaseFirestore.collection("Course").doc(gcourseId).update({
            'courseEnroll': enrollNumber,
          });
        });
      });
    });
  }
  ////// ===============   Enroll Course   =============== >>>>>>>>>>>

  ///////// ===============   Payment Course   =============== >>>>>>>>>>>

  Future Paymentcourse(gcourseId, guserId, gstatus) async {
    final firebaseFirestore = FirebaseFirestore.instance;
    firebaseFirestore.collection("Payment").doc().set({
      "courseId": gcourseId,
      "userId": guserId,
      "status": gstatus,
      "timeStpamp": DateTime.now()
    }).whenComplete(() {
      print("courseEnroll");
    });
  }

  ////// ===============   Enroll Course   =============== >>>>>>>>>>>

  ////// ===============   User Count and Course Count   =============== >>>>>>>>>>>
  int totalUserCount = 0;
  int get getTotalUserCount => totalUserCount;
  int totalcourse = 0;
  int get gettotalcourse => totalcourse;

  Future userCount() async {
    final firebaseFirestore = FirebaseFirestore.instance;
    firebaseFirestore.collection("Users").get().then((value) {
      value.docs.forEach((result) {
        totalUserCount = value.docs.length;
        notifyListeners();
      });
    }).whenComplete(() => {
          firebaseFirestore.collection("Course").get().then((value) {
            value.docs.forEach((result) {
              totalcourse = value.docs.length;
              notifyListeners();
            });
          })
        });
  }
  ////// ===============   User Count and Course Count   =============== >>>>>>>>>>>
}
