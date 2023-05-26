import 'dart:async';

import 'package:service_record/Model/AddDevice_Info_model.dart';
import 'package:service_record/Service/AddDevice_Info_service.dart';

class AddDeviceController{
  final AddDeviceService services;
  List<AddDevice> addDevices = List.empty();

  StreamController<bool> onSyncController= StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  AddDeviceController(this.services);
 
 Future<List<AddDevice>> fetchDeviceInfo_cust( String name) async{
    onSyncController.add(true);
    addDevices = await services.getDevice_InforInfo_cust(name);
    onSyncController.add(false);
    return addDevices;

  }
  

  Future<List<AddDevice>> fetchDeviceInfo(String sn) async{
    onSyncController.add(true);
    addDevices = await services.getDevice_InforInfo(sn);
    onSyncController.add(false);
    return addDevices;

  }
 void addDevice(String date,sn,device_name,model,
  manufacturer,hospital,department,contact ) async{
    services.addDevice( date, sn, device_name, model, manufacturer, hospital, department, contact);
  }
}