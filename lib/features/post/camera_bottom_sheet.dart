import 'package:camera/camera.dart';
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
  late CameraController controller;
  List<CameraDescription> cameras = [];

  @override
  void initState() {
    super.initState();
    initCameras();
  }

  void initCameras() async {
    // cameras = await availableCameras();

    // controller = CameraController(
    //   cameras[0],
    //   ResolutionPreset.medium,
    // );

    // controller.initialize().then((_) {
    //   if (!mounted) return;
    //   setState(() {});
    // });
  }

  Future<void> capturePicture() async {
    try {
      // final path =
      //     join((await getTemporaryDirectory()).path, '${DateTime.now()}.png');
      // await controller.takePicture(path);
      // setState(() {
      //   _image = XFile(path);
      // });
    } catch (e) {
      print(e);
    }
  }

// 이미지 가져오기 함수 수정
  Future getImage(ImageSource imageSource) async {
    if (imageSource == ImageSource.camera) {
      // If the source is the camera, then use the camera package to take a photo.
      capturePicture();
    } else {
      // Otherwise use the image picker to select a photo from the gallery.
      final XFile? pickedFile = await picker.pickImage(source: imageSource);
      if (pickedFile != null) {
        setState(() {
          _image = XFile(pickedFile.path); //가져온 이미지를 _image에 저장
        });
        return _image; //PostScreen으로 반환하기위해 Return이 필요함
      }
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
                onTap: () async {
                  final selectedImage = await getImage(ImageSource.camera);
                  Navigator.pop(context, selectedImage);
                },
              ),
              const Divider(color: Colors.black26, thickness: 1),
              ListTile(
                leading: const Icon(Icons.photo_size_select_actual_outlined),
                title: const Text('사진 선택하기'),
                onTap: () async {
                  final selectedImage = await getImage(ImageSource.gallery);
                  Navigator.pop(context, selectedImage);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
