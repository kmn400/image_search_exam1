import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_search_exam/model/photo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Photo> photos = [];
  Future<void> fetchPhotos() async {
    http.Response response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=17828481-17c071c7f8eadf406822fada3&q=lion&image_type=photo'));

    List jsonList = jsonDecode(response.body)['hits'];

    setState(() {
      photos = jsonList.map((e) => Photo.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API test'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                fetchPhotos();
              },
              child: Text('이미지 가져오기')),
          Expanded(
              child: ListView.builder(
                  itemCount: photos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.network(photos[index].previewURL),
                    );
                  }))
        ],
      ),
    );
  }
}
