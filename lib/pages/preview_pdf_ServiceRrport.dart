import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
import 'package:service_record/Controller/CheckList_Istat1_controller.dart';
import 'package:service_record/Model/Checklist_Istat1_model.dart';
import 'package:service_record/Service/CheckList_Istat1_service.dart';
import 'package:service_record/pages/History/ListReport.dart';

import 'package:service_record/pages/HomePage_customer.dart';

import 'export_pdf_ServiceReport.dart';

class PdfPreviewPage extends StatefulWidget {
  final ServiceReportPDF servicemodel;

  const PdfPreviewPage({
    super.key,
    required this.servicemodel,
  });

  @override
  State<PdfPreviewPage> createState() => _PdfPreviewPageState();
}

class _PdfPreviewPageState extends State<PdfPreviewPage> {
  
   Checklist_Istat1Controller controller =
      Checklist_Istat1Controller(Checklist_Istat1Service());
  List<Checklist_Istat1> List_checklist = List.empty();

  String _jobid = '';

  bool isLoading = false;
  void initState() {
    super.initState();
    controller.onSync.listen((bool syncState) => setState(() {
          isLoading = syncState;
        }));
    print(context.read<CustomerDeviceData>().jobid);
    _jobid = context.read<CustomerDeviceData>().jobid;
    _getChecklist(_jobid);
  }

  void _getChecklist(String jobId) async {
    var newjob_data = await controller.fetchChecklist(jobId);
    setState(() {
      List_checklist = newjob_data;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PDF Preview'),
          actions: [
           
             GestureDetector(
              child: IconButton(
            onPressed: () {Navigator.popUntil(context, ModalRoute.withName('/homepage'));},
            icon: Icon(Icons.home),
            iconSize: 30,
          )),
         
        

          ],
        ),
        body: PdfPreview(
          build: (context) {
           
            return makePdf(widget.servicemodel);
          },
        ));
  }
}
