import 'package:flutter/material.dart';
import '/models/Syllabuspdf.dart';

class MathSyllabus extends StatelessWidget {
  const MathSyllabus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Syllabuspdf('Math Syllabus'));
  }
}
