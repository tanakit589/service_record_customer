import 'dart:async';

import 'package:service_record/Model/Device_Info_model.dart';
import 'package:service_record/Model/Hospital_Model.dart';
import 'package:service_record/Service/AddDevice_Info_service.dart';
import 'package:service_record/Service/hospital_service.dart';

class HospitalController{
  final HospitalService services;
  List<Hospital> hospitals = List.empty();

  StreamController<bool> onSyncController= StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  HospitalController(this.services);

  Future<List<Hospital>> fetchhospitalInfo() async{
    onSyncController.add(true);
    hospitals = await services.getHospitalInfo();
    onSyncController.add(false);
    return hospitals;

  }
//  void addDevice(String date,sn,deviceName,model,
//   manufacturer,hospital,department,contact ) async{
//     services.addDevice( date, sn, deviceName, model, manufacturer, hospital, department, contact);
//   }
}