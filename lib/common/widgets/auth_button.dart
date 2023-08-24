import 'package:flutter/material.dart';
import 'package:nomad_flutter_twitter/constants/sizes.dart';
import 'package:nomad_flutter_twitter/features/authentication/signup_screen.dart';

class AuthButton extends StatelessWidget {
  final String text;
  const AuthButton({
    super.key,
    required this.text,
  });

//dart는 private,protected,publid 이라는 개념이 없다.
//dart에서 method나 property를 private로 하는 유일한 방법은 _ 다
  void _onMoveSignUpScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SignupScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onMoveSignUpScreen(context),
      child: Container(
        // vertical : 수직(세로)
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size14,
          horizontal: Sizes.size14,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              Sizes.size12,
            ),
          ),
          color: Colors.black,
          border: Border.all(
            color: Colors.grey.shade300,
            width: Sizes.size1,
          ),
        ),
        child: Stack(
          // Column -> 세로로 배치
          // Row -> 가로로 배치
          // Stack -> 위젯들을 위에다가 쌓을 수 있게함 (팬케이크 or 카드)
          alignment: Alignment.center,
          children: [
            // Align -> Stack에 있는 Widget 하나의 정렬만 바꿀 수 있게 해줌
            const Align(alignment: Alignment.centerLeft),
            //Expanded : Row나 Column 내에서 사용할 수 있는 만큼 공간을 전부 차지하는 위젯
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: Sizes.size16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
