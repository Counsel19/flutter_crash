import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:hello_flutter/models/post_model.dart";
import "package:hello_flutter/services/post_service.dart";

// Notifier to notifier the state of changes on the state
class PostNotifier extends Notifier<Future<List<Post>>> {
  @override
  Future<List<Post>> build() async {
    return PostService.getAllPosts();
  }
}

// Notifier Provider  which makes the State availaible to the widgets
final postProvider = NotifierProvider<PostNotifier, Future<List<Post>>>(() {
  return PostNotifier();
});
