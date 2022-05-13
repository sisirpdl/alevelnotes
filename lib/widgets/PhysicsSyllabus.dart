import 'package:flutter/material.dart';
import '/models/Syllabuspdf.dart';

class PhysicsSyllabus extends StatelessWidget {
  const PhysicsSyllabus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Syllabuspdf('Physics Syllabus'),
    );
  }
}
