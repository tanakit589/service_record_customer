import 'package:cloud_firestore/cloud_firestore.dart';


class Device {
  String id;
  final String name;
  final String manufacturer;
  

  Device(this.id,this.name,this.manufacturer);

  factory Device.fromJson(Map<String,dynamic> json){
  return Device(
    json['id'] as String, 
  json['name'] as String,
  json['manufacturer'] as String,
   
  );
  }
}

class AllDevice{
  final List<Device> devices;

  AllDevice(this.devices);

  factory AllDevice.fromJson(List<dynamic> json){
    List<Device> devices;
    devices= json.map((index) => Device.fromJson(index)).toList();
    return AllDevice(devices);
  
  }
  factory AllDevice.fromSnapshot(QuerySnapshot s){
    List<Device> devices = s.docs.map((DocumentSnapshot ds){
      Device device= Device.fromJson(ds.data() as Map<String, dynamic>);
      device.id=ds.id;
      return device;
    }).toList();
    return AllDevice(devices);
  }


}