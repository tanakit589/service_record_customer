import 'dart:async';


import 'package:service_record/Model/FindError_model.dart';
import 'package:service_record/Service/FindError_service.dart';






class FindErrorController{
  final FindErrorService services;
  List<FindError> finderrors = List.empty();

  StreamController<bool> onSyncController= StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  FindErrorController(this.services);

  Future<List<FindError>> fetchdeviceModelInfo(String name,errorcode) async{
    onSyncController.add(true);
    finderrors = await services.getdeviceModelInfo(name,errorcode);
    onSyncController.add(false);
    return finderrors;

  }
//  void addDevice(String date,sn,deviceName,model,
//   manufacturer,hospital,department,contact ) async{
//     services.addDevice( date, sn, deviceName, model, manufacturer, hospital, department, contact);
//   }
}