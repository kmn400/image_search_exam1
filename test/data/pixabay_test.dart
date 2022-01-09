import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:image_search_exam/model/picture_result.dart';

void main() {
  test('pixabay api 테스트', () async {
    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=17828481-17c071c7f8eadf406822fada3&q=iphone&image_type=photo'));

    final result = jsonDecode(response.body);
    final List jsonHits = result['hits'];

    List<Picture> pictures = [];

    for (int i = 0; i < jsonHits.length; i++) {
      final picture = Picture.fromJson(jsonHits[i]);
      pictures.add(picture);
    }
    print(pictures);
  });
}
