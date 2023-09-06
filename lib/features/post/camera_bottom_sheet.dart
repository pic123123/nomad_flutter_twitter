import 'dart:html';

import 'package:flutter/material.dart';
import 'package:nomad_flutter_twitter/constants/sizes.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

class CameraBottomSheet extends StatefulWidget {
  const CameraBottomSheet({Key? key}) : super(key: key);

  @override
  State<CameraBottomSheet> createState() => _CameraBottomSheetState();
}

class _CameraBottomSheetState extends State<CameraBottomSheet> {
  File? _imageFile;

  void _onCamera(BuildContext context) async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => CameraScreen(camera: firstCamera),
    //   ),
    // );
  }

  void _onPhoto(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      setState(() {
        _imageFile = photo.path;
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
                onTap: () => _onCamera(context),
              ),
              const Divider(color: Colors.black26, thickness: 1),
              ListTile(
                leading: const Icon(Icons.photo_size_select_actual_outlined),
                title: const Text('사진 선택하기'),
                onTap: () => _onPhoto(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
