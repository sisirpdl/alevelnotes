import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import './Download.dart';
import 'package:open_file/open_file.dart';

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
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await showDialog(
                    context: context,
                    builder: (context) => DownloadDialog(
                        widget.title, widget.month, widget.year));

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Row(
                    children: [
                      const Text('File succesfully added to downloads!'),
                      Expanded(
                          child: TextButton(
                        onPressed: (() {
                          OpenFile.open("/sdcard/download/${widget.title}.pdf");
                        }),
                        child: const Text('Open'),
                      ))
                    ],
                  ),
                  duration: const Duration(seconds: 2),
                ));
              },
              icon: const Icon(Icons.download))
        ],
      ),
      body: Container(
        child: url.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : SfPdfViewer.network(url),
      ),
    );
  }
}
