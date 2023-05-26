

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:service_record/Model/FindError_model.dart';




class FindErrorService{
  Future<List<FindError>> getdeviceModelInfo(String name,errorcode) async{
    QuerySnapshot snapshot= 
    await FirebaseFirestore.instance.collection('Error_Code')
    .where('Device_name',isEqualTo: name)
    .where('Code',isEqualTo: errorcode)
    .get();

    AllFindError finderrors = AllFindError.fromSnapshot(snapshot);
    return finderrors.finderrors;


  }
 

}