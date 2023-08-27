import 'package:flutter/material.dart';
import 'package:nomad_flutter_twitter/constants/gaps.dart';
import 'package:nomad_flutter_twitter/constants/sizes.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final logoImage = 'assets/images/twitter_logo.png';

  void _onLoginTab(context) {
    print("asd");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size40,
          vertical: Sizes.size20,
        ),
        child: SafeArea(
          /// Center Widget : 모든것을 가운데로 정렬
          child: Center(
            child: Column(
              /// mainAxisAlignment : MainAxisAlignment.start 세로축 맨위부터 시작
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Gaps.v20,
                Image.asset(
                  logoImage,
                  width: 30, // 원하는 너비로 설정
                  height: 30, // 원하는 높이로 설정
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
