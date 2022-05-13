// import 'package:playstore_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:playstore_app/screens/FormulaScreen.dart';
import 'package:playstore_app/screens/Notes.dart';
import './screens/Homepage.dart';
import './screens/ContactUs.dart';
import './screens/FormulaScreen.dart';
import 'package:provider/provider.dart';
import 'package:playstore_app/theme/theme_provider.dart';
// import 'package:playstore_app/pages/account_page.dart';

class RootApp extends StatefulWidget {
  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      const MyHomePage(),
      const FormulaScreen(),
      const Notes(),
      const AccountPage()
    ];
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;

    final primary =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            // ? Color.fromARGB(255, 62, 61, 61)
            ? const Color.fromARGB(255, 255, 255, 255)
            : const Color(0xFF2EA5FF);
    final secondary =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            // ? Color.fromARGB(255, 62, 61, 61)
            ? const Color.fromARGB(255, 0, 255, 170)
            : const Color(0xFF132342);
    final textWhite =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            // ? Color.fromARGB(255, 62, 61, 61)
            ? const Color.fromARGB(255, 62, 61, 61)
            : const Color(0xFFFFFFFF);
    final textBlack =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            // ? Color.fromARGB(255, 62, 61, 61)
            ? const Color.fromARGB(255, 245, 245, 245)
            : const Color(0xFF000000);

    List bottomItems = [
      "assets/images/home_icon.svg",
      "assets/images/flask-chemistry-svgrepo-com.svg",
      "assets/images/notes-note-svgrepo-com.svg",
      "assets/images/user_icon.svg",
    ];
    return Container(
      width: size.width,
      height: 55,
      decoration: BoxDecoration(
        color: textWhite,
        boxShadow: [
          BoxShadow(
            color: textBlack.withOpacity(0.12),
            blurRadius: 20.0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 40, right: 40, bottom: 8, top: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(bottomItems.length, (index) {
              return InkWell(
                  onTap: () {
                    selectedTab(index);
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        bottomItems[index],
                        height: 18.5,
                        color: pageIndex == index ? primary : secondary,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      (pageIndex == index)
                          ? AnimatedContainer(
                              duration: const Duration(milliseconds: 50),
                              curve: Curves.easeIn,
                              child: Container(
                                height: 3.0,
                                width: 16.0,
                                decoration: BoxDecoration(
                                    color: primary,
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                            )
                          : Container(
                              height: 5.0,
                              width: 20.0,
                            ),
                    ],
                  ));
            }),
          ),
        ),
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
