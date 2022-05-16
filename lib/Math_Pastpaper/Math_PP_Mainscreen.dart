import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:playstore_app/theme/colors.dart';
import '../models/map_of_pastpapers.dart';
import 'package:playstore_app/Physics_Pastpaper/list_pp_final.dart';
import "Math_list_pp.dart";

class MathPastPaper extends StatelessWidget {
  const MathPastPaper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          var year = Map.Mathspastpapers[index]['Year'];
          var month = Map.Mathspastpapers[index]['Month'];
          List<String> contentMap =
              Map.Mathspastpapers[index]['Title'] as List<String>;
          return MathListTile(
            contentMap,
            month.toString(),
            year.toString(),
          );
        }),
        itemCount: Map.Mathspastpapers.length,
      ),
    );
  }
}

class MathListTile extends StatelessWidget {
  final String year;
  final String month;
  List<String> content;
  MathListTile(this.content, this.month, this.year, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: ((context) {
          return MathListPP(MathPPdata: content, year: year, month: month);
        })));
      },
      child: ListTile(
        leading: Text(year),
        title: Text(month),
      ),
    );
  }
}
