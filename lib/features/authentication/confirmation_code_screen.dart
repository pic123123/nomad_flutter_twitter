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

  void _onMoveSignupScreen(context) {
    print("111");
    //print(switchButton);
    //Navigator.of(context).pop(switchButton);
  }

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

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
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(
            Sizes.size20,
          ),
          child: GestureDetector(
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
              child: const FormButton(
                text: "Next",
                disabled: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
