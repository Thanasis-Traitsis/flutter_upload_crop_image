import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_upload_crop/image_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

File? file;

class _HomeScreenState extends State<HomeScreen> {
  
  Future uploadImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(
      source: source,
    );
    if (image == null) return;

    File imageFile = File(image.path);

    var croppedFile = await cropImage(imageFile);

    setState(() {
      file = croppedFile;
    });
  }

  Future<File?> cropImage(File pickedFile) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );

    if (croppedFile != null) {
      return File(croppedFile.path);
    } else {
      return File(pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageContainer(
              file: file,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 180,
              child: FilledButton(
                onPressed: () {
                  uploadImage(ImageSource.gallery);
                },
                child: const Text('Pick from Gallery'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 180,
              child: FilledButton(
                onPressed: () {
                  uploadImage(ImageSource.camera);
                },
                child: const Text('Pick from Camera'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
