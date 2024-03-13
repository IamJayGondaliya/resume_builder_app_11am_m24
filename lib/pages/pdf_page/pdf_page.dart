import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:resume_builder_app/utils/globals.dart';

class PdfPage extends StatefulWidget {
  const PdfPage({super.key});

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  Future<Uint8List> getPDF() {
    //1. Create object
    pw.Document pdf = pw.Document();

    //2. Design PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text("Hello PDF"),
        ),
      ),
    );

    //3. Convert into Uint8List
    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Page"),
      ),
      body: PdfPreview(
        pdfFileName: "RESUME_${Globals.globals.name?.toUpperCase() ?? "FN_LN"}",
        build: (format) => getPDF(),
      ),
    );
  }
}
