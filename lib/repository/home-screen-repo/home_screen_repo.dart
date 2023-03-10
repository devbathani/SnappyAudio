import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
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

    final firebaseFireStore = FirebaseFirestore.instance;
    listEntity = ListEntity(
      imgUrl: imgUrl,
    );

    ///This function will be uploadind the entered data of screen 1 on FB
    await firebaseFireStore
        .collection('Images')
        .doc('uploads')
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

  static Future<http.Response> getImageProcessedData(String url) async {
    log("Url : $url");
    String word = '';
    final imageToTextResponse = await http.get(
      Uri.parse("https://api.apilayer.com/image_to_text/url?url=$url"),
      headers: {"apikey": "uToWG1hI8tJ0llW9aMAY8k7ofD1sQ708"},
    );
    log("imageDataResponse : ${imageToTextResponse.body}");
    word = jsonDecode(imageToTextResponse.body)["all_text"];
    final response = await http.get(
      Uri.parse(
          "https://serpapi.com/search.json?engine=youtube&search_query=$word&api_key=038afa67f517d1f7902306a92cea860a7daeb86690492712e37e7b6cba1ad92d"),
    );

    return response;
  }

  static Future<http.Response> getImageToText(String imageUrl) async {
    log("Url : $imageUrl");

    final imageToTextResponse = await http.get(
      Uri.parse("https://api.apilayer.com/image_to_text/url?url=$imageUrl"),
      headers: {"apikey": "uToWG1hI8tJ0llW9aMAY8k7ofD1sQ708"},
    );
    log("Image To Text Response : ${imageToTextResponse.body}");
    return imageToTextResponse;
  }
}
