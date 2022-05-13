import 'package:flutter/material.dart';

class MathScreen extends StatelessWidget {
  const MathScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back)
              )
        ],
        title: const Text('Mathematics'),
      ),
      body: const Center(child: Text("Coming Soon!")),
    );
  }
}
