import 'package:flutter/material.dart';
import 'package:nomad_flutter_twitter/common/widgets/form_button.dart';
import 'package:nomad_flutter_twitter/constants/gaps.dart';
import 'package:nomad_flutter_twitter/constants/sizes.dart';

class CustomizeExperienceScreen extends StatefulWidget {
  const CustomizeExperienceScreen({super.key});

  @override
  State<CustomizeExperienceScreen> createState() =>
      _CustomizeExperienceScreenState();
}

class _CustomizeExperienceScreenState extends State<CustomizeExperienceScreen> {
  final logoImage = 'assets/images/twitter_logo.png';

  late bool switchButton = false;

  void _onMoveSignupScreen(context) {
    print(switchButton);
    Navigator.of(context).pop(switchButton);
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Image.asset(
                      logoImage,
                      width: 30, // 원하는 너비로 설정
                      height: 30, // 원하는 높이로 설정
                    ),
                    const SizedBox(width: 30), // 중앙 정렬 위한 SizedBox
                  ],
                ),
                Gaps.v40,
                const Text(
                  "Customize your experience",
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Gaps.v20,
                const Text(
                  "Track where you see Twitter content across the web",
                  style: TextStyle(
                    fontSize: Sizes.size18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Gaps.v10,
                SwitchListTile(
                  title: const Text(
                    "Twitter uses this data to personalize your experience.This web browsing history will never be stored with your name, email or phone number.",
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  value: switchButton,
                  onChanged: (value) {
                    setState(() {
                      switchButton = value;
                    });
                  },
                ),
                Gaps.v96,
                const Text(
                  "By signing up, you agree to our Terms, Privacy Policy, and Cookie Use. Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy. Learn more",
                  style: TextStyle(
                    fontSize: Sizes.size14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Gaps.v10,
                GestureDetector(
                  onTap: () => _onMoveSignupScreen(context),
                  child: FormButton(
                    disabled: !switchButton,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
