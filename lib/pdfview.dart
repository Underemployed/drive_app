import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class pdfview extends StatefulWidget {
  String url;
  pdfview({
    required this.url,
  });
  @override
  State<pdfview> createState() => _pdfviewState(
        url: url,
      );
}

class _pdfviewState extends State<pdfview> {
  String url;
  _pdfviewState({
    required this.url,
  });
  @override
  Widget build(BuildContext context) {
    return SfPdfViewer.network(
      url,
    );
  }
}
// 'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',