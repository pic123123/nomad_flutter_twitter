import 'package:flutter/cupertino.dart';
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
    name: "rjmihun",
    content: "Mithun",
    profileImg: "https://avatars.githubusercontent.com/u/40009719?v=4",
    followers: "26.6",
    img: [],
  ),
  User(
    userId: 2,
    name: "vicenews",
    content: "VICE News",
    profileImg: "https://avatars.githubusercontent.com/u/40009719?v=4",
    followers: "301",
    img: [
      "https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80",
      "https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80"
    ],
  ),
  User(
    userId: 3,
    name: "trevornoah",
    content: "Trevor Noah",
    profileImg: "https://avatars.githubusercontent.com/u/40009719?v=4",
    followers: "2789",
    img: [
      "https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80",
    ],
  ),
  User(
    userId: 4,
    name: "joker",
    content: "jajajaja",
    profileImg: "https://avatars.githubusercontent.com/u/40009719?v=4",
    followers: "5",
    img: [],
  ),
  User(
    userId: 5,
    name: "joker2",
    content: "hohoho",
    profileImg: "https://avatars.githubusercontent.com/u/40009719?v=4",
    followers: "36.8",
    img: [
      "https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80",
      "https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80"
    ],
  ),
  User(
    userId: 6,
    name: "joker3",
    content: "hehehe",
    profileImg: "https://avatars.githubusercontent.com/u/40009719?v=4",
    followers: "221",
    img: [
      "https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80",
    ],
  ),
];

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

  final TextEditingController _textEditingController =
      TextEditingController(text: "Search");

  ///검색창에 입력되는 값
  void _onSearchChanged(String value) {
    print(value);
  }

  ///검생창에서 keyboard로 search 눌러서 전송하는 값
  void _onSearchSubmitted(String value) {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 1,

      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size20,
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
                  "Search",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v10,
                CupertinoSearchTextField(
                  controller: _textEditingController,
                  onChanged: _onSearchChanged,
                  onSubmitted: _onSearchSubmitted,
                ),
                Gaps.v20,
                ListView.builder(
                  shrinkWrap: true, // new line
                  itemCount: Users.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(Users[index].profileImg),
                      ),
                      title: Text(
                        Users[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // left align text
                        children: <Widget>[
                          Text(Users[index].content),
                          Gaps.v5,
                          Text(
                            '${Users[index].followers}K followers',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    );
                    // return Card(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(Sizes.size10),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Row(
                    //           children: [
                    //             CircleAvatar(
                    //               backgroundImage:
                    //                   NetworkImage(Users[index].profileImg),
                    //             ),
                    //             Gaps.h10,
                    //             Column(
                    //               //Column은 기본적인 정렬방식이 세로축 중앙이다.
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               children: [
                    //                 Row(
                    //                   children: [
                    //                     Text(
                    //                       Users[index].name,
                    //                       style: const TextStyle(
                    //                         fontWeight: FontWeight.bold,
                    //                       ),
                    //                     ),
                    //                     Gaps.h10,
                    //                     FaIcon(
                    //                       FontAwesomeIcons.solidCircleCheck,
                    //                       size: Sizes.size20,
                    //                       color: Colors.blue[400],
                    //                     ),
                    //                   ],
                    //                 ),
                    //                 Gaps.v10,
                    //                 Text(
                    //                   Users[index].content,
                    //                 ),
                    //               ],
                    //             ),

                    //             const Spacer(), // This will take up all remaining space in the row
                    //             Gaps.h10,
                    //             const Text(
                    //               "2h",
                    //               style: TextStyle(
                    //                 fontWeight: FontWeight.w300,
                    //               ),
                    //             ),
                    //             Gaps.h10,
                    //             GestureDetector(
                    //               onTap: null,
                    //               child: const FaIcon(
                    //                 FontAwesomeIcons.ellipsis,
                    //               ),
                    //             ),

                    //             Gaps.h10,
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
