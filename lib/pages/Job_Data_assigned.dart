import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';
import 'package:service_record/Controller/CheckList_Istat1_controller.dart';
import 'package:service_record/Model/Checklist_Istat1_model.dart';
import 'package:service_record/Service/CheckList_Istat1_service.dart';
import 'package:service_record/pages/CreateJob/Page1.dart';
import 'package:service_record/pages/History/ListReport.dart';
import 'package:service_record/pages/HomePage_customer.dart';
import 'package:service_record/pages/ListChecklist.dart';

import 'package:service_record/widgets/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class JobData_Assigned extends StatefulWidget {
  @override
  State<JobData_Assigned> createState() => _JobData_AssignedState();
}

class _JobData_AssignedState extends State<JobData_Assigned> {
  Future<void> _dialNumber(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Checklist_Istat1Controller controller =
      Checklist_Istat1Controller(Checklist_Istat1Service());
  List<Checklist_Istat1> checklist_istat1s = List.empty();

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

  void _getChecklist(String jobid) async {
    var newjob_data = await controller.fetchChecklist(jobid);
    setState(() {
      checklist_istat1s = newjob_data;
    });
  }

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Job Data '),
        ),
        body: SingleChildScrollView(
          child: Form(
              key: _formkey,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<CustomerDeviceData>(
                      builder: (context, value, child) {
                    return Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 200, 200, 200),
                                blurRadius: 1,
                                blurStyle: BlurStyle.outer)
                          ]),
                          child: TextFormField(
                            readOnly: true,
                            initialValue: '${value.sn}',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Serial Number',
                              hintText: 'Serial Number',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 200, 200, 200),
                                blurRadius: 1,
                                blurStyle: BlurStyle.outer)
                          ]),
                          child: TextFormField(
                            readOnly: true,
                            initialValue: '${value.device_name}',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Device Name',
                              hintText: 'Device Name',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 200, 200, 200),
                                blurRadius: 1,
                                blurStyle: BlurStyle.outer)
                          ]),
                          child: TextFormField(
                            initialValue: '${value.hospital}',
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Hospital',
                              hintText: 'hospital',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 200, 200, 200),
                                  blurRadius: 1,
                                  blurStyle: BlurStyle.outer)
                            ],
                          ),
                          child: TextFormField(
                            readOnly: true,
                            initialValue: '${value.department}',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Department',
                              hintText: 'Department',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 200, 200, 200),
                                blurRadius: 1,
                                blurStyle: BlurStyle.outer)
                          ]),
                          child: TextFormField(
                            readOnly: true,
                            initialValue: '${value.error_code}',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Fault',
                              hintText: 'Fault',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 200, 200, 200),
                                  blurRadius: 1,
                                  blurStyle: BlurStyle.outer)
                            ],
                          ),
                          child: TextFormField(
                            readOnly: true,
                            initialValue: '${value.contact}',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Contact',
                              hintText: 'Contact ',
                              labelStyle: TextStyle(fontSize: 20),
                            ),
                            scrollPhysics: const BouncingScrollPhysics(),
                            onSaved: ((newValue) {
                              //    = newValue!;
                            }),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 200, 200, 200),
                                  blurRadius: 1,
                                  blurStyle: BlurStyle.outer)
                            ],
                          ),
                          child: TextFormField(
                            readOnly: true,
                            initialValue: '${value.contact_no}',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Contact No.',
                              hintText: 'Contact No.',
                              labelStyle: TextStyle(fontSize: 20),
                            ),
                            scrollPhysics: const BouncingScrollPhysics(),
                            onSaved: ((newValue) {
                              //    = newValue!;
                            }),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 200, 200, 200),
                                blurRadius: 1,
                                blurStyle: BlurStyle.outer)
                          ]),
                          child: TextFormField(
                            readOnly: true,
                            initialValue: '${value.detail}',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Detail',
                              hintText: 'Detail',
                              labelStyle: TextStyle(fontSize: 20),
                            ),
                            maxLines: 4,
                            scrollPhysics: const BouncingScrollPhysics(),
                            onSaved: ((newValue) {
                              //    = newValue!;
                            }),
                          ),
                        ),
                      ),
                      if (value.status.isEmpty) ...[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(),
                        ),
                      ] else if (value.status.isNotEmpty) ...[
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              child: Container(
                                height: 50,
                                width: 400,
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromARGB(
                                              255, 116, 107, 107),
                                          blurRadius: 2,
                                          blurStyle: BlurStyle.outer)
                                    ]),
                                child: Row(
                                  children: [
                                    Text(
                                      '  Status : ',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    for (var i = 0; i < 3; i++)
                                      if (i == 0) ...[
                                        Text(
                                          value.status[i]['value'] == true
                                              ? "Completed"
                                              : "  ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ] else if (i == 1) ...[
                                        Text(
                                          value.status[i]['value'] == true
                                              ? "In Progress"
                                              : "  ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ] else if (i == 2) ...[
                                        Text(
                                          value.status[i]['value'] == true
                                              ? "Quotation"
                                              : "  ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                  ],
                                ),
                              ),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary:
                                              Colors.orange, // Background color
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ListReport()));
                                        },
                                        child: Text('View Report')),
                                  ),
                                  if (checklist_istat1s.isNotEmpty) ...[
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors
                                                .orange, // Background color
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ListChecklist()));
                                          },
                                          child: Text('View Checklist')),
                                    ),
                                  ] else if (checklist_istat1s.isEmpty) ...[
                                    Container()
                                  ]
                                ]),
                          ],
                        )
                      ],
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('back')),
                          ),
                        ],
                      )
                    ]);
                  }))),
        ));
  }
}

