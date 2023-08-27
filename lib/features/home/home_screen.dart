import 'package:flutter/material.dart';
import 'package:nomad_flutter_twitter/features/post/post_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final logoImage = 'assets/images/twitter_logo.png';

  void _onLoginTab(context) {
    print("asd");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              logoImage,
              width: 30, // 원하는 너비로 설정
              height: 30, // 원하는 높이로 설정
            ),
            const Expanded(
              child: PostScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
