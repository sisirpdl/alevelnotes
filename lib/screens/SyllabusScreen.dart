import 'package:flutter/material.dart';
import '../widgets/PhysicsSyllabus.dart';

import 'package:playstore_app/widgets/ChangeThemeButtonWidget.dart';

import 'package:provider/provider.dart';
import 'package:playstore_app/theme/theme_provider.dart';
import '../widgets/MathSyllabus.dart';

class Syllabus extends StatefulWidget {
  const Syllabus({Key? key}) : super(key: key);

  @override
  State<Syllabus> createState() => _SyllabusState();
}

class _SyllabusState extends State<Syllabus> {
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
          title: const Text('Syllabus'),
          actions: [ChangeThemeButtonWidget()],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Physics',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Maths',
              )
            ],
          ),
        ),
        // drawer:const MainDrawer(),
        body: const TabBarView(
          children: [PhysicsSyllabus(), MathSyllabus()],
        ),
      ),
    );
  }
}
