import 'package:hello_flutter/models/user_model.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:cloud_firestore/cloud_firestore.dart";

// intial user list
List<User> allUsers = [
  User(name: "John Hery", email: "Hejsohn@gmail.com"),
  User(name: "Jore Biden", email: "joe@gmail.com"),
  User(name: "Frank Tom", email: "frank@gmil.com"),
  User(name: "Tim Larry", email: "tim@amil.com"),
];

final db = FirebaseFirestore.instance;

// Notifier to notifier the state of changes on the state
class UserNotifier extends Notifier<Future<List<User>>> {
  @override
  Future<List<User>> build() async {
    final allUsers = await db.collection("users").get();
    return allUsers.docs.map((item) => User.fromJson(item.data())).toList();
  }

// A mathod to update the state
  void addNewUser(User newUser) {
    final userMap = {"name": newUser.name, "email": newUser.email};
    // db.collection("users").add(userMap);
    db.collection("users").doc("thirdUserDocRef").set(userMap);
  }
}

// Notifier Provider  which makes the State availaible to the widgets
final usersProvider = NotifierProvider<UserNotifier, Future<List<User>>>(() {
  return UserNotifier();
});
