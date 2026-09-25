import 'dart:io';

import 'package:admin/core/constant/color.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> imageUploadCamera() async {
  final XFile? file = await ImagePicker().pickImage(
    source: ImageSource.camera,
    imageQuality: 90,
  );

  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

Future<File?> fileUploadGallery([isSvg = false]) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions:
        isSvg ? ["svg", "SVG"] : ["png", "PNG", "jpg", "JPG", "jpeg", "JPEG", "gif", "GIF", "bmp", "BMP", "webp", "WEBP", "tiff", "TIFF", "heic", "HEIC",]);

  if (result != null && result.files.isNotEmpty) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}

showbottommenu(imageUploadCamera(), fileUploadGallery()) {
  Get.bottomSheet(
    Directionality(
      textDirection: TextDirection.rtl,
      child: Container(color: Colors.white,
        padding: EdgeInsets.all(10),
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(
                "اختر صورة",
                style: TextStyle(
                  fontSize: 22,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            ListTile(
              onTap: () {
                imageUploadCamera();
                Get.back();
              },
              leading: Icon(Icons.camera_alt, size: 40),
              title: Text("صورة من الكاميرا", style: TextStyle(fontSize: 20)),
            ),Divider(),
            ListTile(
              onTap: () {
                fileUploadGallery();
                Get.back();
              },
              leading: Icon(Icons.image, size: 40),
              title: Text("صورة من الاستديو", style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    ),
  );
}
