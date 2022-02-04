import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  String obtainUserId = "";
  String userUid = "";
  String userName = "";
  String userEmail = "";
  String userPic = "";
  bool islogin = false;
  String get getUserUid => userUid;
  String get getobtainUserId => obtainUserId;
  String get getUserName => userName;
  String get getUserEmail => userEmail;
  String get getUserPic => userPic;
  bool get getIslogin => islogin;
  String profession = "teacher";
  String get getprofession => profession;

  // ======================================================   login Method
  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    /// ================== get all data form google sign in ============ >>>>>>>>>

    final UserCredential userCredential =
        await firebaseAuth.signInWithCredential(authCredential);

    final User? user = userCredential.user;
    assert(user!.uid != null);
    userUid = user!.uid;
    userEmail = user.email!;
    userName = user.displayName!;
    userPic = user.photoURL!;

    /// ================== get all data form google sign in ============ >>>>>>>>>

    //===================== sharedPreferences =================== >>>>>>>>>>>>>>>>
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('ID', userUid);
    obtainUserId = preferences.getString('ID')!;
    //===================== sharedPreferences =================== >>>>>>>>>>>>>>>>

// ======================================================   login Method
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    final doc = await firebaseFirestore.collection('Users').doc(userUid).get();
    if (doc.exists) {
      islogin = true;
      firebaseFirestore.collection('Users').doc(userUid).update({
        "profession": profession,
      });

      print(islogin);
    } else {
      islogin = false;
      firebaseFirestore.collection('Users').doc(userUid).set({
        'id': userUid,
        'name': userName,
        'email': userEmail,
        'picture': userPic,
        'timeStamp': DateTime.now(),
        "profession": profession,
      });
      print("login");
    }
    notifyListeners();
  }
// ======================================================   login Method

// ======================================================   logout method
  Future signOutWithGoogle() async {
    return googleSignIn.signOut().whenComplete(() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.remove('ID');
      notifyListeners();
    });
  }

// ======================================================   logout method

// ======================================================   getting data uid
  Future gettingObtainUserId(realUid) async {
    obtainUserId = realUid;
    notifyListeners();
  }
  // ======================================================   getting data uid

  // ======================================================   getting professtion form login screen
  Future choseProfession(gdataCatagory) async {
    profession = gdataCatagory;
    notifyListeners();
  }
  // ======================================================   getting professtion form login screen

  // ======================================================   update  Proffesion Data

  Future updateProfession() async {
    final firebaseFirestore = FirebaseFirestore.instance;
    firebaseFirestore.collection("Users").doc(getobtainUserId).update({
      'profession': getprofession,
    });
  }
  // ======================================================   update  Proffesion Data
}
