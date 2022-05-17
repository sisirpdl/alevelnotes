import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DownloadDialog extends StatefulWidget {
  final String? title;
  final String? month;
  final String? year;
  DownloadDialog(this.title, this.month, this.year);

  @override
  State<DownloadDialog> createState() => _DownloadDialogState();
}

class _DownloadDialogState extends State<DownloadDialog> {
  Dio dio = Dio();
  double progress = 0.0;

  void startdownloading() async {
    String downloadURL = await firebase_storage.FirebaseStorage.instance
        .ref(
            'Past Papers Math/${widget.year}/${widget.month}/${widget.title}.pdf')
        .getDownloadURL();
    print(downloadURL);

    // setState(() {});

    String? filename = widget.title;
    String path = await _getfilePath(filename);

    await dio.download(downloadURL, path, onReceiveProgress: (count, total) {
      setState(() {
        progress = count / total;
      });
      print(progress.toInt());
    }, deleteOnError: true).then((value) => Navigator.pop(context));
  }

  Future<String> _getfilePath(String? filename) async {
    final dir = await getApplicationDocumentsDirectory();
    print(dir);
    // return "${dir.path}/$filename";
    return "/sdcard/download/$filename.pdf";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startdownloading();
    print('ALl DOne');
  }

  @override
  Widget build(BuildContext context) {
    String downloadingprogress = (progress.toInt() * 100).toString();
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        const CircularProgressIndicator.adaptive(),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Downloading : $downloadingprogress%",
          style: TextStyle(fontSize: 17),
        )
      ]),
    );
  }
}