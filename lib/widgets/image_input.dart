import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as systemPath;

class ImageInput extends StatefulWidget {
  final Function takeSavedImage;

  const ImageInput(
    this.takeSavedImage, {
    Key? key,
  }) : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _imageFile;

  void _takePicture() async {
    final imagePicker = ImagePicker();
    final photo =
        await imagePicker.pickImage(maxWidth: 600, source: ImageSource.camera);

    if (photo != null) {
      setState(() {
        _imageFile = File(photo.path);
      });

      final pathProvider = await systemPath.getApplicationDocumentsDirectory();
      final fileName = path.basename(photo.path);
      final savedImage =
          await _imageFile!.copy("${pathProvider.path}/$fileName");
      widget.takeSavedImage(savedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          alignment: Alignment.center,
          child: _imageFile != null
              ? Image.file(
                  _imageFile!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text("Rasm yo'q"),
        ),
        TextButton.icon(
          onPressed: _takePicture,
          icon: Icon(Icons.camera_alt_outlined),
          label: Text(
            "Rasm Yuklash",
          ),
        ),
      ],
    );
  }
}
