import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:snappyaudio/providers/home-screen/home_provider.dart';
import 'package:snappyaudio/utlis/colors.dart';
import 'package:url_launcher/url_launcher_string.dart';

class YouTubeListScreen extends StatelessWidget {
  const YouTubeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, youtubeState, child) {
        return Scaffold(
          backgroundColor: purpleColor,
          body: youtubeState.imageDataState == ImageDataState.normal
              ? const Text("No data")
              : youtubeState.imageDataState == ImageDataState.loading
                  ? const CircularProgressIndicator()
                  : Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30.h,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: Colors.black,
                                  size: 30.w,
                                ),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Container(
                                height: 450.h,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: List.generate(
                                        youtubeState.youTubeSearchEntity!
                                            .videoResults!.length,
                                        (index) {
                                          final youTubeData = youtubeState
                                              .youTubeSearchEntity!
                                              .videoResults![index];
                                          return youtubeState.errorMessage != ''
                                              ? Text(youtubeState.errorMessage)
                                              : Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 10.h,
                                                    horizontal: 10.w,
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {
                                                      launchUrlString(
                                                        youTubeData.link!,
                                                        mode: LaunchMode
                                                            .externalApplication,
                                                      );
                                                    },
                                                    child: Container(
                                                      height: 250.h,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.black,
                                                            width: 3.w),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.r),
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            height: 150.h,
                                                            width: 320.w,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.r),
                                                              image:
                                                                  DecorationImage(
                                                                image:
                                                                    NetworkImage(
                                                                  youTubeData!
                                                                      .thumbnail!
                                                                      .thumbnailStatic!,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10.h,
                                                          ),
                                                          SizedBox(
                                                            width: 310.w,
                                                            child: Row(
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              5.w),
                                                                  child:
                                                                      SizedBox(
                                                                    width:
                                                                        200.w,
                                                                    child: Text(
                                                                      youTubeData
                                                                          .title!,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            15.sp,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                height: 80.h,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: greyColor,
                                  border:
                                      Border.all(color: greyColor, width: 5.w),
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
                                    padding: EdgeInsets.only(top: 15.h),
                                    child: Text(
                                      "Search",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 28.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 60.h,
                          left: 145.w,
                          child: Container(
                            height: 70.h,
                            width: 70.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: greyColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(2, 0),
                                  blurRadius: 5,
                                  spreadRadius: 0.05,
                                ),
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(-2, 5),
                                  blurRadius: 5,
                                  spreadRadius: 0.05,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Image.asset(
                                "assets/search_icon.png",
                                height: 40.h,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
        );
      },
    );
  }
}
