import 'package:flutter/material.dart';
import 'package:playstore_app/uiwidgets/custom_place_holder_contact_support.dart';
import 'package:playstore_app/widgets/ChangeThemeButtonWidget.dart';
import 'package:playstore_app/theme/colors.dart';
import 'package:playstore_app/datas/user_profile.dart';
import 'package:playstore_app/theme/padding.dart';
import 'package:playstore_app/uiwidgets/clipper.dart';
import 'package:playstore_app/uiwidgets/custom_category_card%20copy.dart';
import 'package:playstore_app/uiwidgets/custom_category_card.dart';
import 'package:playstore_app/uiwidgets/custom_heading.dart';
import 'package:playstore_app/uiwidgets/custom_promotion_card.dart';
import 'package:playstore_app/uiwidgets/custom_search_field.dart';
import 'package:playstore_app/uiwidgets/custom_place_holder.dart';
import 'package:provider/provider.dart';
import 'package:playstore_app/theme/theme_provider.dart';

// import 'package:playstore_app/themes/theme_manager.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
    //     ? 'DarkTheme'
    //     : 'LightTheme';
    final appbarColor =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            // ? Color.fromARGB(255, 62, 61, 61)
            ? const Color.fromARGB(255, 62, 61, 61)
            : Colors.blue.shade600;
    return Scaffold(
      // backgroundColor: background,
      extendBodyBehindAppBar: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          title: const Text('alevelNotes'),
          actions: [ChangeThemeButtonWidget()],
          backgroundColor: appbarColor,
          elevation: 0.0,
        ),
      ),
      // drawer: const MainDrawer(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: spacer),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                ClipPath(
                  clipper: BottomClipper(),
                  child: Align(
                    alignment: Alignment.center,
                    widthFactor: 1,
                    heightFactor: 1,
                    child: Image.asset('assets/images/vector-yeti.jpg'),
                  ),
                  // child: Container(
                  //     width: MediaQuery.of(context).size.width,
                  //     height: 278,
                  //     decoration:
                  //         const BoxDecoration(color: Color(0xFF132342))),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: appPadding, right: appPadding),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: spacer - 30),

                      //heading
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomHeading(
                            title: 'Hi, <user/> !',
                            subTitle: 'Let\'s start learning.',
                            color: textWhite,
                          ),
                          SizedBox(
                              height: spacer,
                              width: spacer,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(
                                    UserProfile['image'].toString(),
                                    fit: BoxFit.cover,
                                  ))),
                        ],
                      ),
                      const SizedBox(height: spacer + 42),

                      //search
                      // const CustomSearchField(
                      //   hintField: '"search hanni banauni ho?"',
                      //   backgroundColor: background,
                      // ),
                      // const SizedBox(height: spacer - 26.0),

                      //categoy card
                      const CustomCategoryCard(),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: spacer - 17,
            ),
            const CustomPromotionCard(),
            const SizedBox(
              height: spacer - 5,
            ),
            // const CustomButtonBox(title: 'abc'),
            // const SizedBox(
            //   height: spacer,
            // ),
            // const CustomCategoriesButton(title: 'abc'),
            // const SizedBox(
            //   height: spacer,
            // ),
            CustomHeading(
                title: "Notes",
                subTitle: "Premium Edition",
                color: Provider.of<ThemeProvider>(context).themeMode ==
                        ThemeMode.dark
                    // ? Color.fromARGB(255, 62, 61, 61)
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color.fromARGB(255, 0, 0, 0)),
            const SizedBox(
              height: spacer - 30,
            ),
            const CustomCategoryCardCopy(),
            const SizedBox(
              height: spacer,
            ),
            // const CustomCourseFooter(),
            // const SizedBox(
            //   height: spacer,
            // ),
            const CustomPlaceHolderContactSupport(title: "Have a great day !"),
            // const SizedBox(
            //   height: spacer,
            // ),
            // const CustomTitle(title: "abc"),
          ],
        ));
  }
}
