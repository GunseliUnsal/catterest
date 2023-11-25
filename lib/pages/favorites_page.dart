import 'package:catterest/constants/colors.dart';
import 'package:catterest/pages/favorites_page.dart';
import 'package:catterest/pages/image_list_page.dart';
import 'package:catterest/pages/show_cat_button.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:catterest/data/data_service.dart';
import 'package:catterest/data/image_model.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _ImageListPageState createState() => _ImageListPageState();
}

class _ImageListPageState extends State<FavoritesPage> {
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
            padding: const EdgeInsets.all(26.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2.1,
              ),
              itemCount: images.length,
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
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: buttonColor, // Arkaplan rengini pembe yap
        selectedItemColor: primaryTextColor,
        items: [
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ImageListPage()),
                );
              },
              child: Icon(
                Icons.home,
                color: primaryTextColor,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: primaryTextColor,
            ),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
