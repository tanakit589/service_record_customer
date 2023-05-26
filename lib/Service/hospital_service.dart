import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:service_record/Model/Hospital_Model.dart';




class HospitalService{
  Future<List<Hospital>> getHospitalInfo() async{
    QuerySnapshot snapshot= 
    await FirebaseFirestore.instance.collection('Hospital_Info').get();

    AllHospital hospitals = AllHospital.fromSnapshot(snapshot);
    return hospitals.hospitals;


  }
 

}