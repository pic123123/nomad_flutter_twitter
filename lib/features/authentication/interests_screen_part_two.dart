import 'package:flutter/material.dart';
import 'package:nomad_flutter_twitter/common/widgets/form_button.dart';
import 'package:nomad_flutter_twitter/common/widgets/interests_button.dart';
import 'package:nomad_flutter_twitter/constants/gaps.dart';
import 'package:nomad_flutter_twitter/constants/sizes.dart';

const musics = [
  'Rock',
  'Pop',
  'Jazz',
  'Rock',
  'Pop',
  'Jazz',
  'Rock',
  'Pop',
  'Jazz',
  'Rock',
  'Pop',
  'Jazz'
];

const entertainments = [
  'Movies',
  'TV Shows',
  'Movies',
  'TV Shows',
  'Movies',
  'TV Shows',
  'Movies',
  'TV Shows',
  'Movies',
  'TV Shows'
];

class InterestsScreenPartTwoScreen extends StatefulWidget {
  const InterestsScreenPartTwoScreen({super.key});

  @override
  State<InterestsScreenPartTwoScreen> createState() =>
      _InterestsScreenPartTwoScreenState();
}

class _InterestsScreenPartTwoScreenState
    extends State<InterestsScreenPartTwoScreen> {
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

  void _onMoveTest(context) {
    print("fasfasf");
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

  Widget buildCategory(String title, List<String> items) {
    // items를 세 개씩 나눕니다.
    var chunks = [];
    for (var i = 0; i < items.length; i += 3) {
      chunks.add(items.sublist(i, i + 3 > items.length ? items.length : i + 3));
    }
    return Column(
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
              fontSize: Sizes.size20, fontWeight: FontWeight.w800),
        ),
        Gaps.v10,
        SizedBox(
          height: 52.0 * (chunks[0].length) +
              (chunks[0].length - 1) * 10, // 버튼 높이와 버튼 사이 간격에 따라 조정하세요.
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(
                left: Sizes.size24, right: Sizes.size24, bottom: Sizes.size16),
            itemCount: chunks.length,
            separatorBuilder: (context, index) =>
                const SizedBox(width: Sizes.size5), // 여기에서 컬럼 사이의 공간 설정
            itemBuilder: (context, index) => Column(children: [
              for (var item in chunks[index])
                Padding(
                    padding: EdgeInsets.only(
                        bottom: index < chunks[index].length - 1
                            ? 10.0
                            : 0), // 버튼 사이 간격 설정
                    child: InterestsButton(
                      interest: item,
                      onSelected: _handleSelection,
                      selectionComplete: _selectionComplete,
                    ))
            ]),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(
                  Sizes.size20,
                ),
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
                        fontSize: Sizes.size24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Gaps.v20,
                    const Text(
                      "interests are used to personalize your experience and will be visible on your profile",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Gaps.v10,
                    const Divider(color: Colors.grey),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  buildCategory("Music", musics),
                  const Divider(color: Colors.grey),
                  buildCategory("Entertainment", entertainments),
                ],
              ),
              const Divider(color: Colors.grey),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.size10,
                  horizontal: Sizes.size20,
                ),
                child: GestureDetector(
                  onTap: () => _onMoveTest(context),
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
            ],
          ),
        ),
      ),
    );
  }
}
