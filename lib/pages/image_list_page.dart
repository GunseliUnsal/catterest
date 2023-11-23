import 'package:flutter/material.dart';
import 'package:catterest/data/data_service.dart';
import 'package:catterest/data/image_model.dart';

class ImageListPage extends StatefulWidget {
  const ImageListPage({Key? key}) : super(key: key);

  @override
  _ImageListPageState createState() => _ImageListPageState();
}

class _ImageListPageState extends State<ImageListPage> {
  final DataService dataService = DataService();
  List<ImageURL> images = [];

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    List<ImageURL> loadedImages = await dataService.getImages(6);
    setState(() {
      images = loadedImages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/logo.jpg", height: 50.0),
        centerTitle: true,
        leading: Container(), // leading'i temizle
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Card(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0), // İsteğe bağlı: Card'ın kenarlarını yuvarlamak için
              child: Image.network(
                images[index].url,
                fit: BoxFit.cover, // Resmi Card'a tamamen sığdırmak için
              ),
            ),
          );
        },
      ),
    );
  }
}
