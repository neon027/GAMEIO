import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_auth.dart';

class UserDatabaseService {
  var value;
  final String uid;

  UserDatabaseService({this.uid});

  final CollectionReference userCollection = FirebaseFirestore.instance
      .collection('Users');


  //function called when new user is created to store name
  Future addUserData(String name, int age, String gender, String bio) async {
    // set default values and name
    return await userCollection.doc(uid).set({
      'displayName': "",
      'country': "",
      'currentlyPlaying': "",
      'name': name,
      'age': age,
      'gender': gender,
      'bio': bio,
    }, SetOptions(merge: true));
  }

// update profile data of user
  Future updateUserData(String username, String name, int age, String gender,
      String bio, String country) async {
    //set particulars of user
    return await userCollection.doc(uid).update({
      'displayName': username,
      'name': name,
      'age': age,
      'gender': gender,
      'bio': bio,
      "country": country
    }, ); // merge with old record

  }

//set logged in value to true
  Future isLoggedIn() async {
    return await userCollection.doc(uid).set({
      'isloggedin': true,
    }, SetOptions(merge: true));
  }

  Future updateUsername(String username) async {
    return await userCollection.doc(uid).set({
      'username': username,
    }, SetOptions(merge: true));
  }

//set logged in value to false
  Future isLoggedOut() async {
    return await userCollection.doc(uid).set({
      'isloggedin': false,
    }, SetOptions(merge: true));
  }
}
