// POST.DART

import "dart:async";
import "package:flutter/material.dart";
import "package:hello_flutter/models/post_model.dart";
import "package:hello_flutter/services/post_service.dart";
import "package:hello_flutter/widgets/post_item.dart";

class AllPost extends StatefulWidget {
  const AllPost({super.key});

  @override
  State<AllPost> createState() => _AllPostState();
}

class _AllPostState extends State<AllPost> {
  Future<List<Post>>? allPost;

  @override
  void initState() {
    super.initState();
    allPost = PostService.getAllPosts();
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
