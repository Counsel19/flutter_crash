// HOME.DART

import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/add_user.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: const [
            UserAccountsDrawerHeader(
              accountName: Text("Tech365"),
              accountEmail: Text("tech365.ng.com"),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image(
                    image: AssetImage("assets/images/polymorphism.png"),
                  ),
                ),
              ),
            ),

            ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
            ),
            ListTile(
              title: Text("Add Users"),
              leading: Icon(Icons.add_a_photo_outlined),
            ),
            ListTile(
              title: Text("List Users"),
              leading: Icon(Icons.list_sharp),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddUser(
                        navigatingFrom: "The Home Page Data",
                      ),
                    ),
                  );
                  print(result);
                },
                child: const Text("Add Users"),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/all-users");
                },
                child: const Text("List All Users"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
