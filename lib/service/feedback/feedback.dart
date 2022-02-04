import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FeedBackService extends ChangeNotifier {
  Future rating(
    String courseId,
    num rating,
    String userID,
    String comment,
  ) async {
    final firebaseFirestore = FirebaseFirestore.instance;
    firebaseFirestore
        .collection("Users")
        .where('id', isEqualTo: userID)
        .get()
        .then((value) => {
              value.docs.forEach((result) {
                firebaseFirestore
                    .collection("Course")
                    .doc(courseId)
                    .collection('Comments')
                    .doc(userID)
                    .set({
                  'courseId': courseId,
                  'rating': rating,
                  'userID': userID,
                  'comment': comment,
                  'pic': result.data()['picture'],
                  'Ownername': result.data()['name'],
                  'timeStamp': DateTime.now(),
                }).whenComplete(() => {
                          firebaseFirestore
                              .collection("Course")
                              .doc(courseId)
                              .collection('Comments')
                              .get()
                              .then((value) {
                            value.docs.forEach((result) {
                              num totalratingNumber = value.docs.length;
                              num totalPoint = 0;
                              num ratting = 0;

                              for (var i = 0; i < totalratingNumber; i++) {
                                totalPoint =
                                    totalPoint + value.docs[i]['rating'];
                                ratting = totalPoint / totalratingNumber;
                              }
                              firebaseFirestore
                                  .collection("Course")
                                  .doc(courseId)
                                  .update({
                                'totalRating': ratting.toStringAsFixed(1),
                                'totalRatingNumber': value.docs.length,
                              });
                            });
                          })
                        });
                print("all data saved");

                notifyListeners();
              })
            });

    notifyListeners();
  }

  Future totalRating(courseId) async {
    final firebaseFirestore = FirebaseFirestore.instance;
    firebaseFirestore
        .collection("Course")
        .doc(courseId)
        .collection('Comments')
        .get()
        .then((value) {
      value.docs.forEach((result) {
        num totalratingNumber = value.docs.length;
        num totalPoint = 0;
        num ratting = 0;

        for (var i = 0; i < totalratingNumber; i++) {
          totalPoint = totalPoint + value.docs[i]['rating'];
          ratting = totalPoint / totalratingNumber;
        }

        firebaseFirestore.collection("Course").doc(courseId).update({
          'totalRating': ratting.toStringAsFixed(1),
        });
      });
    });

    notifyListeners();
  }

  Future CommentDlt(courseId, userId) async {
    final firebaseFirestore = FirebaseFirestore.instance;
    firebaseFirestore
        .collection("Course")
        .doc(courseId)
        .collection('Comments')
        .doc(userId)
        .delete()
        .whenComplete(() {
      final firebaseFirestore = FirebaseFirestore.instance;
      firebaseFirestore
          .collection("Course")
          .doc(courseId)
          .collection('Comments')
          .get()
          .then((value) {
        value.docs.forEach((result) {
          num totalratingNumber = value.docs.length;
          num totalPoint = 0;
          num ratting = 0;

          for (var i = 0; i < totalratingNumber; i++) {
            totalPoint = totalPoint + value.docs[i]['rating'];
            ratting = totalPoint / totalratingNumber;
          }

          firebaseFirestore.collection("Course").doc(courseId).update({
            'totalRating': ratting.toStringAsFixed(1),
            'totalRatingNumber': value.docs.length,
          });
        });
      });

      notifyListeners();
      print("dlt your comment");
    });
  }
}
