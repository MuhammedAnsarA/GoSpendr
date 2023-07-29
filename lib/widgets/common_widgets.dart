// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// AppBar buildAppBar(String type) {
//   return AppBar(
//     bottom: PreferredSize(
//       preferredSize: const Size.fromHeight(1.0),
//       child: Container(
//         color: Colors.grey.withOpacity(0.5),
//         height: 1.0,
//       ),
//     ),
//     title: Text(
//       type,
//       style: TextStyle(
//         color: Colors.black,
//         fontSize: 16.sp,
//         fontWeight: FontWeight.normal,
//       ),
//     ),
//   );
// }

// Widget buildThirdPartyLogin(BuildContext context) {
//   return Container(
//     margin: EdgeInsets.only(
//       top: 30.h,
//       bottom: 20.h,
//     ),
//     padding: EdgeInsets.only(left: 50.w, right: 50.w),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         _reUsebleIcons("google"),
//         _reUsebleIcons("apple"),
//         _reUsebleIcons("facebook")
//       ],
//     ),
//   );
// }

// Widget _reUsebleIcons(String iconName) {
//   return GestureDetector(
//     onTap: () {},
//     child: SizedBox(
//       width: 40.w,
//       height: 40.w,
//       child: Image.asset("assets/icons/$iconName.png"),
//     ),
//   );
// }

// Widget reUsebleText(String text) {
//   return Container(
//     margin: EdgeInsets.only(bottom: 5.h),
//     child: Text(
//       text,
//       style: TextStyle(
//         color: Colors.grey,
//         fontWeight: FontWeight.normal,
//         fontSize: 14.sp,
//       ),
//     ),
//   );
// }

// Widget buildTextField(String hintText, String textType, String iconName,
//     void Function(String value)? func) {
//   return Container(
//       width: 325.w,
//       height: 50.h,
//       margin: EdgeInsets.only(bottom: 25.h),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15.w),
//         border: Border.all(color: Colors.black),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 21.w,
//             height: 21.w,
//             margin: EdgeInsets.only(left: 17.w),
//             child: Image.asset("assets/icons/$iconName.png"),
//           ),
//           Container(
//             width: 265.w,
//             margin: const EdgeInsets.only(left: 5),
//             height: 50.h,
//             child: TextField(
//               onChanged: (value) => func!(value),
//               keyboardType: TextInputType.multiline,
//               decoration: InputDecoration(
//                 hintText: hintText,
//                 border: const OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.transparent),
//                 ),
//                 enabledBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.transparent),
//                 ),
//                 disabledBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.transparent),
//                 ),
//                 focusedBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.transparent),
//                 ),
//                 hintStyle: TextStyle(
//                   color: Colors.grey.withOpacity(0.7),
//                 ),
//               ),
//               style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.normal,
//                   fontSize: 14.sp,
//                   fontFamily: "Avenir"),
//               autocorrect: false,
//               obscureText: textType == "Password" ? true : false,
//             ),
//           ),
//         ],
//       ));
// }

// Widget forgotPassword() {
//   return SizedBox(
//     width: 260.w,
//     height: 44.h,
//     child: GestureDetector(
//       onTap: () {},
//       child: Text(
//         "Forgot Password ?",
//         style: TextStyle(
//           color: Colors.green[700],
//           fontSize: 14.sp,
//           fontWeight: FontWeight.bold,
//           decoration: TextDecoration.underline,
//           decorationColor: Colors.green[700],
//         ),
//       ),
//     ),
//   );
// }

// Widget buildLogInAndRegButton(
//     String buttonName, String buttonType, void Function()? func) {
//   return GestureDetector(
//     onTap: func,
//     child: Container(
//       margin: EdgeInsets.only(top: 18.h),
//       width: 325.w,
//       height: 50.h,
//       decoration: BoxDecoration(
//         color: buttonType == "login" ? Colors.green[700] : Colors.white,
//         borderRadius: BorderRadius.circular(15.w),
//         border: Border.all(
//             color: buttonType == "login" ? Colors.transparent : Colors.black),
//         boxShadow: [
//           BoxShadow(
//             spreadRadius: 1,
//             blurRadius: 2,
//             offset: const Offset(0, 1),
//             color: Colors.grey.withOpacity(0.1),
//           ),
//         ],
//       ),
//       child: Center(
//         child: Text(
//           buttonName,
//           style: TextStyle(
//             color: buttonType == "login" ? Colors.white : Colors.black,
//             fontSize: 17.sp,
//             fontWeight: FontWeight.normal,
//           ),
//         ),
//       ),
//     ),
//   );
// }
