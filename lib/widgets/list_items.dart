import 'package:flutter/material.dart';
// import '/widgets/DownloadDialog.dart';

class ListItems extends StatefulWidget {
  // this was stateless widget. Change it back if url doesnt work.
  final String? title;
  final int? num;
  ListItems({@required this.num, @required this.title});

  @override
  State<ListItems> createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {
  void onpressed(BuildContext context) {
    Navigator.of(context)
        .pushNamed('/reader_screen', arguments: {'title': widget.title});
  }

  @override
  Widget build(BuildContext context) {
    // listscreen basically. the widget section.
    return InkWell(
        onTap: () => onpressed(context),
        child: ListTile(
          leading: Text(widget.num.toString()),
          title: Text(widget.title!),
        ));
  }
}
