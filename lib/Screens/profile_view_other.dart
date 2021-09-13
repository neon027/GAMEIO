import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gameio/Screens/profile_edit_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'chat_view.dart';

class ProfileViewOther extends StatefulWidget {
  @override
  _ProfileViewOtherState createState() => _ProfileViewOtherState();
}

class _ProfileViewOtherState extends State<ProfileViewOther> {
  String image;
  String name;
  String receiverEmail;
  String displayName;
  int age;
  String country;
  String discord;
  String bio;

  @override
  void initState() {
    super.initState();
    getProfileData();
  }

  getProfileData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      image = pref.getString('image');
      name = pref.getString('name');
      receiverEmail = pref.getString('email');
      displayName = pref.getString('displayName');
      age = pref.getInt('age');
      country = pref.getString('country');
      discord = pref.getString("discord_ID");
      bio = pref.getString("bio");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Container(
            alignment: Alignment.topLeft,
            child: Text(
              'Profile',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          ListView(
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/gamepad.jpg"),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        width: 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 35),
                    child: CircleAvatar(
                      maxRadius: 70,
                      backgroundColor: Colors.black38,
                      child: ClipOval(
                        child: SizedBox(
                          height: 120,
                          width: 120,
                          child: Image.network(
                            image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 105, left: 190),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      height: 55,
                      width: 180,
                      child: TextButton(
                        onPressed: () async {
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          pref.setString('email', receiverEmail);
                          pref.setString('name', name);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatScreen()));
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blueAccent),
                        ),
                        child: Text(
                          'message',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Flexible(
                child: Container(
                  child: Column(
                    children: [
                      ListTile(
                        dense: true,
                        title: Text(
                          'Name',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        subtitle: Text(
                          name,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      ListTile(
                        dense: true,
                        title: Text(
                          'Username',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        subtitle: Text(
                          displayName,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      ListTile(
                        dense: true,
                        title: Text(
                          'Age',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        subtitle: Text(
                          age.toString(),
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      ListTile(
                        dense: true,
                        title: Text(
                          'Country',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        subtitle: Text(
                          country,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      ListTile(
                        dense: true,
                        title: Text(
                          'DiscordID',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        subtitle: Text(
                          discord,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      ListTile(
                        dense: true,
                        title: Text(
                          'Bio',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        subtitle: Text(
                          bio,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
