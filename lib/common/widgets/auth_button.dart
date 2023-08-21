import 'package:flutter/material.dart';
import 'package:nomad_flutter_twitter/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key});

  ///social login 시작, google,apple,kakao
  void _socialLogin() {
    print("ads");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _socialLogin(),
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
          children: const [
            // Align -> Stack에 있는 Widget 하나의 정렬만 바꿀 수 있게 해줌
            Align(alignment: Alignment.centerLeft),
            //Expanded : Row나 Column 내에서 사용할 수 있는 만큼 공간을 전부 차지하는 위젯
            Text(
              "asd",
              style: TextStyle(
                color: Colors.white,
                fontSize: Sizes.size14,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
