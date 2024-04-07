import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'dart:convert';
import 'album.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final logger = Logger();
  dynamic bodyData;

  Future<void> createAlbum() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/albums');
    Album newAlbum = Album(
      userId: 10,
      id: 5,
      title: "November Rain",
    );
    var response = await http.post(
      url,
      body: jsonEncode(
        newAlbum.toJson(), // Album -> Map -> JSON string -----> SERVER
      ),
    );

    if (response.statusCode == 201) {
      // created
      logger.i('album created successfully!');
    } else {
      logger.e('Failed to create album: ${response.statusCode}');
    }
  }

  Future<http.Response> fetchAlbum() {
    return http
        .get(
          Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
        )
        .timeout(
          const Duration(seconds: 10),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Http Request')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await createAlbum();
        },
        child: const Icon(Icons.refresh),
      ),
      body: Center(
        child: FutureBuilder<dynamic>(
            future: fetchAlbum(), // Future<dynamic>
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox.square(
                  dimension: 150,
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasError) {
                return const Text(
                  'Some error occurred',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.red,
                  ),
                );
              }

              final data = snapshot.data;
              final body = jsonDecode(data.body); // data.body => JSON string
              final Album album = Album.fromJson(body);
              return Text(
                album.title,
                style: const TextStyle(
                  fontSize: 50,
                ),
              );
            }),
      ),
    );
  }
}

// SOLID -> S - Single Responsibility Principle

// void getAlbumData() async{
//   final response = await fetchAlbum();
// //           final titleList = body.map((data) => data['title']).toList();
// //           return ListView.builder(
// //             itemCount: titleList.length,
// //             itemBuilder: (context,index){
// //               return ListTile(
// //                 title: Text(titleList[index]),
// //               );
// //             }
// //           );
// //     fetchAlbum().then((response){
// //       print("status code ${response.statusCode}");
// //       print("body ${response.body}");
// //     },).onError((error,stacktrace){
// //       print("error $error");
// //     },);
//
//   print("Status code ${response.statusCode}");
//   print("Body : ${response.body}");
//
//   if(response.statusCode == 200){
//     setState((){
//       bodyData = response.body;
//     });
//   }
//
// }

// print("status code ${data.statusCode}");
// print("body ${data.body}");

/// Debug, Release, Profile
