// ADMINUSER.DART

import 'package:flutter/material.dart';

class AdminUsers extends StatelessWidget {
  const AdminUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Users"),
      ),
      body: Center(
        child: OutlinedButton.icon(
          icon: const Icon(Icons.arrow_back_sharp),
          onPressed: () {
             Navigator.pop(context);
          },
          label: const Text("Go Back"),
        ),
      ),
    );
  }
}
