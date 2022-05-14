// import 'package:flutter/material.dart';

// class ContactUs extends StatelessWidget {
//   const ContactUs({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: const Center(child: Text('Welcome to our customer Service')),
//       backgroundColor: Colors.orange.shade700,
//     );
//   }
// }

import 'package:playstore_app/datas/account_menu_json.dart';
import 'package:playstore_app/theme/colors.dart';
import 'package:playstore_app/theme/padding.dart';
import 'package:playstore_app/uiwidgets/custom_place_holder.dart';
import 'package:playstore_app/uiwidgets/custom_place_holder_contact_support.dart';
import 'package:playstore_app/uiwidgets/custom_title.dart';
import 'package:flutter/material.dart';

import 'package:playstore_app/widgets/ChangeThemeButtonWidget.dart';

import 'package:provider/provider.dart';
import 'package:playstore_app/theme/theme_provider.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  AccountPageState createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appbarColor =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            // ? Color.fromARGB(255, 62, 61, 61)
            ? const Color.fromARGB(255, 62, 61, 61)
            : Colors.blue.shade600;
    final textWhite =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            // ? Color.fromARGB(255, 62, 61, 61)
            ? const Color.fromARGB(227, 56, 53, 53)
            : const Color(0xFFFFFFFF);

    return Scaffold(
      backgroundColor: textWhite,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          title: const Text('Support'),
          actions: [ChangeThemeButtonWidget()],
          backgroundColor: appbarColor,
          elevation: 0.0,
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    // var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 0, top: 100),
      child: Column(
        children: [
          const SizedBox(height: spacer - 1.0),
          Column(
            children: List.generate(
              accountmenujson.length,
              (index) {
                List data = accountmenujson[index]['categories'];
                return Padding(
                  padding: const EdgeInsets.only(bottom: spacer),
                  child: Column(
                    children: [
                      CustomTitle(
                        title: accountmenujson[index]['title'],
                        extend: false,
                      ),
                      const SizedBox(height: smallSpacer),
                      Column(
                        children: List.generate(
                          data.length,
                          (j) {
                            return CustomPlaceHolderContactSupport(
                              title: data[j]['title'],
                              isSwitch: data[j]['isSwitch'],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: smallSpacer),
          Container(
            alignment: Alignment.center,
            // padding: const EdgeInsets.only(right: 30),
            child: Text(
              'V1.0.1',
              style: TextStyle(
                fontSize: 14.0,
                color: Provider.of<ThemeProvider>(context).themeMode ==
                        ThemeMode.dark
                    // ? Color.fromARGB(255, 62, 61, 61)
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          const SizedBox(height: 30),
           Container(
            alignment: Alignment.center,
            // padding: const EdgeInsets.only(right: 30),
            child: Text(
              '''Developed By Arun Joshi
    and Shishir Poudel''',
              style: TextStyle(
                fontSize: 14.0,
                color: Provider.of<ThemeProvider>(context).themeMode ==
                        ThemeMode.dark
                    // ? Color.fromARGB(255, 62, 61, 61)
                    ? Color.fromARGB(255, 0, 255, 170)
                    : Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
