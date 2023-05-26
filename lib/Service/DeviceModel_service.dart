

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:service_record/Model/Device.dart';
import 'package:service_record/Model/DeviceModel.dart';





class DeviceModelService{
  Future<List<DeviceModel>> getdeviceModelInfo(String name) async{
    QuerySnapshot snapshot= 
    await FirebaseFirestore.instance.collection('Model')
    .where('DeviceName',isEqualTo: name)
    .get();

    AllDeviceModel deviceModels = AllDeviceModel.fromSnapshot(snapshot);
    return deviceModels.deviceModels;


  }
 

}