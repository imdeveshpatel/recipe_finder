
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_finder/core/constants/image_constant.dart';
import 'package:recipe_finder/screens/search_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
     Get.off(const SearchScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  AppImage.welcomePng,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}