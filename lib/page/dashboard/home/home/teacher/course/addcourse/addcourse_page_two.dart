// ignore_for_file: prefer_const_constructors, prefer_conditional_assignment

import 'package:e_learning/page/dashboard/home/setting/setting_page.dart';
import 'package:e_learning/page/dashboard/sidenav_page.dart';
import 'package:e_learning/service/addcourse/addcourse_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class AddCoursePageTwo extends StatefulWidget {
  AddCoursePageTwo({Key? key}) : super(key: key);

  @override
  State<AddCoursePageTwo> createState() => _AddCoursePageTwoState();
}

class _AddCoursePageTwoState extends State<AddCoursePageTwo> {
  SimpleFontelicoProgressDialog? _dialog;

  bool isloding = true;

  void _showDialog(BuildContext context, SimpleFontelicoProgressDialogType type,
      String text, isloding) async {
    if (_dialog == null) {
      _dialog = SimpleFontelicoProgressDialog(
          context: context, barrierDimisable: false);
    }
    if (type == SimpleFontelicoProgressDialogType.custom) {
      _dialog!.show(
          message: text,
          elevation: 2.2,
          type: type,
          width: 150.0,
          height: 75.0,
          loadingIndicator: Text(
            'C',
            style: TextStyle(fontSize: 24.0),
          ));
    } else {
      _dialog!.show(
          message: text,
          type: type,
          horizontal: true,
          elevation: 2.2,
          width: 150.0,
          height: 75.0,
          hideText: true);
    }
    if (isloding == false) {
      _dialog!.hide();
      print("loding off");
    }
  }

  final _formKey = GlobalKey<FormState>();
  final _offerpriceController = TextEditingController();
  final _realpriceController = TextEditingController();
  String? cardminprice = "0";
  String? cardmaxprice = "0";

  String? _errorText;

  String? minPrice = '';
  String? maxPrice = '';
  var offer;

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
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
                .getcourseCatagory,
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
              SizedBox(height: 30),
              // for price card ===================
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: Color.fromRGBO(255, 255, 255, 1),
                    border: Border.all(color: Color.fromRGBO(0, 197, 126, 1))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${offer.toString()}%",
                              textScaleFactor: 0.85,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.koHo(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.green)),
                          Text.rich(
                            TextSpan(
                              text: "$cardmaxprice",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text("Total Amount",
                                textScaleFactor: 0.85,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: GoogleFonts.koHo(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(255, 22, 78, 0.7))),
                          ),
                          Text("$cardminprice",
                              textScaleFactor: 0.85,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.koHo(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.green)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // for price card ===================

              SizedBox(height: 30),

              // ==================================================== real Price
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                ),
                child: TextFormField(
                  controller: _realpriceController,
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
                      return 'cource Price  is Required';
                    }

                    return null;
                  },
                  onSaved: (value) {
                    minPrice = value!;
                  },
                  onChanged: (value) {
                    setState(() {
                      cardmaxprice = value;
                    });
                  },
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.blue[900],
                  ),
                  decoration: InputDecoration(
                      prefixText: "Rs. ",
                      fillColor: Color.fromRGBO(0, 197, 126, 0.10),
                      filled: true,
                      contentPadding: EdgeInsets.all(19),
                      focusColor: Color.fromRGBO(120, 104, 230, 1),
                      hintText: "100",
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(120, 104, 230, 0.25),
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                      labelText: "course price (Price) ?",
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
              // ==================================================== real Price
              SizedBox(height: 20),
              // ==================================================== offer price
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                ),
                child: TextFormField(
                  controller: _offerpriceController,
                  onChanged: (value) {
                    print(value);

                    var a = int.parse(_realpriceController.text);
                    var b; // = int.parse(_offerpriceController.text);
                    // ignore: unnecessary_null_comparison
                    if (_offerpriceController.text.isEmpty) {
                      b = a;
                    } else {
                      b = int.parse(_offerpriceController.text);
                    }

                    if (b > a) {
                      setState(() {
                        _errorText =
                            "real price alaways bigger than offer price ";
                      });
                    } else {
                      setState(() {
                        cardminprice = value;

                        offer = 100 - ((b / a) * 100).round();
                        print(offer);

                        _errorText = null;
                      });
                    }
                  },
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
                      return 'offer price is Required';
                    } else {
                      var a = int.parse(_realpriceController.text);
                      var b = int.parse(_offerpriceController.text);
                      if (b > a) {
                        return 'real price alaways bigger than offer price';
                      } else {
                        return null;
                      }
                    }
                  },
                  onSaved: (value) {
                    maxPrice = value!;
                  },
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.blue[900],
                  ),
                  decoration: InputDecoration(
                      errorText: _errorText,
                      prefixText: "Rs. ",
                      fillColor: Color.fromRGBO(0, 197, 126, 0.10),
                      filled: true,
                      contentPadding: EdgeInsets.all(19),
                      focusColor: Color.fromRGBO(120, 104, 230, 1),
                      hintText: "100",
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(120, 104, 230, 0.25),
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                      labelText: "Course Price (Price) ?",
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
              // ==================================================== offer price
              SizedBox(height: 20),

              SizedBox(height: 80),
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _showDialog(
                        context,
                        SimpleFontelicoProgressDialogType.phoenix,
                        'Loding ....',
                        isloding);

                    Provider.of<AddCourseService>(context, listen: false)
                        .addcoursePrice(
                            context, cardminprice, cardmaxprice, offer)
                        .whenComplete(() => {
                              Navigator.push(
                                      context,
                                      PageTransition(
                                          reverseDuration:
                                              Duration(milliseconds: 400),
                                          duration: Duration(milliseconds: 500),
                                          type: PageTransitionType
                                              .rightToLeftWithFade,
                                          child: SidenavPage()))
                                  .whenComplete(() => {
                                        setState(() {
                                          isloding = false;
                                          print("loding off btn");
                                        })
                                      })
                            });
                  }
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
}
