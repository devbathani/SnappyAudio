import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snappyaudio/repository/home-screen-repo/google_lens_entity.dart';
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

  getFormData() async {
    HomeScreenRepo.getFormData().listen((event) {
      listEntity = event;

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
    final response = await HomeScreenRepo.getImageProcessedData(
        shortImageUrl.shortUrl.toString());
    if (jsonDecode(response.body)['error'] != null) {
      errorMessage = jsonDecode(response.body)['error'];
      notifyListeners();
    }
    youTubeSearchEntity = youTubeSearchEntityFromJson(response.body);
    imageDataState = ImageDataState.succeed;
    notifyListeners();
  }
}
