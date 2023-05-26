import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:service_record/Controller/Job_Data_controller.dart';
import 'package:service_record/Service/Job_Data_service.dart';
import 'package:service_record/pages/CreateJob/Page1.dart';

class CreateJobPage3 extends StatefulWidget {
  @override
  State<CreateJobPage3> createState() => _CreateJobPage3State();
}

class _CreateJobPage3State extends State<CreateJobPage3> {
  String detail = '';
  String sn = '';
  String device_name = '';
  String hospital = '';
  String department = '';
  String error_code = '';
  String model = '';
  String contact = '';
  String contact_no = '';
  String imageUrl = '';
  String status = '';
  String _id = '';
  final String date = DateTime.now().toString();
  Job_Data_Controller controller = Job_Data_Controller(AddJob_DataService());
  Job_Data_Controller controller_update =
      Job_Data_Controller(AddJob_DataService());

  void initStae() {
    super.initState();
  }

  Future<String> add_job_data(
      String id,
      date,
      sn,
      device_name,
      hospital,
      department,
      detail,
      error_code,
      model,
      contact,
      contact_no,
      imageUrl,
      List status,
      String servicereport_id) async {
    String docref = await controller.add_job_data(
        id,
        date,
        sn,
        device_name,
        hospital,
        department,
        detail,
        error_code,
        model,
        contact,
        contact_no,
        imageUrl,
        status,
        servicereport_id);
    return docref;
  }

 String control= '';
   File _imageFile = File('.');


  Future _getFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        control=pickedFile.toString();
      });
    }
  }

  uploadImage(String docref) async {
    final _firebaseStorage = FirebaseStorage.instance;
    var snapshot = await _firebaseStorage
        .ref('/Image_Error')
        .child('${docref}')
        .putFile(_imageFile);
    var downloadUrl = await snapshot.ref.getDownloadURL();

    setState(() {
      imageUrl = downloadUrl;
      print('${downloadUrl}');
    });
  }

  void _updateimageUrl(String docref, imageUrl) async {
    controller_update.updateimageUrl(docref, imageUrl);
  }

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Job '),
        ),
        body: SingleChildScrollView(
          child: Form(
              key: _formkey,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<CreateJobmodel>(
                      builder: (context, value, child) {
                    return Column(children: [
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
                              borderRadius: BorderRadius.circular(10),
                             ),
                          child: TextFormField(
                            initialValue: '${value.SerialNumber}',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Serial Number',
                              hintText: 'Serial Number',
                            ),
                            onSaved: ((newValue) {
                              sn = newValue!;
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
                              borderRadius: BorderRadius.circular(10),
                             ),
                          child: TextFormField(
                            readOnly: true,
                            initialValue: '${value.DeviceName}',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Device Name',
                              hintText: 'Device Name',
                            ),
                            onSaved: ((newValue) {
                              device_name = newValue!;
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
                              borderRadius: BorderRadius.circular(10),
                             ),
                          child: TextFormField(
                            initialValue: '${value.HospitalName}',
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Hospital',
                              hintText: 'hospital',
                            ),
                            onSaved: ((newValue) {
                              hospital = newValue!;
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
                              borderRadius: BorderRadius.circular(10),
                              ),
                          child: TextFormField(
                            readOnly: true,
                            initialValue: '${value.Department}',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Department',
                              hintText: 'Department',
                            ),
                            onSaved: ((newValue) {
                              department = newValue!;
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
                              borderRadius: BorderRadius.circular(10),
                             ),
                          child: TextFormField(
                            initialValue: '${value.errorcode}',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Error code',
                              hintText: 'Error code',
                            ),
                            onSaved: ((newValue) {
                              error_code = newValue!;
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
                              borderRadius: BorderRadius.circular(10),
                              ),
                          child: TextFormField(
                            // initialValue: '${value.errorcode}',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Contact',
                              hintText: 'Contact',
                            ),
                            onSaved: ((newValue) {
                              contact = newValue!;
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
                              borderRadius: BorderRadius.circular(10),
                              ),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            // initialValue: '${value.errorcode}',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Contact No.',
                              hintText: 'Contact No.',
                            ),
                            onSaved: ((newValue) {
                              contact_no = newValue!;
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
                              borderRadius: BorderRadius.circular(10),
                              ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Detail',
                              hintText: 'Detail',
                              labelStyle: TextStyle(fontSize: 20),
                            ),
                            maxLines: 7,
                            scrollPhysics: const BouncingScrollPhysics(),
                            onSaved: ((newValue) {
                              detail = newValue!;
                            }),
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                          onPressed: () {
                            print(_imageFile);
                            _getFromGallery();
                          },
                          icon: Icon(Icons.image),
                          label: Text('Add image')),
                    if (control.isNotEmpty)  ...[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            // height: 400,
                            // width: 500,
                            decoration: (BoxDecoration(border: Border.all())),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.file(
                                _imageFile,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ] else if (control.isEmpty) ...[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                              height: 100,
                              width: 150,
                              decoration:
                                  BoxDecoration(border: Border.all(width: 2)),
                              child: Center(child: Text('No Selected Image.'))),
                        ),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: () async {
                                  if (_formkey.currentState!.validate()) {
                                    _formkey.currentState!.save();

                                    final String docref = await add_job_data(
                                        '',
                                        date,
                                        sn,
                                        device_name,
                                        hospital,
                                        department,
                                        detail,
                                        error_code,
                                        model = context
                                            .read<CreateJobmodel>()
                                            .model,
                                        contact,
                                        contact_no,
                                        '',
                                        [],
                                        '');
                               ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Create Request Success',
            style: TextStyle(fontSize: 16),)));
                                   if (control.isNotEmpty) {
                                      await uploadImage(docref);
                                      _updateimageUrl(docref, imageUrl);
                                      Navigator.popUntil(context,
                                          ModalRoute.withName('/homepage'));
                                    } else if (control.isEmpty) {
                                      _updateimageUrl(docref, imageUrl);
                                      Navigator.popUntil(context,
                                          ModalRoute.withName('/homepage'));
                                    }
                     
                                   

                                  }
                                },
                                child: Text('Create Job')),
                          ),
                        ],
                      )
                    ]);
                  }))),
        ));
  }
}
