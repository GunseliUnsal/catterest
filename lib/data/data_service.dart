import 'dart:convert';

import 'package:catterest/data/image_model.dart';
import 'package:http/http.dart' as http;

class DataService {
  String baseURL = "https://api.thecatapi.com/v1/images/search?limit=";

  Future<List<ImageURL>> getImages(int amount) async {
    final response = await http.get(Uri.parse("$baseURL$amount"));

    if (response.statusCode == 200) {
      return List.from(jsonDecode(response.body).map((map) => ImageURL.fromMap(map)));
    } else {
      throw Exception('Failed to load images - ${response.statusCode}');
    }
  }
}
