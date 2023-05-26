import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:service_record/Controller/service_report_controller.dart';

import 'package:service_record/Model/service_report_model.dart';

import 'package:service_record/Service/service_report_service.dart';
import 'package:service_record/pages/History/History.dart';
import 'package:service_record/pages/HomePage_customer.dart';
import 'package:service_record/pages/preview_pdf_ServiceRrport.dart';

import 'package:service_record/widgets/drawer.dart';

class ListReport extends StatefulWidget {
  @override
  State<ListReport> createState() => _ListJobSearchState();
}

class _ListJobSearchState extends State<ListReport> {
  
  ServiceReportController controller =
      ServiceReportController(ServiceReportService());
List<ServiceReportModel> List_report = List.empty();
 
  String _jobid = '';

  bool isLoading = false;
  void initState() {
    super.initState();
    controller.onSync.listen((bool syncState) => setState(() {
          isLoading = syncState;
        }));
   
    _jobid = context.read<CustomerDeviceData>().jobid;
    _get_service_report(_jobid);
    
  }

 void _get_service_report(String jobId) async {
    var newjob_data =
        await controller.fetch_service_report(jobId);
    setState(() {
      List_report = newjob_data;
List_report.sort((a, b) => b.date.compareTo(a.date));    });
  }

Widget get searchJob => isLoading
      ? CircularProgressIndicator()
      : Scrollbar(
         thumbVisibility: true,
        thickness: 8,
        child: ListView.separated(
            itemCount: !List_report.isEmpty ? List_report.length : 1,
            separatorBuilder: (BuildContext context, int index) => const Divider(
                  color: Color.fromARGB(255, 125, 125, 125),
                 thickness: 2,
                ),
            itemBuilder: (context, index) {
              if (!List_report.isEmpty) {
                return ListTile(
                    onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PdfPreviewPage(
                                servicemodel: ServiceReportPDF(
                              customer_name: List_report[index].customer_name,
                              department:
                                  List_report[index].department,
                              model:List_report[index].model,
                              contract:
                                 List_report[index].contract,
                              contract_no:
                                 List_report[index].contract_no,
                              sn: List_report[index].sn,
                              manufacturer: List_report[index].manufacturer,
                              Installation: List_report[index].Installation,
                              Commissioning:List_report[index].Commissioning,
                              ServiceContract: List_report[index].ServiceContract,
                              Warranty:
                                 List_report[index].Warranty,
                              ServiceCall:List_report[index].ServiceCall,
                              PM:List_report[index].PM,
                              Workshop:
                                  List_report[index].Workshop,
                              Internal:
                                  List_report[index].Internal,
                              status: List_report[index].status,
                              fault: List_report[index].fault,
                              workdone: List_report[index].workdone,
                              remark: List_report[index].remark,
                              partnumber1:
                                  List_report[index].partnumber1,
                              partname1: List_report[index].partname1,
                              partnumber2:
                                  List_report[index].partnumber2,
                              partname2: List_report[index].partname2,
                              partnumber3:
                                  List_report[index].partnumber3,
                              partname3: List_report[index].partname3,
                              partnumber4:
                                  List_report[index].partnumber4,
                              partname4: List_report[index].partname4,
                              cussignUrl: List_report[index].cussignUrl,
                              date: List_report[index].date,
                              time: List_report[index].time,
                              servicename: List_report[index].servicename,
                            )),
                          ));},
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Fault : ${List_report[index].fault}'),
                        Text('Date : ${List_report[index].date}'),
                        
                      ],
                    ),
                    trailing: IconButton(
                     onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PdfPreviewPage(
                                servicemodel: ServiceReportPDF(
                              customer_name: List_report[index].customer_name,
                              department:
                                  List_report[index].department,
                              model:List_report[index].model,
                              contract:
                                 List_report[index].contract,
                              contract_no:
                                 List_report[index].contract_no,
                              sn: List_report[index].sn,
                              manufacturer: List_report[index].manufacturer,
                              Installation: List_report[index].Installation,
                              Commissioning:List_report[index].Commissioning,
                              ServiceContract: List_report[index].ServiceContract,
                              Warranty:
                                 List_report[index].Warranty,
                              ServiceCall:List_report[index].ServiceCall,
                              PM:List_report[index].PM,
                              Workshop:
                                  List_report[index].Workshop,
                              Internal:
                                  List_report[index].Internal,
                              status: List_report[index].status,
                              fault: List_report[index].fault,
                              workdone: List_report[index].workdone,
                              remark: List_report[index].remark,
                              partnumber1:
                                  List_report[index].partnumber1,
                              partname1: List_report[index].partname1,
                              partnumber2:
                                  List_report[index].partnumber2,
                              partname2: List_report[index].partname2,
                              partnumber3:
                                  List_report[index].partnumber3,
                              partname3: List_report[index].partname3,
                              partnumber4:
                                  List_report[index].partnumber4,
                              partname4: List_report[index].partname4,
                              cussignUrl: List_report[index].cussignUrl,
                              date: List_report[index].date,
                              time: List_report[index].time,
                              servicename: List_report[index].servicename,
                            )),
                          ));},
                      icon: Icon(Icons.description),
                    ));
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('No report now',
                     style: TextStyle(fontSize: 20),),
                  ],
                );
              }
            }),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Found ${List_report.length} reports'
       ),
      ),
      drawer: drawer(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
                          boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 192, 192, 192),
                                    blurRadius: 5,
                                    blurStyle: BlurStyle.outer)
                              ],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 1)),
          child: searchJob),
      ),
    );
  }
}

class ServiceReportPDF {
  final String customer_name;
  final String department;
  final String model;
  final String contract;
  final String contract_no;
  final String sn;
  final String manufacturer;
  final bool Installation;
  final bool Commissioning;
  final bool ServiceContract;
  final bool Warranty;
  final bool ServiceCall;
  final bool PM;
  final bool Workshop;
  final bool Internal;
  final List status;
  final String fault;
  final String workdone;
  final String remark;
  final String partnumber1;
  final String partname1;
  final String partnumber2;
  final String partname2;
  final String partnumber3;
  final String partname3;
  final String partnumber4;
  final String partname4;
  String cussignUrl = '<>';
  final String date;
  final String time;
  final String servicename;

  ServiceReportPDF({
    required this.customer_name,
    required this.department,
    required this.model,
    required this.contract,
    required this.contract_no,
    required this.sn,
    required this.manufacturer,
    required this.Installation,
    required this.Commissioning,
    required this.ServiceContract,
    required this.Warranty,
    required this.ServiceCall,
    required this.PM,
    required this.Workshop,
    required this.Internal,
    required this.status,
    required this.fault,
    required this.workdone,
    required this.remark,
    required this.partnumber1,
    required this.partname1,
    required this.partnumber2,
    required this.partname2,
    required this.partnumber3,
    required this.partname3,
    required this.partnumber4,
    required this.partname4,
    required this.cussignUrl,
    required this.date,
    required this.time,
    required this.servicename,
  });
}

