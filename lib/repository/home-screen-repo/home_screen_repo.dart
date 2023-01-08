import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:snappyaudio/repository/home-screen-repo/list_entity.dart';

class HomeScreenRepo {
  static Future uploadFormData(
    File image,
  ) async {
    final storage = FirebaseStorage.instance;
    ListEntity listEntity;
    final imgName = DateTime.now().millisecondsSinceEpoch;
    final ref = await storage.ref('profile/$imgName').putFile(image);
    String imgUrl = await storage.ref('profile/$imgName').getDownloadURL();
    log(imgUrl);

    final firebaseFireStore = FirebaseFirestore.instance;
    listEntity = ListEntity(
      imgUrl: imgUrl,
    );

    ///This function will be uploadind the entered data of screen 1 on FB
    await firebaseFireStore
        .collection('Images')
        .doc()
        .set(listEntity.toJson())
        .whenComplete(
          () => log("Uploaded Successfull"),
        );
  }

  static Stream<List<ListEntity>> getFormData() {
    final firebaseStore = FirebaseFirestore.instance;
    List<ListEntity> listEntity = [];
    return firebaseStore.collection("Images").snapshots().map((event) {
      for (var element in event.docs) {
        listEntity.add(ListEntity.fromJson(element.data()));
      }
      return listEntity;
    });
  }
}
