import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:service_record/Model/Hospital_Model.dart';
import 'package:service_record/Model/User_Data_model.dart';

class UserDataService {
  Future<List<UserData>> getUserData(String email) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('User_data')
        .where('email', isEqualTo: email)
        .get();

    AllUserData userdatas = AllUserData.fromSnapshot(snapshot);
    return userdatas.userdatas;
  }
}
