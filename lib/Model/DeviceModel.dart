import 'package:cloud_firestore/cloud_firestore.dart';


class DeviceModel {
  String id;
  final String devicename;
  final String Model;
  

  DeviceModel(this.id,this.devicename,this.Model);

  factory DeviceModel.fromJson(Map<String,dynamic> json){
  return DeviceModel(
    json['id'] as String, 
  json['DeviceName'] as String,
  json['Model'] as String,
   
  );
  }
}

class AllDeviceModel{
  final List<DeviceModel> deviceModels;

  AllDeviceModel(this.deviceModels);

  factory AllDeviceModel.fromJson(List<dynamic> json){
    List<DeviceModel> deviceModels;
    deviceModels= json.map((index) => DeviceModel.fromJson(index)).toList();
    return AllDeviceModel(deviceModels);
  
  }
  factory AllDeviceModel.fromSnapshot(QuerySnapshot s){
    List<DeviceModel> deviceModels = s.docs.map((DocumentSnapshot ds){
      DeviceModel deviceModel= DeviceModel.fromJson(ds.data() as Map<String, dynamic>);
      deviceModel.id=ds.id;
      return deviceModel;
    }).toList();
    return AllDeviceModel(deviceModels);
  }


}