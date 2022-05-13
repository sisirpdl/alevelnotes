import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewer extends StatefulWidget {
  final String title;
  final String month;
  final String year;
// error comes then changes this and add the constructer without keys.
  PDFViewer(this.title, this.month, this.year, {Key? key}) : super(key: key);
  @override
  State<PDFViewer> createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  String url = "";
  Future<void> downloadURLExample() async {
    String downloadURL = await firebase_storage.FirebaseStorage.instance
        .ref('Past Papers/${widget.year}/${widget.month}/${widget.title}')
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
    final file =
        File('Past Papers/${widget.year}/${widget.month}/${widget.title}');
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
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: url.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : SfPdfViewer.network(url),
      ),
    );
  }
}
