import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snappyaudio/repository/home-screen-repo/google_lens_entity.dart';
import 'package:snappyaudio/repository/home-screen-repo/list_entity.dart';
import 'package:snappyaudio/repository/home-screen-repo/home_screen_repo.dart';
import 'package:snappyaudio/repository/home-screen-repo/youtube_search_entity.dart';

enum Screen1State { normal, loading, succeed }

class HomeScreenProvider extends ChangeNotifier {
  Screen1State screen1state = Screen1State.normal;
  GoogleLensEntity? googleLensEntity;
  YouTubeSearchEntity? youTubeSearchEntity;

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

    // await HomeScreenRepo.getImageProcessedData(listEntity.first.imgUrl)
    //     .then((value) {
    //   if (value.statusCode == 200) {
    //     log("Here");
    //     googleLensEntity = googleLensEntityFromJson(value.body);
    //     log(googleLensEntity!.knowledgeGraph!.first!.title!);
    //   } else {
    //     screen1state = Screen1State.loading;
    //   }
    // });
    // await HomeScreenRepo.getYoutubeData(
    //         googleLensEntity!.knowledgeGraph!.first!.title!)
    //     .then((value) {
    //   if (value.statusCode == 200) {
    //     log("here 2");
    //     youTubeSearchEntity = youTubeSearchEntityFromJson(value.body);
    //     screen1state = Screen1State.succeed;
    //   } else {
    //     screen1state = Screen1State.loading;
    //   }
    // });
  }

  getImageProcessedData() async {
    log("Image Url : ${listEntity.first.imgUrl}");
    final response =
        await HomeScreenRepo.getImageProcessedData(listEntity.first.imgUrl);
    youTubeSearchEntity = youTubeSearchEntityFromJson(response.body);
    notifyListeners();
  }
}
