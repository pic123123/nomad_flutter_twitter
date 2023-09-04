import 'package:flutter/material.dart';
import 'package:nomad_flutter_twitter/constants/gaps.dart';
import 'package:nomad_flutter_twitter/constants/sizes.dart';

class User {
  final int userId;
  final String name;
  final String content;
  final String profileImg;
  final String followers;
  final List<String> img;

  User({
    required this.userId,
    required this.name,
    required this.content,
    required this.profileImg,
    required this.followers,
    required this.img,
  });
}

/// dumyy data
List<User> Users = [
  User(
    userId: 1,
    name: "john_mobbin",
    content: "hahaha",
    profileImg: "https://avatars.githubusercontent.com/u/40009719?v=4",
    followers: "love botany",
    img: [],
  ),
  User(
    userId: 2,
    name: "john_mobbin",
    content: "Mentioned you",
    profileImg:
        "https://img.khan.co.kr/news/2023/05/12/news-p.v1.20230512.e5fffd99806f4dcabd8426d52788f51a_P1.webp",
    followers: "Here's a thread you",
    img: [
      "https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80",
      "https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80"
    ],
  ),
  User(
    userId: 3,
    name: "김민지",
    content: "Starting out my gardening club with thre",
    profileImg:
        "https://img.allurekorea.com/allure/2023/02/style_63fc43878c1d4.jpg",
    followers: "Count me in",
    img: [
      "https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80",
    ],
  ),
  User(
    userId: 4,
    name: "이상혁",
    content: "followed you",
    profileImg:
        "https://news.koreadaily.com/data/photo/2023/08/10/202308101910774330_64d4b847390ce.jpg",
    followers: "wow",
    img: [],
  ),
  User(
    userId: 5,
    name: "주현영",
    content: "Definitely broken!",
    profileImg:
        "https://i.namu.wiki/i/Q-H__TaLXLw46znEdazfhjkADpqgnKQ2b8ydT_EdflBLFRbc2680Gp_R1BflBBJoJEKty2CZbfohN3p1tAqZZQ.webp",
    followers: "hello",
    img: [
      "https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80",
      "https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80"
    ],
  ),
];

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  final logoImage = 'assets/images/twitter_logo.png';

  /// 상단의 Tab List, List는 인덱스를 가지는 배열 형태의 Collection입니다.
  final List<Map<String, String>> _topTabs = [
    {"key": "All", "type": "All"},
    {"key": "Replies", "type": "Replies"},
    {"key": "Mensions", "type": "Mensions"},
    {"key": "Vebie", "type": "Vebie"},
    {"key": "Colaboration", "type": "Colaboration"},
    {"key": "React", "type": "React"},
    {"key": "Spring", "type": "Spring"},
  ];

  ///상단의 Tab List 선택 index
  int _selectIndex = 0;

  ///Tab 선택시 index값 변경으로 어떤 Tab인지 구별함
  void _onTopTabs(value) {
    setState(() {
      _selectIndex = value;
    });
  }

  // final TextEditingController _textEditingController =
  //     TextEditingController(text: "Search");

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _topTabs.length,
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 1,

        // ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size14,
            vertical: Sizes.size10,
          ),
          child: SafeArea(
            /// Center Widget : 모든것을 가운데로 정렬
            child: Center(
              child: Column(
                /// mainAxisAlignment : MainAxisAlignment.start 세로축 맨위부터 시작
                mainAxisAlignment: MainAxisAlignment.start,

                /// 가로측 맨 왼쪽부터 시작
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Activity",
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v10,
                  TabBar(
                    onTap: _onTopTabs,

                    /// splash 옵션 조절, tab눌렀을때 반짝거리지 않게 하려면 NoSplash
                    splashFactory: NoSplash.splashFactory,

                    /// false면 Tab들이 label이 생략됨 (ex: Users가 us 까지만 나옴)
                    isScrollable: true,
                    //dividerColor: Colors.black,

                    /// Label에 TextStyle을 줄 수 있음
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: Sizes.size16,
                      // color: Colors.black,
                    ),
                    indicator: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: Sizes.size1,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          Sizes.size14,
                        ),
                      ),
                      color: Colors.black,
                    ),
                    indicatorColor: Colors.black, //선택된 Tab의 바닥 Color
                    labelColor: Colors.white, //선택된 Tab Color
                    unselectedLabelColor:
                        Colors.grey.shade500, //선택되지 않은 Tab Color
                    tabs: [
                      /// 리스트 반복문은 for in 사용
                      for (var tab in _topTabs)
                        Tab(
                          text: tab['key'],
                        ),
                    ],
                  ),
                  Gaps.v20,

                  /// Flutter에서 Column 위젯은 자식들을 세로 방향으로 배치하며, 가능한 모든 공간을 차지하려고 합니다.
                  /// 따라서 ListView가 Column의 자식으로 있을 때, ListView는 무한대의 공간이 주어진 것처럼 인식하고,
                  /// 그에 따라 오버플로우가 발생할 수 있습니다.
                  /// 이 문제를 해결하기 위해선, Expanded 위젯을 사용하여 남아있는 공간에 대한 제어권을 Flutter에게 주면 됩니다.

                  Expanded(
                    ///ListView.builder에서 각 항목 사이에 Divider를 추가하려면 ListView.separated를 사용할 수 있습니다.
                    ///이는 각 항목 사이에 분리자를 삽입하는 기능을 제공합니다.
                    child: ListView.separated(
                      shrinkWrap: true, // new line
                      itemCount: Users.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(Users[index].profileImg),
                          ),
                          title: Row(
                            children: [
                              Text(
                                Users[index].name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Gaps.h10,
                              const Text(
                                "2h",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start, // left align text
                            children: <Widget>[
                              Text(Users[index].content),
                              Gaps.v5,
                              Text(
                                Users[index].followers,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                          trailing: Visibility(
                            visible: Users[index].userId == 5 ||
                                Users[index].userId == 2,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: Sizes.size8,
                                horizontal: Sizes.size20,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(
                                  Sizes.size10,
                                ),
                              ),
                              child: const Text(
                                "Following",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        );
                      },

                      separatorBuilder: (context, index) => const Divider(
                        color: Colors.black26,
                        thickness: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
