// post_item.dart inside in the widget folder

import "package:flutter/material.dart";

class PostItem extends StatelessWidget {
  const PostItem({super.key, required this.title, required this.body});
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 254, 248, 255),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          )),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            body,
            style: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
