import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ServiceReportModel {
  String id;
  final String customer_name;
  final String department;
  final String model;
  final String contract;
  final String contract_no;
  final String sn;
  final String manufacturer;
  final bool Installation;
  final bool Commissioning;
  final bool ServiceContract;
  final bool Warranty;
  final bool ServiceCall;
  final bool PM;
  final bool Workshop;
  final bool Internal;
  final List status;
  final String fault;
  final String workdone;
  final String remark;
  final String partnumber1;
  final String partname1;
  final String partnumber2;
  final String partname2;
  final String partnumber3;
  final String partname3;
  final String partnumber4;
  final String partname4;
  final String cussignUrl;
  final String date;
  final String time;
  final String servicename;
  final String jobId;

  ServiceReportModel(
      this.id,
      this.customer_name,
      this.department,
      this.model,
      this.contract,
      this.contract_no,
      this.sn,
      this.manufacturer,
      this.Installation,
      this.Commissioning,
      this.ServiceContract,
      this.Warranty,
      this.ServiceCall,
      this.PM,
      this.Workshop,
      this.Internal,
      this.status,
      this.fault,
      this.workdone,
      this.remark,
      this.partnumber1,
      this.partname1,
      this.partnumber2,
      this.partname2,
      this.partnumber3,
      this.partname3,
      this.partnumber4,
      this.partname4,
      this.cussignUrl,
      this.date,
      this.time,
      this.servicename,
      this.jobId);

  factory ServiceReportModel.fromJson(Map<String, dynamic> json) {
    return ServiceReportModel(
      json['id'] as String,
      json['customer_name'] as String,
      json['department'] as String,
      json['model'] as String,
      json['contract'] as String,
      json['contract_no'] as String,
      json['sn'] as String,
      json['manufacturer'] as String,
      json['Installation'] as bool,
      json['Commissioning'] as bool,
      json['ServiceContract'] as bool,
      json['Warranty'] as bool,
      json['ServiceCall'] as bool,
      json['PM'] as bool,
      json['Workshop'] as bool,
      json['Internal'] as bool,
      json['status'] as List,
      json['fault'] as String,
      json['workdone'] as String,
      json['remark'] as String,
      json['partnumber1'] as String,
      json['partname1'] as String,
      json['partnumber2'] as String,
      json['partname2'] as String,
      json['partnumber3'] as String,
      json['partname3'] as String,
      json['partnumber4'] as String,
      json['partname4'] as String,
      json['cussignUrl'] as String,
      json['date'] as String,
      json['time'] as String,
      json['servicename'] as String,
      json['job_id'] as String,
    );
  }
}

class AllServiceReportModel {
  final List<ServiceReportModel> service_reportmodels;

  AllServiceReportModel(this.service_reportmodels);

  factory AllServiceReportModel.fromJson(List<dynamic> json) {
    List<ServiceReportModel> service_reportmodels;
    service_reportmodels =
        json.map((index) => ServiceReportModel.fromJson(index)).toList();
    return AllServiceReportModel(service_reportmodels);
  }
  factory AllServiceReportModel.fromSnapshot(QuerySnapshot s) {
    List<ServiceReportModel> service_reportmodels =
        s.docs.map((DocumentSnapshot ds) {
      ServiceReportModel service_reportmodel =
          ServiceReportModel.fromJson(ds.data() as Map<String, dynamic>);
      service_reportmodel.id = ds.id;
      return service_reportmodel;
    }).toList();
    return AllServiceReportModel(service_reportmodels);
  }
}
