import 'package:cloud_firestore/cloud_firestore.dart';


class UserData {
  String id;
  final String name;
  final String email;
  

  UserData(this.id,this.name,this.email);

  factory UserData.fromJson(Map<String,dynamic> json){
  return UserData(
  json['id'] as String, 
  json['name'] as String,
  json['email'] as String,
  
  );
  }
}

class AllUserData{
  final List<UserData> userdatas;

  AllUserData(this.userdatas);

  factory AllUserData.fromJson(List<dynamic> json){
    List<UserData> userdatas;
    userdatas= json.map((index) => UserData.fromJson(index)).toList();
    return AllUserData(userdatas);
  
  }
  factory AllUserData.fromSnapshot(QuerySnapshot s){
    List<UserData> userdatas = s.docs.map((DocumentSnapshot ds){
      UserData userdata= UserData.fromJson(ds.data() as Map<String, dynamic>);
      userdata.id=ds.id;
      return userdata;
    }).toList();
    return AllUserData(userdatas);
  }


}