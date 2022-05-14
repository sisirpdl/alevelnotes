import 'package:playstore_app/datas/category_json.dart';
import 'package:playstore_app/theme/colors.dart';
// import 'package:playstore_app/utils/contant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:playstore_app/theme/theme_provider.dart';

class CustomPlaceHolderContactSupport extends StatefulWidget {
  const CustomPlaceHolderContactSupport(
      {Key? key, required this.title, this.isSwitch = false})
      : super(key: key);
  final String title;
  final bool isSwitch;

  @override
  CustomPlaceHolderContactSupportState createState() =>
      CustomPlaceHolderContactSupportState();
}

class CustomPlaceHolderContactSupportState
    extends State<CustomPlaceHolderContactSupport> {
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
            style: TextStyle(
              fontSize: 18.0,
              color: Provider.of<ThemeProvider>(context).themeMode ==
                      ThemeMode.dark
                  // ? Color.fromARGB(255, 62, 61, 61)
                  ? const Color.fromARGB(255, 255, 255, 255)
                  : const Color.fromARGB(255, 0, 0, 0),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
