import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'package:snappyaudio/presentation/features-screen/audio_screen.dart';
import 'package:snappyaudio/presentation/features-screen/meme_screen.dart';
import 'package:snappyaudio/presentation/features-screen/youtube_list_screen.dart';
import 'package:snappyaudio/providers/home-screen/home_provider.dart';
import 'package:snappyaudio/utlis/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, homeScreenState, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: InkWell(
                    onTap: () {
                      homeScreenState.selectImageFromGallery();
                    },
                    child: Container(
                      height: 250.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: homeScreenState.image == null
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Add Image ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  Text(
                                    "+",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30.sp,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Image.file(
                              homeScreenState.image!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                homeScreenState.image != null
                    ? const Text(
                        "Tap on again to select an Image",
                      )
                    : const SizedBox.shrink(),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () async {
                        homeScreenState.selectImageFromCamera();
                      },
                      child: Container(
                        height: 40.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: homeScreenState.screen1state ==
                                  Screen1State.loading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  "Camera",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        if (homeScreenState.image == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Check the form!!!"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          await homeScreenState.uploadFormData();
                          // await homeScreenState.getImageProcessedData();
                          if (homeScreenState.screen1state ==
                              Screen1State.succeed) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Form Submitted"),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                          await homeScreenState.getFormData(context);
                        }
                      },
                      child: Container(
                        height: 40.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: homeScreenState.screen1state ==
                                  Screen1State.loading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  "Upload",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                homeScreenState.imageDataState == ImageDataState.loading
                    ? const CircularProgressIndicator()
                    : homeScreenState.imageDataState == ImageDataState.error
                        ? Text(
                            "Oopss this image is not proceedings",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : const SizedBox.shrink(),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 80.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: greyColor, width: 5.w),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        40.r,
                      ),
                      bottomRight: Radius.circular(
                        40.r,
                      ),
                      topLeft: Radius.circular(
                        10.r,
                      ),
                      topRight: Radius.circular(
                        10.r,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () async {
                              if (homeScreenState.imageDataState ==
                                  ImageDataState.succeed) {
                                await homeScreenState.getImageProcessedData();

                                if (homeScreenState.imageDataState ==
                                    ImageDataState.succeed) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const YouTubeListScreen(),
                                    ),
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Please add an Image"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            },
                            child: Image.asset(
                              "assets/search_icon.png",
                              height: 40.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              if (homeScreenState.imageDataState ==
                                  ImageDataState.succeed) {
                                await homeScreenState.getImageToTextData();
                                if (homeScreenState.imageDataState ==
                                    ImageDataState.succeed) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => AudioScreen(
                                        description: homeScreenState
                                            .imageToTextEntity!.allText
                                            .toLowerCase(),
                                      ),
                                    ),
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Please add an Image"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            },
                            child: Image.asset(
                              "assets/read_aloud_sound.png",
                              height: 40.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const MemeScreen(),
                                ),
                              );
                            },
                            child: Image.asset(
                              "assets/meme_icon.png",
                              height: 40.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
