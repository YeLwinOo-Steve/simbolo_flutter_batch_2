import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class Post {
  final int id;
  final int userId;
  final String title;
  final String body;

  Post(
      {required this.id,
      required this.userId,
      required this.title,
      required this.body});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      body: json['body']);
  Map<String, dynamic> toJson() =>
      {"userId": userId, "id": id, "title": title, "body": body};
}

class Comment {
  final int id;
  final int postId;
  final String name;
  final String email;
  final String body;

  Comment({
    required this.id,
    required this.postId,
    required this.name,
    required this.email,
    required this.body,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      postId: json['postId'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }
}

class ApiService extends GetConnect {
  /// [GET] request
  Future<List<Post>> getPosts() async {
    final response =
    await get(
    'https://jsonplaceholder.typicode.com/posts'
    );
    return (
        json.decode(response.body) as List
        ).map(
        (data) =>
            Post.fromJson(data)
        ).toList();
  }

  /// [GET] request
  Future<List<Comment>> getComments(int postId) async {
    final response = await get(
        'https://jsonplaceholder.typicode.com/posts/'
            '$postId/comments'
    );
    return (
        json.decode(response.body) as List
    ).map(
            (data) =>
                Comment.fromJson(data)
    ).toList();
  }

  /// [POST] request
  Future<dynamic> createPost(Post p) async {
    final response =
    await post(
      'https://jsonplaceholder.typicode.com/posts',
      p.toJson(),
    );

    if (response.status.hasError) {
      throw Exception('Error creating post');
    } else {
      return json.decode(response.body);
    }
  }

  /// [PUT] request
  Future<dynamic> updatePost(Post post) async {
    final response = await put(
    'https://jsonplaceholder.typicode.com/posts/${post.id}',
      post.toJson(),
    );
    if (response.status.hasError) {
      throw Exception('Error updating post');
    } else {
      return json.decode(response.body);
    }
  }

  /// [DELETE] request
  Future<void> deletePost(int postId) async {
    final response = await delete(
      'https://jsonplaceholder.typicode.com/posts/$postId',
    );

    if (response.status.hasError) {
      throw Exception('Error deleting post');
    } else {
      /// TODO: show success alert or something
    }
  }
}

class MyApp extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Social App'),
        ),
        body: FutureBuilder<List<Post>>(
          future: apiService.getPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final posts = snapshot.data!;
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(posts[index].title),
                    subtitle: Text(posts[index].body),
                    onTap: () => _showComments(posts[index]),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  _showComments(Post post) async {
    final comments = await apiService.getComments(post.id);
    Get.dialog(
      Dialog(
        child: Column(
          children: [
            ListTile(
              title: Text(post.title),
              subtitle: Text(post.body),
            ),
            Divider(),
            Text('Comments:'),
            Expanded(
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(comments[index].name),
                    subtitle: Text(comments[index].body),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
