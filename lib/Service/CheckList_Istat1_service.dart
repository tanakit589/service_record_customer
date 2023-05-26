import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:service_record/Model/Checklist_Istat1_model.dart';

class Checklist_Istat1Service {
  Future<List<Checklist_Istat1>> get_service_report() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('CheckList_istat1').get();
    AllChecklist_Istat1 checklist_istat1s =
        AllChecklist_Istat1.fromSnapshot(snapshot);
    return checklist_istat1s.checklist_istat1s;
  }

  Future<List<Checklist_Istat1>> getChecklist(String jobId) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('CheckList_istat1')
        .where('jobId', isEqualTo: jobId)
        .get();
    AllChecklist_Istat1 checklist_istat1s =
        AllChecklist_Istat1.fromSnapshot(snapshot);
    return checklist_istat1s.checklist_istat1s;
  }

  
}

  
