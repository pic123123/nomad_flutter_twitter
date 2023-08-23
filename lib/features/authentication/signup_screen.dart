import 'package:flutter/material.dart';
import 'package:nomad_flutter_twitter/common/widgets/form_button.dart';
import 'package:nomad_flutter_twitter/constants/gaps.dart';
import 'package:nomad_flutter_twitter/constants/sizes.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

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

  @override
  void initState() {
    super.initState();
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

  void _onMoveTestScreen(context) {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();

        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const CustomizeExperienceScreen(),
        //   ),
        // );
      }
    }
  }

  ///마지막 실행, 모든게 다끝날때
  @override
  Future<void> dispose() async {
    void dispose() {
      _nameController.dispose();
      _emailController.dispose();
      _birthController.dispose();
      super.dispose();
    }
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
                            controller: _birthController,
                            decoration: InputDecoration(
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
                          Gaps.v28,
                          GestureDetector(
                            onTap: () => _onMoveTestScreen(context),
                            child: FormButton(
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
            )),
          ],
        ),
      ),
    );
  }
}
