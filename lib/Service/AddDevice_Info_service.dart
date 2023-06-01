import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:service_record/Model/Device_Info_model.dart';


class AddDeviceService{
  Future<List<AddDevice>> getDevice_InforInfo_cust(String name ) async{
    QuerySnapshot snapshot= 
    await FirebaseFirestore.instance.collection('Device_Info')
    .where('hospital',isEqualTo: name)
   
    .get();

    AllAddDevice addDevices = AllAddDevice.fromSnapshot(snapshot);
    return addDevices.addDevices;


  }
  Future<List<AddDevice>> getDevice_InforInfo(String sn) async{
    QuerySnapshot snapshot= 
    await FirebaseFirestore.instance.collection('Device_Info')
    .where('sn',isEqualTo: sn)
   
    .get();

    AllAddDevice addDevices = AllAddDevice.fromSnapshot(snapshot);
    return addDevices.addDevices;


  }
  void addDevice(String date,sn,device_name,model,
  manufacturer,hospital,department,contact )async{
    FirebaseFirestore.instance.collection('Device_Info').add({
      'id':'',
      'date':date,
      'sn': sn,
      'device_name': device_name,
      'model':model,
      'manufacturer':manufacturer,
      'hospital':hospital,
      'department': department,
      'contact':contact,
          }).then((value) => FirebaseFirestore.instance.collection('Device_Info').
          doc(value.id).update({
            'id':value.id,
          }));
  }

  // Future<List<AddDevice>> getDevice_InforInfo() async{
  //   QuerySnapshot snapshot= 
  //   await FirebaseFirestore.instance.collection('Device_Info').get();

  //   AllAddDevice addDevices = AllAddDevice.fromSnapshot(snapshot);
  //   return addDevices.addDevices;


  // }

}