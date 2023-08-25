import 'package:flutter/material.dart';
import 'package:nomad_flutter_twitter/common/widgets/form_button.dart';
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
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size20,
            vertical: Sizes.size20,
          ),
          child: Column(
            //Column을 쓰면 가운데 정렬이 자동임, start 옵션을 줘야 왼쪽정렬
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  Gaps.h28 // 중앙 정렬 위한 SizedBox
                ],
              ),
              Gaps.v40,
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
              Gaps.v20,

              const Spacer(), // 버튼 하단 고정된 화면을 구현하고자 한다면 Spacer 위젯이 가장 간단하게 구현가능함

              GestureDetector(
                onTap: () => _onMoveInterestsScreenPartTwo(context),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        Sizes.size40,
                      ),
                    ),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: const FormButton(
                    text: "Next",
                    disabled: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
