import 'package:flutter/material.dart';
import 'package:playstore_app/widgets/ChangeThemeButtonWidget.dart';
import '/widgets/Mathformula.dart';
import '/widgets/Physicsformula.dart';

import 'package:provider/provider.dart';
import 'package:playstore_app/theme/theme_provider.dart';

class FormulaScreen extends StatelessWidget {
  const FormulaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appbarColor =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            // ? Color.fromARGB(255, 62, 61, 61)
            ? const Color.fromARGB(255, 62, 61, 61)
            : Colors.blue.shade600;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appbarColor,
          title: const Text('Formula Screen'),
          actions: [ChangeThemeButtonWidget()],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.ac_unit),
                text: 'Physics',
              ),
              Tab(
                icon: Icon(Icons.streetview_sharp),
                text: 'Maths',
              )
            ],
          ),
        ),
        // drawer: MainDrawer(),
        body: const TabBarView(
          children: [PhysicsFormula(), MathFormula()],
        ),
      ),
    );
  }
}
