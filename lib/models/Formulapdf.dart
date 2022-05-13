import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Formulapdf extends StatefulWidget {
  final String title;
  Formulapdf(this.title);

  @override
  State<Formulapdf> createState() => _FormulapdfState();
}

class _FormulapdfState extends State<Formulapdf> {
  String url = "";
  Future<void> downloadURLExample() async {
    // .pdf remember
    String downloadURL = await firebase_storage.FirebaseStorage.instance
        .ref('Formulas/${widget.title}.PDF')
        .getDownloadURL();
    print(downloadURL);
    url = downloadURL;
    print(url);
    setState(() {});
  }

  @override
  void initState() {
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
