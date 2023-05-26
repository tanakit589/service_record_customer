

import 'dart:async';

import 'package:service_record/Model/Job_Data_model.dart';
import 'package:service_record/Service/Job_Data_service.dart';



class Job_Data_Controller{
  final AddJob_DataService services;
  List<AddJob_Data> addDevices = List.empty();

  StreamController<bool> onSyncController= StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  Job_Data_Controller(this.services);

  Future<List<AddJob_Data>> fetch_job_data_info(String name) async{
    onSyncController.add(true);
    addDevices = await services.get_job_data_info(name);
    onSyncController.add(false);
    return addDevices;

  }
  Future<List<AddJob_Data>> fetch_job_data_latest(String name) async{
    onSyncController.add(true);
    addDevices = await services.get_job_data_latest(name);
    onSyncController.add(false);
    return addDevices;

  }

    Future<List<AddJob_Data>> fetch_job_data_search(String sn,name) async{
    onSyncController.add(true);
    addDevices = await services.get_job_data_search(sn,name);
    onSyncController.add(false);
    return addDevices;

  }
  Future<List<AddJob_Data>> fetch_job_data_Completed(String name) async{
    onSyncController.add(true);
    addDevices = await services.get_job_data_Completed(name);
    onSyncController.add(false);
    return addDevices;

  }
  Future<List<AddJob_Data>> fetch_job_data_Inprogress(String name) async{
    onSyncController.add(true);
    addDevices = await services.get_job_data_Inprogress(name);
    onSyncController.add(false);
    return addDevices;

  }
  Future<List<AddJob_Data>> fetch_job_data_Quotation(String name) async{
    onSyncController.add(true);
    addDevices = await services.get_job_data_Quotation(name);
    onSyncController.add(false);
    return addDevices;

  }

  // Future<List<AddJob_Data>> fetch_job_data_info_service() async{
  //   onSyncController.add(true);
  //   addDevices = await services.get_job_data_info_service();
  //   onSyncController.add(false);
  //   return addDevices;

  // }
Future<String> add_job_data(String id, date,sn,device_name,
  hospital,department,detail,error_code,model,contact,contact_no,imageUrl ,List status ,String servicereport_id) async{
  String docref= await services.add_job_data( id,date,sn,device_name,
  hospital,department,detail,error_code,model,contact,contact_no,imageUrl,status,servicereport_id);

  return docref;

  }
 
   void updateimageUrl(String docref,imageUrl) async{
    services.updateimageUrl(docref, imageUrl);
  }
}