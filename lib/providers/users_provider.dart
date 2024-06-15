import 'package:hello_flutter/models/user_model.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

// intial user list
List<User> allUsers = [
  User(name: "John Hery", email: "Hejsohn@gmail.com"),
  User(name: "Jore Biden", email: "joe@gmail.com"),
  User(name: "Frank Tom", email: "frank@gmil.com"),
  User(name: "Tim Larry", email: "tim@amil.com"),
];

// Notifier to notifier the state of changes on the state
class UserNotifier extends Notifier<List<User>> {
  @override
  List<User> build() {
    return allUsers;
  }

// A mathod to update the state 
  void addNewUser(User newUser) {
    allUsers.add(newUser);
  }
}

// Notifier Provider  which makes the State availaible to the widgets 
final usersProvider = NotifierProvider<UserNotifier, List<User>>(() {
  return UserNotifier();
});
