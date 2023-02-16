import 'dart:developer';
import 'dart:io';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snappyaudio/repository/home-screen-repo/google_lens_entity.dart';
import 'package:snappyaudio/repository/home-screen-repo/image_to_text_entity.dart';
import 'package:snappyaudio/repository/home-screen-repo/list_entity.dart';
import 'package:snappyaudio/repository/home-screen-repo/home_screen_repo.dart';
import 'package:snappyaudio/repository/home-screen-repo/youtube_search_entity.dart';

enum Screen1State { normal, loading, succeed }

enum ImageDataState { normal, loading, succeed, error }

class HomeScreenProvider extends ChangeNotifier {
  Screen1State screen1state = Screen1State.normal;
  ImageDataState imageDataState = ImageDataState.normal;
  GoogleLensEntity? googleLensEntity;
  YouTubeSearchEntity? youTubeSearchEntity;
  ImageToTextEntity? imageToTextEntity;
  String errorMessage = '';
  // String image

  File? image;
  final picker = ImagePicker();

  ///Getting Image from camera
  selectImageFromCamera() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {
      log('No Image Selected');
    }
    notifyListeners();
  }

  ///Getting image from gallery
  selectImageFromGallery() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {
      log('No Image Selected');
    }
    imageDataState = ImageDataState.normal;
    notifyListeners();
  }

  ///Function to data data in Screen 1 repo function which will upload the data in FB
  uploadFormData() async {
    screen1state = Screen1State.loading;
    notifyListeners();
    await HomeScreenRepo.uploadFormData(
      image!,
    );
    screen1state = Screen1State.succeed;
    notifyListeners();
  }

  List<ListEntity> listEntity = [];

  getFormData(BuildContext context) async {
    HomeScreenRepo.getFormData().listen((event) {
      listEntity = event;
      imageDataState = ImageDataState.succeed;
      notifyListeners();
    });
  }

  getImageProcessedData() async {
    imageDataState = ImageDataState.loading;
    notifyListeners();
    final dynamicLinkParams = DynamicLinkParameters(
      uriPrefix: "https://snappyaudio.page.link",
      link: Uri.parse(listEntity.first.imgUrl),
      androidParameters: const AndroidParameters(
        packageName: "com.example.snappyaudio",
        minimumVersion: 30,
      ),
    );
    final shortImageUrl =
        await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);

    try {
      final response = await HomeScreenRepo.getImageProcessedData(
          shortImageUrl.shortUrl.toString());
      youTubeSearchEntity = youTubeSearchEntityFromJson(response.body);
      log("message");
      imageDataState = ImageDataState.succeed;
      notifyListeners();
    } catch (e) {
      imageDataState = ImageDataState.error;
      notifyListeners();
    }
  }

  getImageToTextData() async {
    imageDataState = ImageDataState.loading;
    notifyListeners();
    final dynamicLinkParams = DynamicLinkParameters(
      uriPrefix: "https://snappyaudio.page.link",
      link: Uri.parse(listEntity.first.imgUrl),
      androidParameters: const AndroidParameters(
        packageName: "com.example.snappyaudio",
        minimumVersion: 30,
      ),
    );
    final shortImageUrl =
        await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);
    try {
      final response = await HomeScreenRepo.getImageToText(
          shortImageUrl.shortUrl.toString());
      imageToTextEntity = imageToTextEntityFromJson(response.body);
      imageDataState = ImageDataState.succeed;
      notifyListeners();
    } catch (e) {
      imageDataState = ImageDataState.error;
      notifyListeners();
    }
  }
}
