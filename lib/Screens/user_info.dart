import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:age/age.dart';
//import 'package:gameio/Screens/map_page.dart';
//import 'package:gameio/Services/firebase_auth.dart';
//import 'package:provider/provider.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
//import 'package:gameio/Services/User_data.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  String dropdownValue = 'Male';
  TextEditingController ageController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  DateTime _selectedDate;

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Container(
            margin: EdgeInsets.only(right: 75),
            alignment: Alignment.center,
            child: Text(
              'Gameio',
              style: TextStyle(
                fontFamily: 'JuliusSansOne',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 25, 15, 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(children: [
                    CircleAvatar(
                      maxRadius: 60,
                      backgroundColor: Color(0xFFEB1555),
                      child: ClipOval(
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: (_image != null)
                              ? Image.file(
                                  _image,
                                  fit: BoxFit.fill,
                                )
                              : Image.network(
                                  "https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png",
                                  fit: BoxFit.fill,
                                ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 90, top: 80),
                      child: IconButton(
                        icon: Icon(Icons.camera_alt_outlined),
                        onPressed: () {
                          setState(() {
                            getImage();
                          });
                        },
                      ),
                    ),
                  ]),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
              //SizedBox(
              // height: 20,
              //),
              Flexible(
                child: Container(
                  width: 300,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: usernameController,
                    cursorColor: Colors.red,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0XFF1D1F33),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      hintText: 'amal2021',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      labelText: 'Username',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  width: 300,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: usernameController,
                    cursorColor: Colors.red,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0XFF1D1F33),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      hintText: 'Amal Ahmed',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      labelText: 'Full Name',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: 360,
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 11,
                    textAlign: TextAlign.left,
                    controller: bioController,
                    cursorColor: Colors.red,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0XFF1D1F33),
                      hoverColor: Colors.white,
                      border: OutlineInputBorder(
                        //borderRadius: BorderRadius.circular(80),
                      ),
                      labelText: 'Bio',
                      hintText:
                          "I'm a team player that likes to plays sensibly rather than rushing but never shy away from a challenge which can require anything ",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                ),
              ),
              //SizedBox(
              //height: 25,
              //),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(left:10),
                      height: 50,
                      width: 110,
                      alignment: Alignment.center,
                      child: TextField(
                        //controller: ageController,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0XFF1D1F33),
                          hoverColor: Colors.white,
                          border: OutlineInputBorder(
                            //borderRadius: BorderRadius.circular(80),
                          ),
                          labelText: 'Age',
                          hintText: '21 years',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //SizedBox(
              // height: 100,
              //),
            ],
          ),
        ),
      ),
    );
  }

  selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(1970),
        lastDate: DateTime(2050),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
                surface: Colors.blueGrey,
                onSurface: Colors.greenAccent,
              ),
              dialogBackgroundColor: Colors.black54,
            ),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      DateTime today = new DateTime.now();
      _selectedDate = newSelectedDate;
      AgeDuration age;
      age = Age.dateDifference(
          fromDate: newSelectedDate, toDate: today, includeToDate: false);
      int out = age.years;
      ageController
        ..text = "$out" + " years"
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: ageController.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}
