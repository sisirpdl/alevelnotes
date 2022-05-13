import 'package:flutter/material.dart';
import 'package:playstore_app/pastpaper%20folder/list_pp_final.dart';

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
