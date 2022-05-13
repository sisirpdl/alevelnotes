import 'package:flutter/material.dart';
import '/models/dummylist.dart';
import '/widgets/list_items.dart';

class PhysicsScreen extends StatefulWidget {
  const PhysicsScreen({Key? key}) : super(key: key);

  @override
  State<PhysicsScreen> createState() => _PhysicsScreenState();
}

class _PhysicsScreenState extends State<PhysicsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Physics',
          textAlign: TextAlign.center,
        ),
        actions: [],
      ),
      // body: InkWell(
      //   onTap: () {
      //     // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //     //   return ReaderScreen(title);
      //     // }));
      //     Navigator.push(
      //         context,
      //         PageTransition(
      //             child: ReaderScreen(), type: PageTransitionType.leftToRight));
      //   },
      body: ListView(
        // try to add animatedpages here.
        children: physicspdf
            .map((e) => ListItems(num: e.num, title: e.Title))
            .toList(),
        // itemBuilder: (context, i) {
        //   int num = i + 1;

        //   if (num == 1) {
        //     title = 'Physical Quantites';
        //     print('NUmber is 1');
        //   } else if (num == 2) {
        //     title = 'citizenship';
        //   }
        //   return ListTile(
        //       leading: Text(num.toString()),
        //       title: Text(title),
        //       trailing: IconButton(
        //         onPressed: () {
        //           setState(() {
        //             _isFav = !_isFav;
        //           });
        //         },
        //         icon: _isFav
        //             ? const Icon(Icons.favorite_sharp)
        //             : const Icon(Icons.favorite_outline),
        //       ));
        // },
        // itemCount: 2,
      ),
    );
  }
}
