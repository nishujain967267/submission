import 'dart:async';
import 'dart:convert';

import 'package:submission/album.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  Future<Album> fetchAlbum() async {
    final response =
        await http.get(Uri.parse('https://gorest.co.in/public/v1/users'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
