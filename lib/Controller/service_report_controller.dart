import 'dart:async';

import 'package:flutter/material.dart';
import 'package:service_record/Model/Job_Data_model.dart';
import 'package:service_record/Model/service_report_model.dart';
import 'package:service_record/Service/Job_Data_service.dart';
import 'package:service_record/Service/service_report_service.dart';

class ServiceReportController {
  final ServiceReportService services;
  List<ServiceReportModel> service_reportmodels = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  ServiceReportController(this.services);

  Future<List<ServiceReportModel>> fetch_service_report(String jobId) async{
    onSyncController.add(true);
    service_reportmodels = await services.get_service_report(jobId);
    onSyncController.add(false);
    return service_reportmodels;

  }

}
