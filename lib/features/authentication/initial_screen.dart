import 'package:flutter/material.dart';
import 'package:nomad_flutter_twitter/common/widgets/social_button.dart';
import 'package:nomad_flutter_twitter/constants/gaps.dart';
import 'package:nomad_flutter_twitter/constants/sizes.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  final logoImage = 'assets/images/twitter_logo.png';

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
                Gaps.v96,
                const Text(
                  "See what's happening",
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Text(
                  "in the world right now.",
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Gaps.v80,
                const SocialButton(),
                Gaps.v10,
                const SocialButton(),
                Gaps.v10,
                const SocialButton(),
                Gaps.v10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Divider(color: Colors.grey[300], thickness: 2.0),
                    ),
                    Gaps.h10,
                    const Text("or"),
                    Gaps.h10,
                    Flexible(
                      child: Divider(color: Colors.grey[300], thickness: 2.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
