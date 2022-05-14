import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import './screens/readerscreen.dart';
import './screens/Homepage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:playstore_app/theme/theme_provider.dart';
import 'package:playstore_app/root_app.dart';
// import 'package:rate_my_app/rate_my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: '</appname>',
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            routes: {
              '/reader_screen': (context) => ReaderScreen(),
            },
            // home: const MyHomePage(),
            //

            home: AnimatedSplashScreen(
              splash: Lottie.asset("assets/splash.json"),
              // screenFunction: () async {
              //   return RootApp();
              // },
              nextScreen: RootApp(),
              duration: 4000,
              splashIconSize: 250,
              splashTransition: SplashTransition.decoratedBoxTransition,
              pageTransitionType: PageTransitionType.bottomToTop,

              animationDuration: const Duration(seconds: 2),
            ));
        // home: RootApp(),
      });
}
