import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:playstore_app/theme/colors.dart';
import '../models/map_of_pastpapers.dart';
import 'package:playstore_app/Physics_Pastpaper/list_pp_final.dart';

class PhysicsPastPaper extends StatelessWidget {
  const PhysicsPastPaper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          var year = Map.pastpapers[index]['Year'];
          var month = Map.pastpapers[index]['Month'];
          List<String> contentMap =
              Map.pastpapers[index]['Title'] as List<String>;
          return PhysicsListTile(
            contentMap,
            month.toString(),
            year.toString(),
          );
        }),
        itemCount: Map.pastpapers.length,
      ),
    );
  }
}

class PhysicsListTile extends StatelessWidget {
  final String year;
  final String month;
  List<String> content;
  PhysicsListTile(this.content, this.month, this.year, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: ((context) {
          return ListPP(physicsPPdata: content, year: year, month: month);
        })));
      },
      child: ListTile(
        leading: Text(year),
        title: Text(month),
      ),
    );
  }
}
