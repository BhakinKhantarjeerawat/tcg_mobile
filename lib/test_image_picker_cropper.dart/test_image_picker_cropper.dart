import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class TestImagePickerCropper extends ConsumerStatefulWidget {
  const TestImagePickerCropper({super.key});
  static const id = 'set_photo_screen';
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TestImagePickerCropperState();
}

class _TestImagePickerCropperState extends ConsumerState<TestImagePickerCropper> {
  File? _image;

  Future _pickImage(ImageSource source) async {
    try{
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    File? img = File(image.path);
    setState(() {
      _image = img;
    });
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      Navigator.of(context).pop();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
height: 200.0,
width: 200.0,
decoration: BoxDecoration(
  shape: BoxShape.circle,
  color: Colors.grey.shade200,
),
child: Center(
  child: _image == null
  ? const Text(
    'No image selected',
    style: TextStyle(fontSize: 20),
  ) : CircleAvatar(
    backgroundImage: FileImage(_image!),
    radius: 200.0,
  )
) 
    ));
  }
}