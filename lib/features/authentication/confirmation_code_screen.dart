import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:nomad_flutter_twitter/common/widgets/form_button.dart';
import 'package:nomad_flutter_twitter/constants/gaps.dart';
import 'package:nomad_flutter_twitter/constants/sizes.dart';

class ConfirmationCodeScreen extends StatefulWidget {
  const ConfirmationCodeScreen({super.key});

  @override
  State<ConfirmationCodeScreen> createState() => _ConfirmationCodeScreenState();
}

class _ConfirmationCodeScreenState extends State<ConfirmationCodeScreen> {
  final logoImage = 'assets/images/twitter_logo.png';

  late bool switchButton = false;

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  void _onMoveSignupScreen(context) {
    print("111");
    //print(switchButton);
    //Navigator.of(context).pop(switchButton);
  }

  /// 모든 컨트롤러(6자리 숫자)에 값이 입력되면 true 아니면 false
  bool isInputComplete() {
    // Check if all text controllers have non-empty text
    return _controllers.every((controller) => controller.text.isNotEmpty);
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonDisabled = !isInputComplete();

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
                "We send you a code",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Gaps.v20,
              const Text(
                "Enter it below to verify",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Text(
                "jhon.mobbin@gmail.com.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Gaps.v20,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: FormBuilder(
                  key: _formKey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      6,
                      (index) => SizedBox(
                        width: 40,
                        child: TextFormField(
                          controller: _controllers[index],
                          focusNode: _focusNodes[index],
                          maxLength: 1,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 8),
                            counterText: "",
                            border: UnderlineInputBorder(),
                          ),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: Sizes.size20,
                            fontWeight: FontWeight.bold,
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty && index < 5) {
                              _controllers[index + 1].clear();
                              FocusScope.of(context)
                                  .requestFocus(_focusNodes[index + 1]);
                            }
                            setState(() {
                              isButtonDisabled = !isButtonDisabled;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Gaps.v20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  !isButtonDisabled
                      ? const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        )
                      : const SizedBox
                          .shrink(), // Hide the icon when not needed
                ],
              ),
              const Spacer(), // 버튼 하단 고정된 화면을 구현하고자 한다면 Spacer 위젯이 가장 간단하게 구현가능함
              Text(
                "Didn't receive email?",
                style: TextStyle(
                  fontSize: Sizes.size18,
                  color: Colors.blue[400],
                ),
              ),
              Gaps.v10,
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
                    disabled: isButtonDisabled,
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
