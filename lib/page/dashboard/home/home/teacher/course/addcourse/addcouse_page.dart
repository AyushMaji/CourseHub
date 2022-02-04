// ignore_for_file: prefer_const_constructors, constant_identifier_names

import 'dart:io';
import 'package:e_learning/page/dashboard/home/home/teacher/course/addcourse/addcourse_catagory.dart';
import 'package:e_learning/page/dashboard/home/home/teacher/course/addcourse/addcourse_page_two.dart';
import 'package:e_learning/service/addcourse/addcourse_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

enum SingingCharacter {
  PhysicalScience,
  LifeScience,
  Mathematics,
  Chemistry,
  History,
  Geography,
  Bengali,
  Hindi,
  English,
  Sanskrit,
  Computer,
  Economics,

  CompetitiveCoding, // coding iteam
  AppDevelopment,
  WebDevelopment,
  ARTech,
  MLAndAI,
  CyberSecurity,
  DataScience,
  GraphicDesign,

  CartoonDrawing, // drawing iteam
  FigureDrawing,
  GestureDrawing,
  LineDrawing,
  PerspectiveDrawing,
  Oillpainting,

  Contemporary, // dance iteam
  HipHop,
  FolkDance,
  ModernDance,
  SwingDance,
  Ballroom,

  GuitarMusic, // music iteam
  PianoClass,
  Music,
  Others,
}

class AddCoursePage extends StatefulWidget {
  const AddCoursePage({Key? key}) : super(key: key);

  @override
  State<AddCoursePage> createState() => _AddCoursePageState();
}

class _AddCoursePageState extends State<AddCoursePage> {
  final _formKey = GlobalKey<FormState>();
  SingingCharacter? _character;
  String? catagory = "Choses Your Course Category ";
  File? _pickedImage;
  final picker = ImagePicker();

  String? courseName;
  String? description;
  String? courseFor;
  String? coursePerequesatory;
  String? courseEmail;
  String? coursePhone;

