import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snappyaudio/utlis/colors.dart';
import 'package:text_to_speech/text_to_speech.dart';

class AudioScreen extends StatelessWidget {
  AudioScreen({super.key, required this.description});
  final String description;
  final TextToSpeech tts = TextToSpeech();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.h),
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Container(
                    height: 250.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Scrollbar(
                        thumbVisibility: true,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.w, vertical: 10.h),
                            child: Column(
                              children: [
                                Text(
                                  description,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        await tts.setVolume(1.0);
                        await tts.setRate(1.0);
                        await tts.setPitch(1.0);
                        await tts.speak(description);
                      },
                      child: Container(
                        height: 45.h,
                        width: 140.w,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Center(
                          child: Text(
                            "Listen",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    InkWell(
                      onTap: () async {
                        await tts.stop();
                      },
                      child: Container(
                        height: 45.h,
                        width: 140.w,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Center(
                          child: Text(
                            "Stop",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  height: 80.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: greyColor,
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
                      padding: EdgeInsets.only(top: 15.h),
                      child: Text(
                        "Voice",
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
            bottom: 75.h,
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
                  "assets/read_aloud_sound.png",
                  height: 40.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
