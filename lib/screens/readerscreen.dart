import 'package:flutter/material.dart';
import '/widgets/pdfcontroller.dart';
import '../widgets/DownloadDialog.dart';

class ReaderScreen extends StatefulWidget {
  // final String title;
  // ReaderScreen(this.title, {Key? key}) : super(key: key);

  @override
  State<ReaderScreen> createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ReaderScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String?>;

    final title = routeArgs['title'];

    return Scaffold(
        appBar: AppBar(title: Text(title!), actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => DownloadDialog(title));
            },
            icon: const Icon(Icons.download),
          ),
          // IconButton(
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //     icon: const Icon(Icons.arrow_back)),
          // IconButton(
          //     onPressed: () => downloadFile(url), icon: Icon(Icons.download))
        ]),
        body: PDFcreator(
          title: title,
        ));
  }
}
