import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomad_flutter_twitter/common/widgets/form_button.dart';
import 'package:nomad_flutter_twitter/constants/gaps.dart';
import 'package:nomad_flutter_twitter/constants/sizes.dart';
import 'package:nomad_flutter_twitter/features/post/camera_bottom_sheet.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final TextEditingController _contentsController =
      TextEditingController(text: "");

  String _content = "";

  void _onSave() {
    print("123");
  }

  void _onMoveCameraScreen(BuildContext context) async {
    await showModalBottomSheet(
      context: context,

      /// bottom sheet의 사이즈를 바꿀 수 있게 해줌, (listView를 사용할거면 true)
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const CameraBottomSheet(),
    );
  }

  @override
  Future<void> dispose() async {
    _contentsController.dispose();
    super.dispose();
  }

  bool isInputComplete() {
    // Check if all text controllers have non-empty text
    return _contentsController.text.isNotEmpty;
  }

  @override
  void initState() {
    super.initState();
    _contentsController.addListener(() {
      setState(() {
        _content = _contentsController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.95,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size14),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: Sizes.size12),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          title: const Text(
            'New thread',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Sizes.size16,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(
            Sizes.size20,
          ),
          child: Column(
            children: [
              Row(
                children: const [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/40009719?v=4"),
                  ),
                  Gaps.h10,
                  Text(
                    "Joker",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              TextField(
                controller: _contentsController,
                maxLength: 400,
                maxLines: 20,
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: '내용을 입력해 주세요.',
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: Sizes.size10,
                    horizontal: Sizes.size10,
                  ),
                  prefixIcon: IconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.paperclip,
                      size: Sizes.size20,
                    ),
                    onPressed: () => _onMoveCameraScreen(context),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Sizes.size4),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Sizes.size4),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              GestureDetector(
                onTap: () => _onSave(),
                child: FormButton(
                  disabled: _content.isEmpty ? true : false,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
