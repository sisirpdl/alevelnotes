import 'package:flutter/material.dart';
import 'package:playstore_app/Physics_Pastpaper/Physics_PP_mainscreen.dart';
import 'package:playstore_app/screens/Math_mainscreen.dart';
import 'package:playstore_app/screens/Physics_mainscreen.dart';
import 'package:playstore_app/uiwidgets/mathsNotes.dart';
import 'package:playstore_app/uiwidgets/mathsPastPaper.dart';
import 'package:playstore_app/uiwidgets/physicsNotes.dart';
import 'package:playstore_app/uiwidgets/physicsPastPaper.dart';
import 'package:playstore_app/widgets/ChangeThemeButtonWidget.dart';
import 'package:provider/provider.dart';
import 'package:playstore_app/theme/theme_provider.dart';
import 'package:playstore_app/uiwidgets/clipper.dart';
import 'package:playstore_app/uiwidgets/custom_category_card%20copy.dart';
import 'package:playstore_app/widgets/ChangeThemeButtonWidget.dart';
import 'package:playstore_app/theme/colors.dart';
import 'package:playstore_app/datas/user_profile.dart';
import 'package:playstore_app/theme/padding.dart';
import 'package:playstore_app/uiwidgets/custom_category_card.dart';
import 'package:playstore_app/uiwidgets/custom_heading.dart';
import 'package:playstore_app/uiwidgets/custom_promotion_card.dart';
import 'package:playstore_app/uiwidgets/custom_search_field.dart';

import 'package:playstore_app/uiwidgets/custom_place_holder.dart';
import 'package:playstore_app/theme/theme_provider.dart';

class Pastpaper extends StatelessWidget {
  const Pastpaper({super.key});

  @override
  Widget build(BuildContext context) {
    final appbarColor =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            // ? Color.fromARGB(255, 62, 61, 61)
            ? const Color.fromARGB(255, 62, 61, 61)
            : Colors.blue.shade600;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarColor,
        title: const Text('Past Paper'),
        actions: [ChangeThemeButtonWidget()],
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: spacer),
        child: Column(
          children: const [
            SizedBox(
              height: spacer - 15,
            ),
            PhysicsPastPaperWidget(),
            SizedBox(
              height: spacer,
            ),
            MathsPastPaperWidget(),
          ],
        ));
  }
}
