// import 'package:flutter/material.dart';

// class AnimationPage extends StatefulWidget with ChangeNotifier {
//   @override
//   State<AnimationPage> createState() => _AnimationPageState();
// }

// class _AnimationPageState extends State<AnimationPage>
//     with TickerProviderStateMixin {
//   static bool first = true;
//   late final AnimationController _controller = AnimationController(
//     duration: const Duration(seconds: 5),
//     vsync: this,
//   );
//   late final Animation<double> _animation = CurvedAnimation(
//     parent: _controller,
//     curve: Curves.easeIn,
//   );

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//     setState(() {
//       first = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Color.fromARGB(255, 255, 0, 0),
//       child: FadeTransition(
//         opacity: _animation,
//         child: const Padding(padding: EdgeInsets.all(8), child: FlutterLogo()),
//       ),
//     );
//   }
// }
