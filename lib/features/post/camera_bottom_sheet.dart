import 'package:flutter/material.dart';
import 'package:nomad_flutter_twitter/constants/sizes.dart';
import 'package:image_picker/image_picker.dart';

class CameraBottomSheet extends StatefulWidget {
  const CameraBottomSheet({Key? key}) : super(key: key);

  @override
  State<CameraBottomSheet> createState() => _CameraBottomSheetState();
}

class _CameraBottomSheetState extends State<CameraBottomSheet> {
  XFile? _image; //이미지를 담을 변수 선언
  final ImagePicker picker = ImagePicker(); //ImagePicker 초기화

  //이미지를 가져오는 함수
  Future getImage(ImageSource imageSource) async {
    //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        _image = XFile(pickedFile.path); //가져온 이미지를 _image에 저장
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.20,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size14),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        // appBar: AppBar(
        //   backgroundColor: Colors.grey.shade50,
        //   automaticallyImplyLeading: false,
        // ),
        body: Padding(
          padding: const EdgeInsets.all(Sizes.size20),
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text('사진 촬영하기'),
                onTap: () => getImage(ImageSource.camera),
              ),
              const Divider(color: Colors.black26, thickness: 1),
              ListTile(
                leading: const Icon(Icons.photo_size_select_actual_outlined),
                title: const Text('사진 선택하기'),
                onTap: () => getImage(ImageSource.gallery),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
