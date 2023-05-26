import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

import 'package:service_record/pages/ListChecklist.dart';
import 'package:service_record/pages/export_pdf_Checklist.dart';




class PdfviewChecklist extends StatelessWidget {
  final ChecklistPDF checklistmodel;

  const PdfviewChecklist({
    super.key,
    required this.checklistmodel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PDF Preview'),
          actions: [
             GestureDetector(
              child: IconButton(
            onPressed: () {
             Navigator.popUntil(context, ModalRoute.withName('/homepage'));
              },
            icon: Icon(Icons.home),
              
          )),
          ],
        ),
        body: PdfPreview(
          build: (context) {
          print(checklistmodel.no1);
          print(checklistmodel.no2_Clew);
            return makePdfChecklist(checklistmodel);
          },
        )
        );
  }
}

