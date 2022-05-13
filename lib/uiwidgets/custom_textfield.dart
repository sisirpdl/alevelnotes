// import 'package:playstore_app/theme/colors.dart';
// import 'package:playstore_app/theme/padding.dart';
// import 'package:playstore_app/utils/contant.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class CustomTextField extends StatefulWidget {
//   const CustomTextField({
//     Key? key,
//     required this.prefixIcon,
//     required this.labelText,
//     this.controller,
//     this.readOnlyField = false,
//     this.isPassword = false,
//     this.iconHeight = 17.0,
//     this.maxLine = 1,
//     this.height = 50.0,
//     this.keyboardType,
//     this.iconColor,
//   }) : super(key: key);
//   final String prefixIcon;
//   final double iconHeight;
//   final String labelText;
//   final TextEditingController? controller;
//   final bool isPassword;
//   final bool readOnlyField;
//   final int maxLine;
//   final double height;
//   final TextInputType? keyboardType;
//   final Color? iconColor;

//   @override
//   _CustomTextFieldState createState() => _CustomTextFieldState();
// }

// class _CustomTextFieldState extends State<CustomTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: widget.height,
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         border: Border(
//           bottom: BorderSide(color: Colors.red, width: 0.5),
//         ),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             height: 50.0,
//             width: 50.0,
//             // color: grey,
//             alignment: Alignment.center,
//             child: Container(
//                 child: SvgPicture.asset(
//               assetImg + widget.prefixIcon,
//               height: widget.iconHeight,
//               color: Colors.green,
//             )),
//           ),
//           SizedBox(width: miniSpacer),
//           Flexible(
//               child: TextField(
//             onTap: () {},
//             keyboardType: widget.keyboardType,
//             readOnly: widget.readOnlyField,
//             obscureText: widget.isPassword,
//             controller: widget.controller,
//             maxLines: widget.maxLine,
//             style: TextStyle(
//               fontSize: 15.0,
//               color: Color.fromARGB(255, 0, 255, 38),
//               fontWeight: FontWeight.w500,
//             ),
//             cursorColor: secondary,
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               labelText: widget.labelText,
//               labelStyle: TextStyle(
//                 color: Colors.blue,
//                 fontSize: 15.0,
//                 height: 1,
//               ),
//             ),
//           )),
//         ],
//       ),
//     );
//   }
// }
