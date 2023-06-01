import 'package:cloud_firestore/cloud_firestore.dart';


class AddDevice {
  String id;
  final String date;
  final String sn;
  final String device_name;
  final String model;
  final String manufacturer;
  final String hospital;
  final String department;
  final String contact;

  AddDevice(this.id,this.date,this.sn,this.device_name,this.model,
  this.manufacturer,this.hospital,this.department,this.contact);

  factory AddDevice.fromJson(Map<String,dynamic> json){
  return AddDevice(
  json['id'] as String,
  json['date'] as String,
  json['sn'] as String,
  json['device_name'] as String,
  json['model'] as String,
  json['manufacturer'] as String,
  json['hospital'] as String,
  json['department'] as String,
  json['contact'] as String
  );
  }
}

class AllAddDevice{
  final List<AddDevice> addDevices;

  AllAddDevice(this.addDevices);

  factory AllAddDevice.fromJson(List<dynamic> json){
    List<AddDevice> addDevices;
    addDevices= json.map((index) => AddDevice.fromJson(index)).toList();
    return AllAddDevice(addDevices);
  
  }
  factory AllAddDevice.fromSnapshot(QuerySnapshot s){
    List<AddDevice> addDevices = s.docs.map((DocumentSnapshot ds){
      AddDevice addDevice= AddDevice.fromJson(ds.data() as Map<String, dynamic>);
      addDevice.id=ds.id;
      return addDevice;
    }).toList();
    return AllAddDevice(addDevices);
  }


}