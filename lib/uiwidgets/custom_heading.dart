import 'package:playstore_app/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomHeading extends StatelessWidget {
  const CustomHeading({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.color,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 5.0),
        Text(
          subTitle,
          style:  TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