  bool chackCatagory = true;
  bool chackImage = true;

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(
                context,
                PageTransition(
                    type: PageTransitionType.leftToRight,
                    child: AddCourseCatagoryPage()));
          },
          child: Center(
            child: CircleAvatar(
              backgroundColor: Color.fromRGBO(242, 242, 242, 1),
              radius: 20,
              child: Icon(
                Icons.arrow_back_ios_outlined,
                color: Color.fromRGBO(0, 197, 126, 1),
              ),
            ),
          ),
        ),
        title: Center(
          child: Text(
            Provider.of<AddCourseService>(context, listen: true)
                .getcourseSubject,
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        actions: [
          Image.asset(
            "assets/images/iconPic/back.png",
            height: 40,
            width: 40,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  _showPickOptionsDialog(context);
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromRGBO(246, 246, 246, 1),
                        border: Border.all(
                          color: Color.fromRGBO(0, 197, 126, 0.72),
                          width: 2,
                        ),
                      ),
                      child: (_pickedImage != null)
                          ? Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.file(
                                _pickedImage!,
                              ),
                            )
                          : Center(
                              child: Image.asset(
                              "assets/images/iconPic/add.png",
                              height: 50,
                              width: 50,
                            )),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0, left: 30),
                    child: chackCatagory == true
                        ? null
                        : Text(
                            "* Plz Choses Your course Poster",
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                  ),
                ],
              ),
              // ======================================== Select Catagory
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  createdialogebox(context);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                  child: Container(
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              catagory!,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 197, 126, 1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Color.fromRGBO(0, 197, 126, 1),
                              size: 35,
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(0, 197, 126, 0.10),
                          border: Border(
                            bottom: BorderSide(
                              width: 2.0,
                              color: Color.fromRGBO(0, 197, 126, 1),
                            ),
                          ))),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0, left: 30),
                    child: chackCatagory == true
                        ? null
                        : Text(
                            "* Plz Choses Your course Catagory",
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                  ),
                ],
              ),

              // ============================ select option ============= //

              SizedBox(
                height: 20,
              ),
              // ======================================== course tittle
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
                      return 'Course Name  is Required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    courseName = value;
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
                      hintText: "enginering mathemathices part 2",
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(120, 104, 230, 0.25),
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                      labelText: "Add Your course Name / tittle ",
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
              // ======================================== course tittle
              SizedBox(
                height: 20,
              ),

              // ================================================== About your busness
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  minLines: 2,
                  maxLines: 500,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: '  About your course ',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'About your course is Required';
                    }

                    return null;
                  },
                  onSaved: (value) {
                    description = value!;
                  },
                ),
              ),
              // ================================================== About your busness

              // ================================================== who this course for
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  minLines: 2,
                  maxLines: 500,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: '  who this course is for ',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'this information is Required';
                    }

                    return null;
                  },
                  onSaved: (value) {
                    courseFor = value!;
                  },
                ),
              ),
              // ================================================== who this course for

              // ================================================== perequesatory
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  minLines: 2,
                  maxLines: 500,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: '  perequesatory ',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'perequesatory is Required';
                    }

                    return null;
                  },
                  onSaved: (value) {
                    coursePerequesatory = value!;
                  },
                ),
              ),
              // ================================================== perequesatory
              SizedBox(height: 20),
              // ======================================== Busness Phone
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                ),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.disabled,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () => node.nextFocus(),
                  keyboardType: TextInputType.number,
                  cursorRadius: Radius.circular(3),
                  cursorColor: Colors.green,
                  cursorHeight: 20,
                  autocorrect: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Business Phone  is Required';
                    }
                    if (value.length > 10) {
                      return 'minimum 10 degit require';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    coursePhone = value;
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
                      hintText: " 9749903017",
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(120, 104, 230, 0.25),
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                      labelText: "Business Phone ",
                      labelStyle: TextStyle(
                          color: Color.fromRGBO(0, 197, 126, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(0, 197, 126, 1),
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
              // ======================================== Busness Phone
              SizedBox(
                height: 20,
              ),
              // ======================================== Busness EmailId
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                ),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.disabled,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () => node.nextFocus(),
                  keyboardType: TextInputType.emailAddress,
                  cursorRadius: Radius.circular(3),
                  cursorColor: Colors.green,
                  cursorHeight: 20,
                  autocorrect: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email is Required';
                    }
                    if (value.length > 30) {
                      return 'minimum 30 words require';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    courseEmail = value;
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
                      hintText: "xyz@gmail.com",
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(120, 104, 230, 0.25),
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                      labelText: "Business Email Id",
                      labelStyle: TextStyle(
                          color: Color.fromRGBO(0, 197, 126, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(0, 197, 126, 1),
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
              // ======================================== Busness EmailId

              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    if (catagory!.length < 23) {
                      setState(() {
                        chackCatagory = true;
                      });
                      if (_pickedImage != null) {
                        _formKey.currentState!.save();

                        Provider.of<AddCourseService>(context, listen: false)
                            .addcoursedetails(
                                _pickedImage,
                                courseName,
                                courseEmail,
                                coursePhone,
                                catagory,
                                description,
                                courseFor,
                                coursePerequesatory)
                            .whenComplete(() => {
                                  Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          child: AddCoursePageTwo()))
                                });

                        setState(() {
                          chackImage = true;
                        });
                      } else {
                        setState(() {
                          chackImage = false;
                        });
                      }
                    } else {
                      setState(() {
                        chackCatagory = false;
                      });
                    }
                  }
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 1.05,
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
                    child: Text("NEXT PAGE",
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
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  createdialogebox(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return AlertDialog(
                title: const Text(
                  'Choses Your Course Category',
                  textScaleFactor: 0.85,
                ),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'Physical Science',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.PhysicalScience,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "PhysicalScience";
                            print(_character);
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'Life Science',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.LifeScience,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "LifeScience";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'Chemistry',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.Chemistry,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "Chemistry";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'Mathematics',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.Mathematics,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "Mathematics";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'History',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.History,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "History";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'Geography',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.Geography,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "Geography";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'Bengali',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.Bengali,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "Bengali";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'English',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.English,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "English";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'Hindi',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.Hindi,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "Hindi";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'Sanskrit',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.Sanskrit,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "Sanskrit";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'Computer',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.Computer,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "Computer";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'Economics',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.Economics,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "Economics";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'App Developemnt',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.AppDevelopment,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "AppDevelopemnt";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'Web Development',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.WebDevelopment,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "WebDevelopment";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'Competitive Coding',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.CompetitiveCoding,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "CompetitiveCoding";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'AR & VR Tech',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.ARTech,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "ARTech";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'AI & ML',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.MLAndAI,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "MLAndAI";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'Cyber Security',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.CyberSecurity,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "CyberSecurity";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'Data Science',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.DataScience,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "DataScience";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'GraphicDesign',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.GraphicDesign,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "GraphicDesign";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'Cartoon Drawing',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.CartoonDrawing,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "CartoonDrawing";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'Figure Drawing',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.FigureDrawing,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "FigureDrawing";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'Gesture Drawing',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.GestureDrawing,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "GestureDrawing";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'Line Drawing',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.LineDrawing,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "LineDrawing";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'Perspective Drawing',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.PerspectiveDrawing,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "PerspectiveDrawing";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'Oill painting',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.Oillpainting,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "Oillpainting";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'Contemporary',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.Contemporary,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "Contemporary";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'HipHop',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.HipHop,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "HipHop";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'FolkDance',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.FolkDance,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "FolkDance";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'Modern Dance',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.ModernDance,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "ModernDance";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'Ballroom',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.Ballroom,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "Ballroom";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'Swing Dance',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.SwingDance,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "Swing Dance";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'Music',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.Music,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "Music";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'Guitar Music',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.GuitarMusic,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "GuitarMusic";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'Piano Class',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.PianoClass,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "PianoClass";
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        activeColor: Colors.pink,
                        title: const Text(
                          'Others',
                          textScaleFactor: 0.85,
                        ),
                        value: SingingCharacter.Others,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            catagory = "Others";
                          });
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  _loadPicker(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final pickedFile = await _picker.pickImage(source: source);
    // final pickedFile = await picker.getImage(source: source, imageQuality: 40);
    setState(() {
      if (pickedFile != null) {
        // File(pickedFile.path);

        _cropImage(File(pickedFile.path));
      } else {
        print('No image selected.');
      }
      Navigator.pop(context);
    });
  }

  _cropImage(File picked) async {
    File? cropped = await ImageCropper.cropImage(
      androidUiSettings: AndroidUiSettings(
        // statusBarColor: Colors.transparent,
        toolbarColor: Color.fromRGBO(0, 197, 126, 1),
        toolbarTitle: "Crop Your Image ",
        toolbarWidgetColor: Colors.white,
      ),
      sourcePath: picked.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio7x5,
      ],
      maxWidth: 800,
    );
    if (cropped != null) {
      setState(() {
        _pickedImage = cropped;
        print(_pickedImage);
      });
    }
  }

  void _showPickOptionsDialog(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  height: 4,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(32, 31, 30, 0.14),
                  ),
                ),
              ),
              SizedBox(
                height: 23,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(120, 104, 230, 1),
                    ),
                    onPressed: () => {_loadPicker(ImageSource.gallery)},
                    child: Container(
                      width: 90,
                      height: 45,
                      child: Center(child: Text(" Enter Gallary")),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(242, 82, 135, 1),
                    ),
                    onPressed: () => {_loadPicker(ImageSource.camera)},
                    child: Container(
                      width: 90,
                      height: 45,
                      child: Center(child: Text(" Take a photo")),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
