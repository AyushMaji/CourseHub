// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:e_learning/page/dashboard/home/home/teacher/course/editcourse/course_page.dart';
import 'package:e_learning/service/addcourse/addcourse_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class UplodeVideoPage extends StatelessWidget {
  final String? courseId;
  UplodeVideoPage({
    Key? key,
    required this.courseId,
  }) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  String? videoTittle;
  String? videoLink;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new_rounded)),
        elevation: 0,
        backgroundColor: Color.fromRGBO(0, 197, 126, 1),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 69),

              /// ================= VideoTittle ===============  >>>>>>>>>
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                ),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.disabled,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  cursorRadius: Radius.circular(3),
                  cursorColor: Colors.green,
                  cursorHeight: 20,
                  autocorrect: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Video Tittle  is Required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    videoTittle = value;
                  },
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.blue[900],
                  ),
                  decoration: InputDecoration(
                      fillColor: Color.fromRGBO(0, 197, 126, 0.10),
                      filled: true,
                      contentPadding: EdgeInsets.all(19),
                      focusColor: Color.fromRGBO(120, 104, 230, 1),
                      hintText: "biology part 1",
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(120, 104, 230, 0.25),
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                      labelText: "Add Your Video Tittle ",
                      labelStyle: TextStyle(
                          color: Color.fromRGBO(0, 197, 126, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 2,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(0, 197, 126, 1),
                          width: 2,
                        ),
                      )),
                ),
              ),

              /// ================= VideoTittle ===============  >>>>>>>>>
              SizedBox(height: 30),

              ///    /// ================= Videolink ===============  >>>>>>>>>
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                ),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.disabled,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  cursorRadius: Radius.circular(3),
                  cursorColor: Colors.green,
                  cursorHeight: 20,
                  autocorrect: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Video Link  is Required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    videoLink = value;
                  },
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.blue[900],
                  ),
                  decoration: InputDecoration(
                      fillColor: Color.fromRGBO(0, 197, 126, 0.10),
                      filled: true,
                      contentPadding: EdgeInsets.all(19),
                      focusColor: Color.fromRGBO(120, 104, 230, 1),
                      hintText: "https://www.youtube.com/xyzwcn",
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(120, 104, 230, 0.25),
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                      labelText: "Add Your Video Link",
                      labelStyle: TextStyle(
                          color: Color.fromRGBO(0, 197, 126, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 2,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(0, 197, 126, 1),
                          width: 2,
                        ),
                      )),
                ),
              ),

              /// ================= VideoLink ===============  >>>>>>>>>
              SizedBox(height: 50),

              ///  ================ submit btn ================ >>>>>>>>>
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    Provider.of<AddCourseService>(context, listen: false)
                        .uplodevideo(
                          courseId,
                          videoTittle,
                          videoLink?.trim(),
                        )
                        .whenComplete(() => {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: EditCoursePage(
                                        courseId: courseId,
                                      )))
                            });
                  }
                },
                child: Container(
                  height: 65,
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
                    child: Text('Uplode Video',
                        textScaleFactor: 0.85,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.koHo(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                  ),
                ),
              )

              ///  ================ submit btn ================ >>>>>>>>>
            ],
          ),
        ),
      ),
    );
  }
}
