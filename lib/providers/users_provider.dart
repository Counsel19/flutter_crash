import 'package:hello_flutter/models/user_model.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:cloud_firestore/cloud_firestore.dart";

final db = FirebaseFirestore.instance;

// Notifier to notifier the state of changes on the state
class UserNotifier extends Notifier<Future<List<User>>> {
  @override
  Future<List<User>> build() async {
    return getUsers();
  }

  Future<List<User>> getUsers() async {
    final allUsers = await db.collection("users").get();

    return allUsers.docs.map((item) => User.fromJson(item.data())).toList();
  }

// A mathod to Add Or Update user to the db
  Future<void> addNewUser(User newUser) async {
    final userMap = {
      "id": newUser.id,
      "name": newUser.name,
      "email": newUser.email
    };
    // db.collection("users").add(userMap);
    await db.collection("users").doc(newUser.id).set(userMap);
  }

  // Update User
  Future<void> updateUser(
      {required String id, required String name, required String email}) async {
    final userMap = {"id": id, "name": name, "email": email};
    await db.collection("users").doc(id).update(userMap);
  }

  // Delete User
  Future<void> deleteUser(String id) async {
    await db.collection("users").doc(id).delete();
  }
}

// Notifier Provider  which makes the State availaible to the widgets
final usersProvider = NotifierProvider<UserNotifier, Future<List<User>>>(() {
  return UserNotifier();
});
