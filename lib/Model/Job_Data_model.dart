import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class AddJob_Data {
  String id;
  final String date;
  final String sn;
  final String device_name;
  final String hospital;
  final String department;
  final String detail;
  final String error_code;
  final String model;
  final String contact;
  final String contact_no;
  final String imageUrl;
  final List status;
   final String servicereport_id;
  
  AddJob_Data(this.id, this.date, this.sn, this.device_name, this.hospital,
      this.department, this.detail, this.error_code,this.model,this.contact,this.contact_no,this.imageUrl,this.status,this.servicereport_id);

  factory AddJob_Data.fromJson(Map<String, dynamic> json) {
    return AddJob_Data(
      json['id'] as String,
      json['date'] as String,
      json['sn'] as String,
      json['device_name'] as String,
      json['hospital'] as String,
      json['department'] as String,
      json['detail'] as String,
      json['error_code'] as String,
      json['model'] as String,
      json['contact'] as String,
      json['contact_no'] as String,
      json['imageUrl'] as String,
      json['status'] as List,
      json['servicereport_id'] as String,
          );
  }
}

class AllAddJob_Data {
  final List<AddJob_Data> job_datas;

  AllAddJob_Data(this.job_datas);

  factory AllAddJob_Data.fromJson(List<dynamic> json) {
    List<AddJob_Data> job_datas;
    job_datas = json.map((index) => AddJob_Data.fromJson(index)).toList();
    return AllAddJob_Data(job_datas);
  }
  factory AllAddJob_Data.fromSnapshot(QuerySnapshot s) {
    List<AddJob_Data> job_datas = s.docs.map((DocumentSnapshot ds) {
      AddJob_Data job_data =
          AddJob_Data.fromJson(ds.data() as Map<String, dynamic>);
      job_data.id = ds.id;
      return job_data;
    }).toList();
    return AllAddJob_Data(job_datas);
  }
}
