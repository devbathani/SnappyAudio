import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snappyaudio/utlis/colors.dart';

class MemeScreen extends StatelessWidget {
  const MemeScreen({
    super.key,
  });

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
                SizedBox(
                  height: 200.h,
                ),
                Center(
                  child: Text(
                    "Coming Soon!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                        "Meme",
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
                  "assets/meme_icon.png",
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
