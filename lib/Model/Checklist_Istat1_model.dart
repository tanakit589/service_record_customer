import 'package:cloud_firestore/cloud_firestore.dart';

class Checklist_Istat1 {
  String id;
  final String sn;
  final String hospital;
  final String department;
  final bool no1;
  final bool no2_Jams;
  final bool no2_Clew;
  final bool no3_a;
  final bool no3_b;
  final bool no4_a;
  final bool no4_b;
  final bool no4_c;
  final bool no4_d;
  final bool no4_e;
  final bool no4_f;
  final bool no5_a;
  final bool no5_b;
  final bool no5_c;
  final bool no6;
  final bool no7;
  final bool no8;
  final String jamsVer;
  final String clewVer;
  final String remarks;
  final String jobId;
  final String cussign;
  final String servicename;
  final String temp;
  final String date;

  Checklist_Istat1(
      this.id,
      this.sn,
      this.hospital,
      this.department,
      this.no1,
      this.no2_Jams,
      this.no2_Clew,
      this.no3_a,
      this.no3_b,
      this.no4_a,
      this.no4_b,
      this.no4_c,
      this.no4_d,
      this.no4_e,
      this.no4_f,
      this.no5_a,
      this.no5_b,
      this.no5_c,
      this.no6,
      this.no7,
      this.no8,
      this.jamsVer,
      this.clewVer,
      this.remarks,
      this.jobId,
      this.cussign,
      this.servicename,
      this.temp,
      this.date);
  factory Checklist_Istat1.fromJson(Map<String, dynamic> json) {
    return Checklist_Istat1(
      json['id'] as String,
      json['sn'] as String,
      json['hospital'] as String,
      json['department'] as String,
      json['no1'] as bool,
      json['no2_Jams'] as bool,
      json['no2_Clew'] as bool,
      json['no3_a'] as bool,
      json['no3_b'] as bool,
      json['no4_a'] as bool,
      json['no4_b'] as bool,
      json['no4_c'] as bool,
      json['no4_d'] as bool,
      json['no4_e'] as bool,
      json['no4_f'] as bool,
      json['no5_a'] as bool,
      json['no5_b'] as bool,
      json['no5_c'] as bool,
      json['no6'] as bool,
      json['no7'] as bool,
      json['no8'] as bool,
      json['jamsVer'] as String,
      json['clewVer'] as String,
      json['remarks'] as String,
      json['jobId'] as String,
      json['cussign'] as String,
      json['servicename'] as String,
      json['temp'] as String,
      json['date'] as String,
    );
  }
}

class AllChecklist_Istat1 {
  final List<Checklist_Istat1> checklist_istat1s;

  AllChecklist_Istat1(this.checklist_istat1s);

  factory AllChecklist_Istat1.fromJson(List<dynamic> json) {
    List<Checklist_Istat1> checklist_istat1s;
    checklist_istat1s =
        json.map((index) => Checklist_Istat1.fromJson(index)).toList();
    return AllChecklist_Istat1(checklist_istat1s);
  }
  factory AllChecklist_Istat1.fromSnapshot(QuerySnapshot s) {
    List<Checklist_Istat1> checklist_istat1s =
        s.docs.map((DocumentSnapshot ds) {
      Checklist_Istat1 checklist_istat1 =
          Checklist_Istat1.fromJson(ds.data() as Map<String, dynamic>);
      checklist_istat1.id = ds.id;
      return checklist_istat1;
    }).toList();
    return AllChecklist_Istat1(checklist_istat1s);
  }
}
