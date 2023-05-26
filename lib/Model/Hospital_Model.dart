import 'package:cloud_firestore/cloud_firestore.dart';


class Hospital {
  String id;
  final String name;
  final String acronym;
  

  Hospital(this.id,this.name,this.acronym);

  factory Hospital.fromJson(Map<String,dynamic> json){
  return Hospital(
    json['id'] as String, 
  json['name'] as String,
  json['acronym'] as String,
  
  );
  }
}

class AllHospital{
  final List<Hospital> hospitals;

  AllHospital(this.hospitals);

  factory AllHospital.fromJson(List<dynamic> json){
    List<Hospital> hospitals;
    hospitals= json.map((index) => Hospital.fromJson(index)).toList();
    return AllHospital(hospitals);
  
  }
  factory AllHospital.fromSnapshot(QuerySnapshot s){
    List<Hospital> hospitals = s.docs.map((DocumentSnapshot ds){
      Hospital hospital= Hospital.fromJson(ds.data() as Map<String, dynamic>);
      hospital.id=ds.id;
      return hospital;
    }).toList();
    return AllHospital(hospitals);
  }


}