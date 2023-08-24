import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nomad_flutter_twitter/common/widgets/form_button.dart';
import 'package:nomad_flutter_twitter/constants/gaps.dart';
import 'package:nomad_flutter_twitter/constants/sizes.dart';
import 'package:nomad_flutter_twitter/features/authentication/customize_experience_screen.dart';

class SignupScreen extends StatefulWidget {
  final bool? switchButton;
  const SignupScreen({
    this.switchButton,
    Key? key,
  }) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final logoImage = 'assets/images/twitter_logo.png';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> formData = {};

  final TextEditingController _nameController = TextEditingController(text: "");
  final TextEditingController _emailController =
      TextEditingController(text: "");
  final TextEditingController _birthController =
      TextEditingController(text: "");

  String _name = "";
  String _email = "";
  String _birth = "";

  late final FocusNode _birthFocusNode;
  late bool _isBirthFocused = false;

  DateTime now = DateTime.now(); //2023-02-13 22:49:54.767060
  DateTime initDate = DateTime.now().subtract(const Duration(days: 4380));

  bool? localSwitchButton;

  @override
  void initState() {
    super.initState();
    localSwitchButton = widget.switchButton ?? false;
    _birthFocusNode = FocusNode();
    _birthFocusNode.addListener(
      () {
        if (_birthFocusNode.hasFocus != _isBirthFocused) {
          setState(() {
            _isBirthFocused = !_isBirthFocused;
          });
        }
      },
    );
    _setTextFieldDateBirthday(initDate);
    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
    _birthController.addListener(() {
      setState(() {
        _birth = _birthController.text;
      });
    });
  }

  ///생일 선택시 string으로 controller 입력
  void _setTextFieldDateBirthday(DateTime date) {
    final textDate = date.toString().split(" ").first;
    //controller에 값을 설정하는법
    _birthController.value = TextEditingValue(text: textDate);
  }

//스크린 이동
  void _onMoveTestScreen(context) async {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();

        if (!localSwitchButton!) {
          bool? result = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const CustomizeExperienceScreen()),
          );

          setState(() {
            localSwitchButton = result;
          });
        }
      }
    }
  }

  ///마지막 실행, 모든게 다끝날때
  @override
  Future<void> dispose() async {
    _birthFocusNode.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _birthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Image.asset(
                  logoImage,
                  width: 30, // 원하는 너비로 설정
                  height: 30, // 원하는 높이로 설정
                ),
                const SizedBox(width: 30), // 중앙 정렬 위한 SizedBox
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size40,
                  vertical: Sizes.size20,
                ),
                child: Center(
                  child: Column(
                    children: [
                      Gaps.v40,
                      const Text(
                        "Create your account",
                        style: TextStyle(
                          fontSize: Sizes.size24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Gaps.h16,
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Gaps.v28,
                            TextFormField(
                              controller: _nameController,
                              // autovalidateMode:
                              //     AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                suffixIcon: _name.isNotEmpty
                                    ? const Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                      )
                                    : null,
                                hintText: 'Name',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value != null && value.isEmpty) {
                                  return "Please enter your name.";
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                if (newValue != null) {
                                  formData['name'] = newValue;
                                }
                              },
                            ),
                            Gaps.v16,
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                suffixIcon: _email.isNotEmpty
                                    ? const Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                      )
                                    : null,
                                hintText: 'Email address',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value != null && value.isEmpty) {
                                  return "Please enter your email address.";
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                if (newValue != null) {
                                  formData['email'] = newValue;
                                }
                              },
                            ),
                            Gaps.v16,
                            TextFormField(
                              focusNode: _birthFocusNode,
                              controller: _birthController,
                              decoration: InputDecoration(
                                suffixIcon: _birth.isNotEmpty
                                    ? const Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                      )
                                    : null,
                                hintText: 'Date of birth',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value != null && value.isEmpty) {
                                  return "Please enter your Date of birth.";
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                if (newValue != null) {
                                  formData['birth'] = newValue;
                                }
                              },
                            ),
                            Gaps.v20,
                            if (_isBirthFocused && localSwitchButton == false)
                              const Text(
                                  "This will bot be shown publicly, Confirm your own age, even if this account is for a business, a pet, or something else."),
                            Gaps.v20,
                            if (localSwitchButton ?? false)
                              const Text(
                                "By signing up, you agree to our Terms, Privacy Policy, and Cookie Use. Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy. Learn more, Others will be able to find you by email or phone number, when provided, unless you choose otherwise here",
                              ),
                            if (localSwitchButton == true ? false : true)
                              SizedBox(
                                height: 120,
                                child: CupertinoDatePicker(
                                  maximumDate: now,
                                  initialDateTime: initDate,
                                  onDateTimeChanged: _setTextFieldDateBirthday,
                                  mode: CupertinoDatePickerMode.date,
                                ),
                              ),
                            Gaps.v96,
                            GestureDetector(
                              onTap: () => _onMoveTestScreen(context),
                              child: FormButton(
                                text: localSwitchButton == true
                                    ? "SignUp"
                                    : "Next",
                                disabled: !(_name.isNotEmpty &&
                                    _email.isNotEmpty &&
                                    _birth.isNotEmpty),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
