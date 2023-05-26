import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:service_record/Model/Job_Data_model.dart';
import 'package:service_record/Model/service_report_model.dart';

class ServiceReportService {
  Future<List<ServiceReportModel>> get_service_report(String jobId) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('ServiceReport')
        .where('job_id', isEqualTo: jobId)
        .get();
    AllServiceReportModel service_reportmodels =
        AllServiceReportModel.fromSnapshot(snapshot);
    return service_reportmodels.service_reportmodels;
  }

  
}
