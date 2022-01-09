import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_search_exam/data/pixabay_api.dart';
import 'package:image_search_exam/model/picture_result.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Picture> _pictures = [];

  final _api = PixabayApi();
  final _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _showResult('iphone');
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Future<void> _showResult(String query) async {
    List<Picture> pictures = await _api.fetchPhotos(query);
    setState(() {
      _pictures = pictures;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('이미지 검색'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  _showResult(_textEditingController.text);
                },
                icon: const Icon(Icons.search),
              )
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: _pictures.map((e) => Image.network(e.previewURL)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
