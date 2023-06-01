// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:service_record/Controller/Device_Info_controller.dart';
import 'package:service_record/Model/Device_Info_model.dart';
import 'package:service_record/Service/AddDevice_Info_service.dart';
import 'dart:async';

import 'package:service_record/pages/CreateJob/FindErrorCodePage%202.dart';

class CreateJobPage1 extends StatefulWidget {
  @override
  State<CreateJobPage1> createState() => _CreateJobPage1State();
}

class _CreateJobPage1State extends State<CreateJobPage1> {
  final _formkey = GlobalKey<FormState>();
  late String _DeviceName = '';
  late String _HospitalName = '';
  late String _SerialNumber = '';
  late String _Department = '';
  late String _errorcode = '';
  late String _model = '';

  // File _imageFile = File('.');

  // Future _getFromGallery() async {
  //   final pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.gallery,
  //     maxWidth: 1800,
  //     maxHeight: 1800,
  //   );
  //   if (pickedFile != null) {
  //     setState(() {
  //       _imageFile = File(pickedFile.path);
  //     });
  //   }
  // }
  TextEditingController _hospitalController = TextEditingController();
  TextEditingController _devicenameController = TextEditingController();
  TextEditingController _departmentController = TextEditingController();
  TextEditingController _modelController = TextEditingController();

  List<AddDevice> deviceinfo = List.empty();

  bool isLoading = false;

  AddDeviceController controller = AddDeviceController(AddDeviceService());
  void initState() {
    super.initState();
    controller.onSync.listen((bool syncState) => setState(() {
          isLoading = syncState;
        }));
    // String sn = _SerialNumber;
    // String sn = context.read<CreateJobmodel>().SerialNumber;
    //_getDevice_InforInfo(sn);
  }

  void _getDevice_InforInfo(String sn) async {
//  String sn = context.read<CreateJobmodel>().SerialNumber;
    var newdeviceinfo = await controller.fetchDeviceInfo(sn);
    setState(() {
      if (newdeviceinfo.isEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Data not found',
            style: TextStyle(fontSize: 16),)));
      } else {
        deviceinfo = newdeviceinfo;
        _devicenameController.text = '${deviceinfo[0].device_name}';
        _hospitalController.text = '${deviceinfo[0].hospital}';
        _departmentController.text = '${deviceinfo[0].department}';
        _modelController.text = '${deviceinfo[0].model}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Error Code '),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
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
                        labelText: 'Serial Number',
                        hintText: 'Serial Number',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () async {
                            //  context.read<CreateJobmodel>()
                            //         ..SerialNumber = _SerialNumber;
                            await {
                              _getDevice_InforInfo(_SerialNumber),
                            };
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter Serial Number';
                        }
                        return null;
                      },
                      onChanged: ((newValue) {
                        setState(() {
                          _SerialNumber = newValue;
                        });
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
                      controller: _devicenameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Device Name',
                        hintText: 'Device Name',
                      ),
                      onSaved: ((newValue) {
                        _DeviceName = newValue!;
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
                      controller: _modelController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Model',
                        hintText: 'Model',
                      ),
                      onSaved: ((newValue) {
                        _model = newValue!;
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
                      controller: _hospitalController,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Hospital',
                        hintText: 'hospital',
                      ),
                      onSaved: ((newValue) {
                        _HospitalName = newValue!;
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
                      controller: _departmentController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Department',
                        hintText: 'Department',
                      ),
                      onSaved: ((newValue) {
                        _Department = newValue!;
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
                        labelText: 'Error Code',
                        hintText: 'Error Code',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter error code';
                        }
                        return null;
                      },
                      onSaved: ((newValue) {
                        _errorcode = newValue!;
                      }),
                    ),
                  ),
                ),
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
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              _formkey.currentState!.save();
                              context.read<CreateJobmodel>()
                                ..SerialNumber = _SerialNumber
                                ..errorcode = _errorcode
                                ..DeviceName = _DeviceName
                                ..HospitalName = _HospitalName
                                ..Department = _Department
                                ..model = _model;

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CreateJobPage2()));
                            }
                          },
                          child: Text('next')),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CreateJobmodel extends ChangeNotifier {
  String _DeviceName = '';
  String _HospitalName = '';
  String _SerialNumber = '';
  String _Department = '';
  String _errorcode = '';
  String _model = '';
  String _manufacturer = '';
  String _imageUrl = '';
  get imageUrl => this._imageUrl;

  set imageUrl(value) {
    this._imageUrl = value;
    notifyListeners();
  }

  get model => this._model;

  set model(value) {
    this._model = value;
    notifyListeners();
  }

  get manufacturer => this._manufacturer;

  set manufacturer(value) {
    this._manufacturer = value;
    notifyListeners();
  }

  get DeviceName => this._DeviceName;

  set DeviceName(value) {
    this._DeviceName = value;
    notifyListeners();
  }

  get HospitalName => this._HospitalName;

  set HospitalName(value) {
    this._HospitalName = value;
    notifyListeners();
  }

  get SerialNumber => this._SerialNumber;

  set SerialNumber(value) {
    this._SerialNumber = value;
    notifyListeners();
  }

  get Department => this._Department;

  set Department(value) {
    this._Department = value;
    notifyListeners();
  }

  get errorcode => this._errorcode;

  set errorcode(value) {
    this._errorcode = value;
    notifyListeners();
  }
}
