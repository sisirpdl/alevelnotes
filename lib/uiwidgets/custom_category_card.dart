import 'package:playstore_app/datas/category_json.dart';
import 'package:playstore_app/screens/Math_mainscreen.dart';
import 'package:playstore_app/screens/Physics_mainscreen.dart';
import 'package:playstore_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:playstore_app/screens/pastpapers.dart';
import 'package:playstore_app/uiwidgets/physicsNotes.dart';

import '../screens/FormulaScreen.dart';

class CustomCategoryCard extends StatelessWidget {
  const CustomCategoryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(homePageCategoryJson.length, (index) {
          return GestureDetector(
            onTap: () {
              if (homePageCategoryJson[index]['title'] == "Physics") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PhysicsScreen()));
              } else if (homePageCategoryJson[index]['title'] == "Maths") {
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MathScreen()));
                }
              } else {
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Pastpaper()));
                }
              }
            },
            child: Container(
              height: size.width * .25,
              width: size.width * .25,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              decoration: BoxDecoration(
                color: Color.fromARGB(150, 218, 218, 242),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: textBlack.withOpacity(0.05),
                    blurRadius: 15.0,
                    offset: const Offset(0, 7),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 35.0,
                    width: 35.0,
                    margin: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: primary.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: primary.withOpacity(0.4),
                          spreadRadius: 0.0,
                          blurRadius: 3.0,
                          offset: const Offset(0, 2),
                        )
                      ],
                    ),
                    child: SvgPicture.asset(
                      homePageCategoryJson[index]['icon'],
                      color: textWhite,
                      width: 15.0,
                    ),
                  ),
                  Text(
                    homePageCategoryJson[index]['title'],
                    style: const TextStyle(
                      color: secondary,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w200,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 0.0),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
