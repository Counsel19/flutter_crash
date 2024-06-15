import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/add_user.dart';
import 'package:hello_flutter/pages/home.dart';
import 'package:hello_flutter/pages/list_users.dart';
import 'package:hello_flutter/pages/posts.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final List<Widget> _mainScreens = [
    const HomePage(),
    const AddUser(),
    const ListUsers(),
    const AllPost()
  ];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.deepOrange.shade300,
        indicatorColor: Colors.white,
        // labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        // Manages what destination is active
        selectedIndex: currentPage,
        // A method called when ever a new destination is selected
        onDestinationSelected: (value) {
          setState(() {
            currentPage = value;
          });
        },
        // List of Main screens destinations
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.add),
            label: "Add Users",
            selectedIcon: Icon(Icons.add_box),
          ),
          NavigationDestination(
            icon: Icon(Icons.list),
            label: "List Users",
          ),
          NavigationDestination(
            icon: Icon(Icons.list),
            label: "All Posts",
          ),
        ],
      ),
      body: _mainScreens[currentPage],
    );
  }
}
