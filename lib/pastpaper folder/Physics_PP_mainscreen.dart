import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:playstore_app/theme/colors.dart';
import 'package:playstore_app/widgets/ChangeThemeButtonWidget.dart';
import 'map_of_pastpapers.dart';
import './Physics_ListTile_module.dart';

class PhysicsPastPaper extends StatelessWidget {
  const PhysicsPastPaper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("physics past papers"),
                  actions: [ChangeThemeButtonWidget()],
      ),
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
