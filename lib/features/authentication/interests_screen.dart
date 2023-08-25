import 'package:flutter/material.dart';
import 'package:nomad_flutter_twitter/common/widgets/interests_button.dart';
import 'package:nomad_flutter_twitter/constants/gaps.dart';
import 'package:nomad_flutter_twitter/constants/sizes.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment Cultrue",
  "Dance",
  "Animals",
  "Food & Drink",
  "Beauty & Style",
  "Auto & Vehicle",
  "Music",
  "Sports",
  "Gaming",
  "Drama",
  "Learning",
  "Talent",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final logoImage = 'assets/images/twitter_logo.png';

  final ScrollController _scrollController = ScrollController();

  bool _showTitle = false;

  void _onScroll() {
    if (_scrollController.offset > 100) {
      if (_showTitle) return;
      setState(() {
        _showTitle = true;
      });
    } else {
      setState(() {
        _showTitle = false;
      });
    }
  }

  void _onMoveInterestsScreenPartTwo(context) {
    print("111");
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black12,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Gaps.v10,
                    Image.asset(
                      logoImage,
                      width: 30, // 원하는 너비로 설정
                      height: 30, // 원하는 높이로 설정
                    ),
                    Gaps.v20,
                    const Text(
                      "What do you want to see on Twitter?",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Gaps.v20,
                    const Text(
                      "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gaps.v20,
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: Sizes.size24,
                    right: Sizes.size24,
                    bottom: Sizes.size16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        runSpacing: 15,
                        spacing: 15,
                        children: [
                          for (var interest in interests)
                            InterestsButton(interest: interest)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size20,
                horizontal: Sizes.size40,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("asd"),
                  GestureDetector(
                    onTap: () => _onMoveInterestsScreenPartTwo(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: Sizes.size16,
                        horizontal: Sizes.size16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.black45,
                      ),
                      child: const Text(
                        'Next',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: Sizes.size16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
