import 'package:flutter/material.dart';
import 'package:nomad_flutter_twitter/common/widgets/form_button.dart';
import 'package:nomad_flutter_twitter/common/widgets/interests_button.dart';
import 'package:nomad_flutter_twitter/constants/gaps.dart';
import 'package:nomad_flutter_twitter/constants/sizes.dart';
import 'package:nomad_flutter_twitter/features/authentication/interests_screen_part_two.dart';

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

  final ScrollController scrollController = ScrollController();

  bool showTitle = false;
  int _selectedCount = 0;
  bool _selectionComplete = false;

  void _handleSelection(bool isSelected) {
    setState(() {
      _selectedCount += isSelected ? 1 : -1;
      // 선택된 항목이 3개 이상이면 선택 완료로 표시
      if (_selectedCount >= 3) {
        _selectionComplete = true;
      } else {
        _selectionComplete = false;
      }
    });
  }

  void _onScroll() {
    if (scrollController.offset > 100) {
      if (showTitle) return;
      setState(() {
        showTitle = true;
      });
    } else {
      setState(() {
        showTitle = false;
      });
    }
  }

  void _onMoveInterestsScreenPartTwoScreen(context) {
    if (!_selectionComplete) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const InterestsScreenPartTwoScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    scrollController.dispose();
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
              child: GridView.builder(
                padding: const EdgeInsets.only(
                  left: Sizes.size24,
                  right: Sizes.size24,
                  bottom: Sizes.size16,
                ),
                itemCount: interests.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 한 줄에 표시할 요소 수
                    mainAxisSpacing: 15, // 세로 간격
                    crossAxisSpacing: 15, // 가로 간격
                    childAspectRatio: 2 // 아이템 비율 설정
                    ),
                itemBuilder: (context, index) {
                  return InterestsButton(
                    interest: interests[index],
                    onSelected: _handleSelection,
                    selectionComplete: _selectionComplete,
                  );
                },
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
                  _selectionComplete
                      ? const Text('Great work')
                      : Text('$_selectedCount selected of 3'),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: Sizes.size96,
                      ),
                      child: GestureDetector(
                        onTap: () =>
                            _onMoveInterestsScreenPartTwoScreen(context),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                Sizes.size40,
                              ),
                            ),
                            color: Theme.of(context).primaryColor,
                          ),
                          child: FormButton(
                            text: "Next",
                            disabled: !_selectionComplete,
                          ),
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
