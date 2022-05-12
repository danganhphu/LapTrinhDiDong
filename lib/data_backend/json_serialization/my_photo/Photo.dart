import 'dart:convert';
import 'package:http/http.dart' as http;

class Photo {
  final int? albumId;
  final int? id;
  final String? title;
  final String? url;
  final String? thumbnailUrl;

  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});
  factory Photo.fromJson(Map<String, dynamic> json){
    return Photo(
        albumId : json['albumId'] as int,
        id : json['id'] as int,
        title : json['title'] as String,
        url : json['url'] as String,
        thumbnailUrl : json['thumbnailUrl'] as String);
  }
}

Future<List<dynamic>> fetchPhotos() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
  var response = await http.get(url);
  if(response.statusCode == 200) {
    return jsonDecode(response.body) as List;
  }
  else
    return [];
}

