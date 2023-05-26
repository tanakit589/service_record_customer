import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:service_record/Model/Job_Data_model.dart';

class AddJob_DataService {
  Future<List<AddJob_Data>> get_job_data_info(String name) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Job_data')
        .where('hospital', isEqualTo: name)
        .where('status', isEqualTo: []).get();
    AllAddJob_Data job_datas = AllAddJob_Data.fromSnapshot(snapshot);
    return job_datas.job_datas;
  }

  Future<List<AddJob_Data>> get_job_data_latest(String name) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Job_data')
        .where('hospital', isEqualTo: name)
        .where('status', isNotEqualTo: []).get();
    AllAddJob_Data job_datas = AllAddJob_Data.fromSnapshot(snapshot);
    return job_datas.job_datas;
  }

    Future<List<AddJob_Data>> get_job_data_search(String sn,name) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Job_data')
        .where('hospital', isEqualTo: name)
        .where('sn', isEqualTo: sn)
        .get();
    AllAddJob_Data job_datas = AllAddJob_Data.fromSnapshot(snapshot);
    return job_datas.job_datas;
  }
  Future<List<AddJob_Data>> get_job_data_Completed(String name) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Job_data')
        .where('hospital', isEqualTo: name)
        .where('status', isEqualTo: [
      {'title': 'Completed', 'value': true},
      {'title': 'In Progress', 'value': false},
      {'title': 'Quotation', 'value': false}
    ])
    .get();
    AllAddJob_Data job_datas = AllAddJob_Data.fromSnapshot(snapshot);
    return job_datas.job_datas;
  }

  Future<List<AddJob_Data>> get_job_data_Inprogress(String name) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Job_data')
        .where('hospital', isEqualTo: name)
        .where('status', isEqualTo: [
      {'title': 'Completed', 'value': false},
      {'title': 'In Progress', 'value': true},
      {'title': 'Quotation', 'value': false}
    ])
    .get();
    AllAddJob_Data job_datas = AllAddJob_Data.fromSnapshot(snapshot);
    return job_datas.job_datas;
  }

   Future<List<AddJob_Data>> get_job_data_Quotation(String name) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Job_data')
        .where('hospital', isEqualTo: name)
        .where('status', isEqualTo: [
      {'title': 'Completed', 'value': false},
      {'title': 'In Progress', 'value': false},
      {'title': 'Quotation', 'value': true}
    ])
    .get();
    AllAddJob_Data job_datas = AllAddJob_Data.fromSnapshot(snapshot);
    return job_datas.job_datas;
  }



  // Future<List<AddJob_Data>> get_job_data_latest(String name) async {
  //   QuerySnapshot snapshot = await FirebaseFirestore.instance
  //       .collection('Job_data')
  //       .where('hospital', isEqualTo: name)
  //       .where('status', isNotEqualTo: [])
  //       .get();
  //   AllAddJob_Data job_datas = AllAddJob_Data.fromSnapshot(snapshot);
  //   return job_datas.job_datas;
  // }

  Future<String> add_job_data(
      String id,
      date,
      sn,
      device_name,
      hospital,
      department,
      detail,
      error_code,
      model,
      contact,
      contact_no,
      imageUrl,
      List status,
      servicereport_id) async {
    try {
      var docref = await FirebaseFirestore.instance.collection('Job_data').add({
        'id': '',
        'date': date,
        'sn': sn,
        'device_name': device_name,
        'hospital': hospital,
        'department': department,
        'detail': detail,
        'error_code': error_code,
        'model': model,
        'contact': contact,
        'contact_no': contact_no,
        'imageUrl': '',
        'status': [],
        'servicereport_id': '',
      });

      return docref.id;
    } catch (e) {
      throw (e);
    }
  }

  void updateimageUrl(String docref, imageUrl) async {
    FirebaseFirestore.instance.collection('Job_data').doc(docref).update({
      'id': docref,
      'imageUrl': imageUrl,
    });
  }



}
