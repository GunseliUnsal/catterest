import 'package:catterest/constants/colors.dart';
import 'package:flutter/material.dart';
import 'image_list_page.dart';

class ShowCatButton extends StatelessWidget {
  const ShowCatButton({
    Key? key,
  }) : super(key: key);

  final String appName = "CATTEREST";
  final String buttonText = 'Show me the cats!';
  final String developerName = "Made by Gunseli Unsal";
  final String logoPath = "assets/images/logo.jpg";
  final String heartPawIconPath = "assets/images/heart_paw_icon.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 60, 0, 10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                logoPath,
                height: 60.0,
              ),
              const SizedBox(height: 12.0),
              Text(
                appName,
                style: TextStyle(
                  color: primaryTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                ),
              ),
              const SizedBox(height: 80.0),
              Image.asset(
                heartPawIconPath,
                height: 300,
              ),
              const SizedBox(height: 56.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ImageListPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(140, 50),
                ),
                child: Text(
                  buttonText,
                  style: TextStyle(color: primaryTextColor, fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              Text(
                developerName,
                style: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w500, fontSize: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
