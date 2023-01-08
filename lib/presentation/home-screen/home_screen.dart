import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'package:snappyaudio/providers/home-screen/home_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, screen1State, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text("Screen 1"),
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
                      height: 150.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: screen1State.image == null
                          ? Center(
                              child: Text(
                                "Add Image +",
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 15.sp,
                                ),
                              ),
                            )
                          : Image.file(
                              screen1State.image!,
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  InkWell(
                    onTap: () async {
                      if (
                          screen1State.image == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Check the form!!!"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        await screen1State.uploadFormData();
                        if (screen1State.screen1state == Screen1State.succeed) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Form Submitted"),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                      }
                    },
                    child: Container(
                      height: 40.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: Colors.orange,
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
