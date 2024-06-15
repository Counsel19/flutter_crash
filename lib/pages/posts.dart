// POST.DART

import "dart:async";
import "package:flutter/material.dart";
import "package:hello_flutter/models/post_model.dart";
import "package:hello_flutter/providers/post_provider.dart";
import "package:hello_flutter/widgets/post_item.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class AllPost extends ConsumerStatefulWidget {
  const AllPost({super.key});

  @override
  ConsumerState<AllPost> createState() => _AllPostState();
}

class _AllPostState extends ConsumerState<AllPost> {
  Future<List<Post>>? allPost;

  @override
  void initState() {
    super.initState();
    allPost = ref.read(postProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(28),
            child: FutureBuilder<List<Post>>(
              future: allPost,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: PostItem(
                          title: snapshot.data![index].title,
                          body: snapshot.data![index].body,
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Text("Cannot Load Data");
                }

                return const CircularProgressIndicator();
              },
            )),
      ),
    );
  }
}
