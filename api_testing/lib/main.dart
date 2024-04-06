import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  dynamic bodyData;

  Future<http.Response> fetchAlbum() {
    return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Http Request')),
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
              return Text(
                "${body['title']}",
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
