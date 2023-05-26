import 'dart:async';

import 'package:service_record/Model/AddDevice_Info_model.dart';
import 'package:service_record/Model/Hospital_Model.dart';
import 'package:service_record/Model/User_Data_model.dart';
import 'package:service_record/Service/AddDevice_Info_service.dart';
import 'package:service_record/Service/User_Data_service.dart';
import 'package:service_record/Service/hospital_service.dart';

class UserDataController{
  final UserDataService services;
  List<UserData> userdatas = List.empty();

  StreamController<bool> onSyncController= StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  UserDataController(this.services);

  Future<List<UserData>> fetchUserData(String email) async{
    onSyncController.add(true);
    userdatas = await services.getUserData(email);
    onSyncController.add(false);
    return userdatas;

  }

}