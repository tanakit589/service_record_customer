import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:service_record/Controller/Job_Data_controller.dart';
import 'package:service_record/Model/Job_Data_model.dart';
import 'package:service_record/Service/Job_Data_service.dart';
import 'package:service_record/Service/User_Data_service.dart';
import 'package:service_record/pages/HomePage_customer.dart';

import 'package:service_record/pages/Job_Data.dart';
import 'package:service_record/pages/Job_Data_assigned.dart';

import 'package:service_record/widgets/drawer.dart';
import 'package:provider/provider.dart';

class CompletedJob extends StatefulWidget {
  @override
  State<CompletedJob> createState() => _CompletedJobState();
}

//พน ทำดึงข้อมูลของงานที่ มีสเตตัสแล้วในช่อง latest job

class _CompletedJobState extends State<CompletedJob> {
  Future refresh() async {
    setState(() {
      _get_job_data_Completed(name);
    });
  }

  String name = '';
  bool isLoading = false;
  List<AddJob_Data> job_datas_completed = List.empty();

  Job_Data_Controller controller = Job_Data_Controller(AddJob_DataService());

  void initState() {
    super.initState();
    controller.onSync.listen((bool syncState) => setState(() {
          isLoading = syncState;
        }));
    name = context.read<UserDataModel>().name;
    _get_job_data_Completed(name);
  }

  void _get_job_data_Completed(String name) async {
    var newjob_data = await controller.fetch_job_data_Completed(name);
    setState(() {
      job_datas_completed = newjob_data;
      job_datas_completed.sort((a, b) => b.date.compareTo(a.date));

    });
  }

  Widget get body => isLoading
      ? CircularProgressIndicator()
      : Scrollbar(
         thumbVisibility: true,
        thickness: 8,
        child: ListView.separated(
            itemCount:
                !job_datas_completed.isEmpty ? job_datas_completed.length : 1,
            separatorBuilder: (BuildContext context, int index) => const Divider(
                 color: Color.fromARGB(255, 125, 125, 125),
                  thickness: 2,
                ),
            itemBuilder: (context, index) {
              if (!job_datas_completed.isEmpty) {
                return ListTile(
                    onTap: () {
                      context.read<CustomerDeviceData>().date =
                          '${job_datas_completed[index].date}';
                      context.read<CustomerDeviceData>().department =
                          '${job_datas_completed[index].department}';
                      context.read<CustomerDeviceData>().detail =
                          '${job_datas_completed[index].detail}';
                      context.read<CustomerDeviceData>().device_name =
                          '${job_datas_completed[index].device_name}';
                      context.read<CustomerDeviceData>().error_code =
                          '${job_datas_completed[index].error_code}';
                      context.read<CustomerDeviceData>().hospital =
                          '${job_datas_completed[index].hospital}';
                      context.read<CustomerDeviceData>().sn =
                          '${job_datas_completed[index].sn}';
                      context.read<CustomerDeviceData>().jobid =
                          '${job_datas_completed[index].id}';
                      context.read<CustomerDeviceData>().model =
                          '${job_datas_completed[index].model}';
                      context.read<CustomerDeviceData>().contact =
                          '${job_datas_completed[index].contact}';
                      context.read<CustomerDeviceData>().contact_no =
                          '${job_datas_completed[index].contact_no}';
                      context.read<CustomerDeviceData>().imageUrl =
                          '${job_datas_completed[index].imageUrl}';
                      
                      context.read<CustomerDeviceData>().status =
                          job_datas_completed[index].status;
                      context.read<CustomerDeviceData>().servicereport_id =
                          '${job_datas_completed[index].servicereport_id}';
      
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JobData_Assigned()));
                    },
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${job_datas_completed[index].hospital}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            '${job_datas_completed[index].device_name} :${job_datas_completed[index].sn}'),
                        Text(
                            'date : ${job_datas_completed[index].date.substring(0, 10)}'),
                        Text('error code ${job_datas_completed[index].error_code}'),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<CustomerDeviceData>().date =
                            '${job_datas_completed[index].date}';
                        context.read<CustomerDeviceData>().department =
                            '${job_datas_completed[index].department}';
                        context.read<CustomerDeviceData>().detail =
                            '${job_datas_completed[index].detail}';
                        context.read<CustomerDeviceData>().device_name =
                            '${job_datas_completed[index].device_name}';
                        context.read<CustomerDeviceData>().error_code =
                            '${job_datas_completed[index].error_code}';
                        context.read<CustomerDeviceData>().hospital =
                            '${job_datas_completed[index].hospital}';
                        context.read<CustomerDeviceData>().sn =
                            '${job_datas_completed[index].sn}';
                        context.read<CustomerDeviceData>().jobid =
                            '${job_datas_completed[index].id}';
                        context.read<CustomerDeviceData>().model =
                            '${job_datas_completed[index].model}';
                        context.read<CustomerDeviceData>().contact =
                            '${job_datas_completed[index].contact}';
                        context.read<CustomerDeviceData>().contact_no =
                            '${job_datas_completed[index].contact_no}';
                        context.read<CustomerDeviceData>().imageUrl =
                            '${job_datas_completed[index].imageUrl}';
                       
                        context.read<CustomerDeviceData>().status =
                            job_datas_completed[index].status;
                        context.read<CustomerDeviceData>().servicereport_id =
                            '${job_datas_completed[index].servicereport_id}';
      
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JobData_Assigned()));
                      },
                      icon: Icon(Icons.description),
                    ));
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('No job now',
                     style: TextStyle(fontSize: 20),),
                  ],
                );
              }
            }),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Completed Job',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              '${job_datas_completed.length} Jobs',
              style: TextStyle(
                fontSize: 20,
              ),
            )
          ],
        ),
       
     
      ),
     
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
            ),
            Divider(
              color: Colors.white,
              height: 10,
            ),
            Container(
                height: 600,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                         color: Color.fromARGB(255, 192, 192, 192),
                                    blurRadius: 5,
                                  blurStyle: BlurStyle.outer)
                    ],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 1)),
                child: RefreshIndicator(
                    onRefresh: refresh,
                    strokeWidth: 2,
                    color: Colors.blue,
                    child: body)),
          ]),
        ),
      ),
    );
  }
}
