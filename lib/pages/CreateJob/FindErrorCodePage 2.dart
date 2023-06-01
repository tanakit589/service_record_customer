// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'package:service_record/Controller/FindError_controller.dart';
import 'package:service_record/Model/FindError_model.dart';
import 'package:service_record/Service/FindError_service.dart';
import 'package:service_record/pages/CreateJob/FindErrorCodePage%201.dart';
import 'package:service_record/pages/CreateJob/CreateJobPage%201.dart';

class CreateJobPage2 extends StatefulWidget {
  @override
  State<CreateJobPage2> createState() => _CreateJobPage2State();
}

class _CreateJobPage2State extends State<CreateJobPage2> {
  List<FindError> finderror = List.empty();

  bool isLoading = false;
  String name ='';
    String errorcode='';

  FindErrorController controller = FindErrorController(FindErrorService());
  void initState() {
    super.initState();
    controller.onSync.listen((bool syncState) => setState(() {
          isLoading = syncState;
        }));
     name = context.read<CreateJobmodel>().DeviceName;
     errorcode = context.read<CreateJobmodel>().errorcode;
    _getdeviceModelInfo(name, errorcode);
  }

  void _getdeviceModelInfo(String name, errorcode) async {
    var newfinderror = await controller.fetchdeviceModelInfo(name, errorcode);
    setState(() {
      finderror = newfinderror;
    });
  }

  final _formkey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find error code '),
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
                  child: Consumer<CreateJobmodel>(
                      builder: (context, value, child) {
                    return Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 200, 200, 200),
                            blurRadius: 1,
                                blurStyle: BlurStyle.outer)
                          ],
                         ),
                      child: TextFormField(
                        initialValue: '${value.errorcode}',
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Error code',
                          hintText: 'Error code',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              print(errorcode);
                              print(name);
                              _getdeviceModelInfo(name, errorcode);
                            },
                          ),
                        ),
                        onChanged: ((newValue) {
                          setState(() {
                            errorcode = newValue;
                          });
                        }),
                      ),
                    );
                  }),
                ),
                Container(
                  height: 400,
                  child: ListView.builder(
                      itemCount: !finderror.isEmpty ? finderror.length : 1,
                      itemBuilder: (context, index) {
                        if (!finderror.isEmpty) {
                          return InkWell(
                            //   onTap: (){
                            //     context.read<DeviceModel_Model>().Model= '${deviceModel[index].Model}';

                            //      Navigator.pop(context, '${deviceModel[index].Model}' );
                            //      print ('${deviceModel[index].Model}');

                            // },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Container(
                                    width: 500,
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 151, 150, 150),
                                            blurRadius: 5,
                                            blurStyle: BlurStyle.outer)
                                      ],
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        'Error Description :  ${finderror[index].description}',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Container(
                                    width: 500,
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 151, 150, 150),
                                            blurRadius: 5,
                                            blurStyle: BlurStyle.outer)
                                      ],
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        'Solution : ${finderror[index].solution}',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Error not found',style: TextStyle(
                  fontSize: 18,
                    
                ),),
                            ),
                            ],
                          );
                        }
                      }),
                ),
                Text('If cannot solve please goto create Job',style: TextStyle(
                  fontSize: 18,
                    fontWeight: FontWeight.bold
                ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.popUntil(
                                context, ModalRoute.withName('/homepage'));
                          },
                          child: Text('Go to Home')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                             context.read<CreateJobmodel>().errorcode=errorcode;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateJobPage3()));
                          },
                          child: Text('Create Job')),
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
