import 'dart:async';

import 'package:flutter/material.dart';
import 'package:service_record/Model/Checklist_Istat1_model.dart';
import 'package:service_record/Service/CheckList_Istat1_service.dart';

class Checklist_Istat1Controller {
  final Checklist_Istat1Service services;
  List<Checklist_Istat1> checklist_istat1s = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  Checklist_Istat1Controller(this.services);
    
    Future<List<Checklist_Istat1>> fetchChecklist(String jobId) async{
    onSyncController.add(true);
    checklist_istat1s = await services.getChecklist(jobId);
    onSyncController.add(false);
    return checklist_istat1s;

  }


}