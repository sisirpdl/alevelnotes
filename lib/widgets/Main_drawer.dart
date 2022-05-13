import 'package:flutter/material.dart';
import 'package:playstore_app/pastpaper%20folder/pastpapers.dart';
import '/screens/ContactUs.dart';
import '/screens/Homepage.dart';
import '/screens/SyllabusScreen.dart';
import '../screens/FormulaScreen.dart';
import 'package:provider/provider.dart';
import 'package:playstore_app/theme/theme_provider.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);
  Widget listtilecreator(
      IconData icon, String text, void Function()? navigate) {
    // check for void function
    return ListTile(
      leading: Icon(icon),
      title: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 24),
      ),
      onTap: navigate,
    );
  }

  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        // ? Color.fromARGB(255, 62, 61, 61)
        ? Colors.black
        : Colors.orange;
    return Drawer(
      width: 300,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 170,
            // width: double.infinity,

            color: Colors.white,
            child: Text(
              'alevelNotes',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal,color: text),
            ),
          ),
          listtilecreator(Icons.home, 'Home', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyHomePage()));
          }),
          listtilecreator(Icons.book_outlined, "Syllabus", () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Syllabus()));
          }),
          listtilecreator(Icons.numbers, "Formula", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FormulaScreen()));
          }),
          listtilecreator(Icons.file_copy, "Past Papers", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Pastpaper()));
          }),
          listtilecreator(Icons.contact_support_outlined, 'Contact Us', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AccountPage()));
          }),
        ],
      ),
      // ),
    );
  }
}
