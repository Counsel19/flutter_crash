// MAIN.DART

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:hello_flutter/pages/add_user.dart";
import "package:hello_flutter/pages/admin_users.dart";
import "package:hello_flutter/pages/home.dart";
import "package:hello_flutter/pages/list_users.dart";
import "package:hello_flutter/pages/posts.dart";
import "package:hello_flutter/pages/start_screen.dart";

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Main Entry Point for my application
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Call the runApp method
  runApp(
    // Makes providers avaliable to your widgets
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/home": (context) => const HomePage(),
        "/add-users": (context) => const AddUser(),
        "/all-users": (context) => const ListUsers(),
        "admin-users": (context) => const AdminUsers(),
        "/post": (context) => const AllPost(),
      },
      home: const StartScreen(),
    );
  }
}
