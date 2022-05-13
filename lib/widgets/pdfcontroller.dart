import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFcreator extends StatefulWidget {
  final String? title;

  const PDFcreator({Key? key, this.title}) : super(key: key);

  @override
  State<PDFcreator> createState() => _PDFcreatorState();
}

class _PDFcreatorState extends State<PDFcreator> {
  String url = "";
  Future<void> downloadURLExample() async {
    String downloadURL = await firebase_storage.FirebaseStorage.instance
        .ref('Physics Content/${widget.title}.pdf')
        .getDownloadURL();
    print(downloadURL);
    url = downloadURL;
    print(url);
    setState(() {});
    // PDFDocument doc = await PDFDocument.fromURL(downloadURL);
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) =>
    //             ViewPDF(doc))); //Notice the Push Route once this is done.
  }

  Future<File?> downloadFile(String url) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('Physics Content/${widget.title}.pdf');
    final response = await Dio().get(url);

    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();
    return file;
    // ScaffoldMessenger.of(context)
    //     .showSnackBar(SnackBar(content: Text('Downloaded ${ref.name}')));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    downloadURLExample();
    print('ALl DOne');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: url.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SfPdfViewer.network(url),
    );
  }
}
