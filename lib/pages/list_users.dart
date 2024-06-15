// LISTUSER.DART

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_flutter/providers/users_provider.dart';

// chnage StatelessWidget to ConsumerWidget
class ListUsers extends ConsumerWidget {
  const ListUsers({super.key});

  @override
  // Accept the ref property 
  Widget build(BuildContext context, WidgetRef ref) {
    // Read changes from the provider using the ref
    final allUsers = ref.read(usersProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text("List All User"),
        ),
        body: ListView.builder(
            itemCount: allUsers.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.person),
                title: Text(allUsers[index].name),
                subtitle: Text(allUsers[index].email),
              );
            }));
  }
}
