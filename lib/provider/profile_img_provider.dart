import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../services/firebase_detail.dart';

class ProfileImgProvider extends ChangeNotifier {
  final ImagePicker _picker = ImagePicker();
  File picture = File("");
  imgTanla() async {
    final XFile? image =
        await _picker.pickImage(source: ImageSource.gallery).then((value) {
      picture = File(value!.path);
      FireBaseServiceDetail.storage
          .ref("/profileImg/${picture.path.split("/").last}")
          .putFile(picture)
          .then((p0) async {
        String url = await p0.ref.getDownloadURL();
        FireBaseServiceDetail.firebaseFirestore
            .doc("/Users/${FireBaseServiceDetail.authUser.currentUser!.email}")
            .update({"img": url});
      });
    });
    notifyListeners();
  }
}
