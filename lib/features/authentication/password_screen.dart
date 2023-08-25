import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomad_flutter_twitter/common/widgets/form_button.dart';
import 'package:nomad_flutter_twitter/constants/gaps.dart';
import 'package:nomad_flutter_twitter/constants/sizes.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final logoImage = 'assets/images/twitter_logo.png';

  bool _obscureText = true;
  void _onMoveSignupScreen(context) {
    if (!_isPasswordValid()) return;
    print("111");
  }

  final TextEditingController _passwordController =
      TextEditingController(text: "");

  String _password = "";

  /// 비밀번호 입력값 초기화
  void _onClearTap() {
    _passwordController.clear();
  }

  /// 비밀번호 hide
  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  /// 비밀번호 유효성 검사
  bool _isPasswordValid() {
    return _passwordController.text.isNotEmpty &&
        _passwordController.text.length > 8;
  }

  @override
  void initState() {
    //위젯과 그 상태를 초기화할때 제일처음 호출한다.
    super.initState();
    _passwordController.addListener(
      () {
        // print(_passwordController.text);
        setState(() {
          _password = _passwordController.text;
        });
      },
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
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
                "You'll need a password",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Gaps.v20,
              const Text(
                "Make sure it's 8 characters or more.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Gaps.v20,
              // TextField는 입력을 위한 아주좋은 위젯,컨트롤,커스톰도 가능
              // 폼에 좀더 강력한 유효성 검사가 필요, 입력칸이 1개가 아니라면 다른 위젯을 사용할꺼임
              TextField(
                controller: _passwordController,

                /// 비밀번호처럼 ***으로 보이게함
                obscureText: _obscureText,
                decoration: InputDecoration(
                  //mainAxisSize row가 맨왼쪽에 위치하고 오른쪽의 남은 공간을 차지하는걸 방지, 자기한테 필요한 공간만 가진다(맨오른쪽)
                  suffix: Row(mainAxisSize: MainAxisSize.min, children: [
                    GestureDetector(
                      onTap: _onClearTap,
                      child: FaIcon(
                        FontAwesomeIcons.solidCircleXmark,
                        color: Colors.grey.shade500,
                        size: Sizes.size20,
                      ),
                    ),
                    Gaps.h16,
                    GestureDetector(
                      onTap: _toggleObscureText,
                      child: FaIcon(
                        _obscureText
                            ? FontAwesomeIcons.eye
                            : FontAwesomeIcons.eyeSlash,
                        color: Colors.grey.shade500,
                        size: Sizes.size20,
                      ),
                    )
                  ]),
                  // prefixIcon: const Icon(Icons.ac_unit), //맨앞(왼쪽)
                  // suffixIcon: const Icon(Icons.access_alarm_outlined), //맨뒤(오른쪽)
                  hintText: "Password",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v10,

              const Text(
                "Your password must have:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: Sizes.size20,
                    color: _isPasswordValid() ? Colors.green : Colors.red,
                  ),
                  Gaps.h5,
                  const Text("8 to 20 characters"),
                ],
              ),

              const Spacer(), // 버튼 하단 고정된 화면을 구현하고자 한다면 Spacer 위젯이 가장 간단하게 구현가능함

              GestureDetector(
                onTap: () => _onMoveSignupScreen,
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
                    disabled: !_isPasswordValid(),
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
