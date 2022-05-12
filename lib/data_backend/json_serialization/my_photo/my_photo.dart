import 'Photo.dart';
import 'package:flutter/material.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({Key? key}) : super(key: key);

  @override
  State<PhotosPage> createState() => _PhotoState();
}

class _PhotoState extends State<PhotosPage> {
  late Future<List<Photo>> photos;
  // @override
  // void initState() {
  //   super.initState();
  //   photos = fetchPhotos();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
