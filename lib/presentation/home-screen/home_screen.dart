import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'package:snappyaudio/providers/home-screen/home_provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, screen1State, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text("Home Screen"),
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      screen1State.selectImageFromGallery();
                    },
                    child: Container(
                      height: 250.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: screen1State.image == null
                          ? Center(
                              child: Text(
                                "Add Image +",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15.sp,
                                ),
                              ),
                            )
                          : Image.file(
                              screen1State.image!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "YouTube List",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  screen1State.imageDataState == ImageDataState.normal
                      ? const Text("No data")
                      : screen1State.imageDataState == ImageDataState.loading
                          ? const CircularProgressIndicator()
                          : Column(
                              children: List.generate(
                                screen1State
                                    .youTubeSearchEntity!.videoResults!.length,
                                (index) {
                                  final youTubeData = screen1State
                                      .youTubeSearchEntity!
                                      .videoResults![index];
                                  return screen1State.errorMessage != ''
                                      ? Text(screen1State.errorMessage)
                                      : Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            onTap: () {
                                              launchUrlString(
                                                youTubeData.link!,
                                                mode: LaunchMode
                                                    .externalApplication,
                                              );
                                            },
                                            child: Container(
                                              height: 200.h,
                                              width: 350.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    youTubeData!.thumbnail!
                                                        .thumbnailStatic!,
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                },
                              ),
                            ),
                  SizedBox(
                    height: 20.h,
                  ),
                  InkWell(
                    onTap: () async {
                      if (screen1State.image == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Check the form!!!"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        await screen1State.uploadFormData();
                        // await screen1State.getImageProcessedData();
                        if (screen1State.screen1state == Screen1State.succeed) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Form Submitted"),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                        await screen1State.getFormData();
                      }
                    },
                    child: Container(
                      height: 40.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: screen1State.screen1state == Screen1State.loading
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
                  SizedBox(
                    height: 20.h,
                  ),
                  InkWell(
                    onTap: () async {
                      if (screen1State.image == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Check the form!!!"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        // await screen1State.uploadFormData();
                        await screen1State.getImageProcessedData();
                        if (screen1State.screen1state == Screen1State.succeed) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Form Submitted"),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                        await screen1State.getFormData();
                      }
                    },
                    child: Container(
                      height: 40.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: screen1State.screen1state == Screen1State.loading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Get Youtube",
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
            ),
          ),
        );
      },
    );
  }
}
