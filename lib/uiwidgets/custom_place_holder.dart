import 'package:playstore_app/datas/category_json.dart';
import 'package:playstore_app/theme/colors.dart';
// import 'package:playstore_app/utils/contant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPlaceHolder extends StatefulWidget {
  const CustomPlaceHolder(
      {Key? key, required this.title, this.isSwitch = false})
      : super(key: key);
  final String title;
  final bool isSwitch;

  @override
  CustomPlaceHolderState createState() => CustomPlaceHolderState();
}

class CustomPlaceHolderState extends State<CustomPlaceHolder> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      width: size.width,
      height: size.width * .1,
      margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 18.0,
              color: primary,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
