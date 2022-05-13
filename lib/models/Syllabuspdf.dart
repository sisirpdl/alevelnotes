import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Syllabuspdf extends StatefulWidget {
  final String title;
  Syllabuspdf(this.title);

  @override
  State<Syllabuspdf> createState() => _SyllabuspdfState();
}

class _SyllabuspdfState extends State<Syllabuspdf> {
  String url = "";
  Future<void> downloadURLExample() async {
    String downloadURL = await firebase_storage.FirebaseStorage.instance
        .ref('Syllabus/${widget.title}.pdf')
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
