import 'package:flutter/material.dart';
import './pdf_viewer.dart';
import 'package:playstore_app/uiwidgets/custom_place_holder.dart';

class MathListPP extends StatelessWidget {
  final List<String> MathPPdata;
  final String year;
  final String month;
  const MathListPP(
      {super.key,
      required this.MathPPdata,
      required this.year,
      required this.month});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
            // spread operator used.
            children: [
              ...MathPPdata.map((e) {
                return Answer(
                  title: e,
                  month: month,
                  year: year,
                );
              }).toList()
            ]),
      ),
    );
  }
}

class Answer extends StatelessWidget {
  final String title;
  final String month;
  final String year;

  const Answer(
      {super.key,
      required this.title,
      required this.month,
      required this.year});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PDFViewer(
                      title,
                      month,
                      year,
                    )));
      }),
      child: CustomPlaceHolder(
        title: title,
      ),
    );
  }
}
