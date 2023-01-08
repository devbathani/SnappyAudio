import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextdfield extends StatelessWidget {
  const CustomTextdfield({
    super.key,
   
    this.onChanged,
    this.icon,
    required this.hintText,
    this.keyboardType, required this.controller,
  });

  final void Function(String)? onChanged;
  final IconData? icon;
  final TextInputType? keyboardType;
  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      
      style: TextStyle(
        color: Colors.grey,
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orange, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orange, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.orange,
          size: 18.w,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 21.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
