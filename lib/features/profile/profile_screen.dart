import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomad_flutter_twitter/constants/gaps.dart';
import 'package:nomad_flutter_twitter/constants/sizes.dart';
import 'package:nomad_flutter_twitter/features/post/post_bottom_sheet.dart';
import 'package:nomad_flutter_twitter/features/profile/setting_screen.dart';

class Post {
  final int userId;
  final String name;
  final String content;
  final String profileImg;
  final List<String> img;

  Post({
    required this.userId,
    required this.name,
    required this.content,
    required this.profileImg,
    required this.img,
  });
}

/// dumyy data
List<Post> Posts = [
  Post(
    userId: 1,
    name: "jane_mobbin",
    content: "Give @john_mobbin a follow if",
    profileImg: "https://avatars.githubusercontent.com/u/40009719?v=4",
    img: [],
  ),
  Post(
    userId: 2,
    name: "bbong",
    content: "I like you, too",
    profileImg: "https://avatars.githubusercontent.com/u/40009719?v=4",
    // profileImg: "",
    img: [
      "https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80",
      "https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80"
    ],
  ),
  Post(
    userId: 3,
    name: "seul",
    content: "I like you, all",
    profileImg: "https://avatars.githubusercontent.com/u/40009719?v=4",
    // profileImg: "",
    img: [
      "https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80",
    ],
  ),
];

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

//ListView는 각 항목의 높이가 다를 때 유용하며, GridView는 모든 항목이 동일한 크기를 가질 때 잘 작동합니다.
class _ProfileScreenState extends State<ProfileScreen> {
  /// 상단의 Tab List, List는 인덱스를 가지는 배열 형태의 Collection입니다.
  final List<Map<String, String>> _topTabs = [
    {"key": "Threads", "type": "Threads"},
    {"key": "Replies", "type": "Replies"},
  ];

  ///상단의 Tab List 선택 index
  int _selectIndex = 0;

  ///Tab 선택시 index값 변경으로 어떤 Tab인지 구별함
  void _onTopTabs(value) {
    setState(() {
      _selectIndex = value;
    });
  }

  void _onMoveSetting(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SettingScreen(),
      ),
    );
  }

  ///comments 아이콘 누르면 실행되는 함수
  void _onCommentsTap(BuildContext context) async {
    ///밑에서부터 올라오는 모달창 (모달밖은 저절로 회색으로 흐려짐)
    await showModalBottomSheet(
      context: context,

      /// bottom sheet의 사이즈를 바꿀 수 있게 해줌, (listView를 사용할거면 true)
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const PostBottomSheet(),
    );
  }

  final logoImage = 'assets/images/twitter_logo.png';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _topTabs.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size14,
            horizontal: Sizes.size10,
          ),
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.globe,
                    ), // This will be on the left
                    Row(
                      // This row will be on the right
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.instagram,
                        ),
                        Gaps.h20,
                        GestureDetector(
                          onTap: () => _onMoveSetting(context),
                          child: const FaIcon(
                            FontAwesomeIcons.gripLines,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Gaps.v20,
              ListTile(
                title: const Text(
                  "Joker",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Sofreware Engineer",
                          style: TextStyle(
                            fontSize: Sizes.size14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        Chip(
                          backgroundColor: Colors.grey,
                          label: Text(
                            "threads.net",
                            style: TextStyle(
                              fontSize: Sizes.size10,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Text("No Follower"),
                  ],
                ),
                trailing: const CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/40009719?v=4",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(
                  Sizes.size10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: Sizes.size12,
                        horizontal: Sizes.size44,
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
                        "Edit Profile",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: Sizes.size12,
                        horizontal: Sizes.size40,
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
                        "Share profile",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TabBar(
                onTap: _onTopTabs,

                /// splash 옵션 조절, tab눌렀을때 반짝거리지 않게 하려면 NoSplash
                splashFactory: NoSplash.splashFactory,
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size20,
                ),

                /// false면 Tab들이 label이 생략됨 (ex: Users가 us 까지만 나옴)
                isScrollable: false,

                /// Label에 TextStyle을 줄 수 있음
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: Sizes.size16,
                ),
                labelColor: Colors.black, //선택된 Tab Color
                indicatorColor: Colors.black, //선택된 Tab의 바닥 Color
                unselectedLabelColor: Colors.grey.shade500, //선택되지 않은 Tab Color
                tabs: [
                  /// 리스트 반복문은 for in 사용
                  for (var tab in _topTabs)
                    Tab(
                      text: tab['key'],
                    ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: Posts.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(Sizes.size10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(Posts[index].profileImg),
                                ),
                                Gaps.h10,
                                Column(
                                  //Column은 기본적인 정렬방식이 세로축 중앙이다.
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          Posts[index].name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Gaps.v10,
                                    Text(
                                      Posts[index].content,
                                    ),
                                  ],
                                ),

                                const Spacer(), // This will take up all remaining space in the row
                                Gaps.h10,
                                const Text(
                                  "2h",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Gaps.h10,
                                GestureDetector(
                                  onTap: () => _onCommentsTap(context),
                                  child: const FaIcon(
                                    FontAwesomeIcons.ellipsis,
                                  ),
                                ),

                                Gaps.h10,
                              ],
                            ),
                            Gaps.v10,
                            if (Posts[index].img.isNotEmpty)
                              AspectRatio(
                                aspectRatio: 2 / 1,
                                child: Posts[index].img.length > 1
                                    ? ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: Posts[index].img.length,
                                        itemBuilder: (context, i) => Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10.0),
                                          child: AspectRatio(
                                            aspectRatio: 2 / 1,
                                            child: Image.network(
                                                Posts[index].img[i],
                                                fit: BoxFit.fill),
                                          ),
                                        ),
                                      )
                                    : Image.network(Posts[index].img[0],
                                        fit: BoxFit.fill),
                              ),
                            Gaps.v10,
                            Row(
                              children: const [
                                FaIcon(
                                  FontAwesomeIcons.heart,
                                ),
                                Gaps.h10,
                                FaIcon(
                                  FontAwesomeIcons.comment,
                                ),
                                Gaps.h10,
                                FaIcon(
                                  FontAwesomeIcons.recycle,
                                ),
                                Gaps.h10,
                                FaIcon(
                                  FontAwesomeIcons.paperPlane,
                                )
                              ],
                            ),
                            Gaps.v10,
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
