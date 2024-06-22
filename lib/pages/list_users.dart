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
        body: FutureBuilder(
            future: allUsers,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Unable to Load Users"),
                );
              }
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(snapshot.data![index].name),
                      subtitle: Text(snapshot.data![index].email),
                    );
                  });
            }));
  }
}
