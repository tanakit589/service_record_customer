import 'dart:async';

import 'package:service_record/Model/Device.dart';
import 'package:service_record/Model/DeviceModel.dart';
import 'package:service_record/Service/DeviceModel_service.dart';





class DeviceModelController{
  final DeviceModelService services;
  List<DeviceModel> deviceModels = List.empty();

  StreamController<bool> onSyncController= StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  DeviceModelController(this.services);

  Future<List<DeviceModel>> fetchdeviceModelInfo(String name) async{
    onSyncController.add(true);
    deviceModels = await services.getdeviceModelInfo(name);
    onSyncController.add(false);
    return deviceModels;

  }
//  void addDevice(String date,sn,deviceName,model,
//   manufacturer,hospital,department,contact ) async{
//     services.addDevice( date, sn, deviceName, model, manufacturer, hospital, department, contact);
//   }
}