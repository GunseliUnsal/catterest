import 'package:catterest/constants/colors.dart';
import 'package:catterest/pages/favorites_page.dart';
import 'package:flutter/material.dart';
import 'package:catterest/data/data_service.dart';
import 'package:catterest/data/image_model.dart';
import 'show_cat_button.dart'; // ShowCatButton sayfasını import et

class ImageListPage extends StatefulWidget {
  const ImageListPage({Key? key}) : super(key: key);

  @override
  _ImageListPageState createState() => _ImageListPageState();
}

class _ImageListPageState extends State<ImageListPage> {
  final DataService dataService = DataService();
  List<ImageURL> images = [];

  final int _currentIndex = 0;

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
        title: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ShowCatButton()),
            );
          },
          child: Image.asset(
            "assets/images/logo.jpg",
            height: 50.0,
          ),
        ),
        centerTitle: true,
        leading: Container(), // leading'i temizle
      ),
      body: Stack(
        children: [
          // Background image
          Center(
            child: Opacity(
              opacity: 0.5, // Set opacity to 50%
              child: Image.asset(
                'assets/images/heart_paw_icon.png',
                fit: BoxFit.cover,
                width: 300,
                height: 300,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Card(
                  color: backgroundColor,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      images[index].url,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 50,
            right: 33.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                width: 55,
                height: 55,
                color: buttonColor,
                child: IconButton(
                  iconSize: 40,
                  color: primaryTextColor,
                  onPressed: () {},
                  icon: const Icon(Icons.autorenew_outlined),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: buttonColor, // Arkaplan rengini pembe yap
        selectedItemColor: primaryTextColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: primaryTextColor,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FavoritesPage()),
                );
              },
              child: Icon(
                Icons.favorite,
                color: primaryTextColor,
              ),
            ),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
