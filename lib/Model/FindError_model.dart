import 'package:cloud_firestore/cloud_firestore.dart';

class FindError {
  String id;
  final String code;
  final String description;
  final String device_name;
  final String solution;

  FindError(this.id,this.code,this.description,this.device_name,this.solution);

  factory FindError.fromJson(Map<String,dynamic> json){
  return FindError(
  json['id'] as String, 
  json['Code'] as String,
  json['Description'] as String,
  json['Device_name'] as String,
  json['solution'] as String,
  );
  }
}
 
class  AllFindError {
   final List<FindError> finderrors;

  AllFindError(this.finderrors);

  factory AllFindError.fromJson(List<dynamic> json){
    List<FindError> finderrors;
    finderrors= json.map((index) => FindError.fromJson(index)).toList();
    return AllFindError(finderrors);
  
  }
  factory AllFindError.fromSnapshot(QuerySnapshot s){
    List<FindError> finderrors = s.docs.map((DocumentSnapshot ds){
      FindError finderror= FindError.fromJson(ds.data() as Map<String, dynamic>);
      finderror.id=ds.id;
      return finderror;
    }).toList();
    return AllFindError(finderrors);
  }


}