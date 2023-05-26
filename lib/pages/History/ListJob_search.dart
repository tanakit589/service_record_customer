import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_record/Controller/Job_Data_controller.dart';
import 'package:service_record/Model/Job_Data_model.dart';
import 'package:service_record/Service/Job_Data_service.dart';
import 'package:service_record/pages/History/History.dart';
import 'package:service_record/pages/HomePage_customer.dart';
import 'package:service_record/pages/Job_Data_assigned.dart';

import 'package:service_record/widgets/drawer.dart';

class ListJobSearch extends StatefulWidget {
  @override
  State<ListJobSearch> createState() => _ListJobSearchState();
}

class _ListJobSearchState extends State<ListJobSearch> {
  Job_Data_Controller controller_jobs =
      Job_Data_Controller(AddJob_DataService());
  List<AddJob_Data> job_datas = List.empty();
  String _name = '';
  String _sn = '';

  bool isLoading = false;
  void initState() {
    super.initState();
    controller_jobs.onSync.listen((bool syncState) => setState(() {
          isLoading = syncState;
        }));
    _name = context.read<UserDataModel>().name;
    _sn = context.read<searchModel>().searchSN;
    _get_job_data_search(_sn, _name);
  }

  void _get_job_data_search(String sn, name) async {
    var newjob_data = await controller_jobs.fetch_job_data_search(sn, name);
    setState(() {
      job_datas = newjob_data;
      job_datas.sort((a, b) => b.date.compareTo(a.date));
    });
  }

  Widget get searchJob => isLoading
      ? CircularProgressIndicator()
      : Scrollbar(
         thumbVisibility: true,
        thickness: 8,
        child: ListView.separated(
            itemCount: !job_datas.isEmpty ? job_datas.length : 1,
            separatorBuilder: (BuildContext context, int index) => const Divider(
                  color: Color.fromARGB(255, 125, 125, 125),
                  thickness: 2,
                ),
            itemBuilder: (context, index) {
              if (!job_datas.isEmpty) {
                return ListTile(
                    onTap: () {
                      context.read<CustomerDeviceData>().date =
                          '${job_datas[index].date}';
                      context.read<CustomerDeviceData>().department =
                          '${job_datas[index].department}';
                      context.read<CustomerDeviceData>().detail =
                          '${job_datas[index].detail}';
                      context.read<CustomerDeviceData>().device_name =
                          '${job_datas[index].device_name}';
                      context.read<CustomerDeviceData>().error_code =
                          '${job_datas[index].error_code}';
                      context.read<CustomerDeviceData>().hospital =
                          '${job_datas[index].hospital}';
                      context.read<CustomerDeviceData>().sn =
                          '${job_datas[index].sn}';
                      context.read<CustomerDeviceData>().jobid =
                          '${job_datas[index].id}';
                      context.read<CustomerDeviceData>().model =
                          '${job_datas[index].model}';
                      context.read<CustomerDeviceData>().contact =
                          '${job_datas[index].contact}';
                      context.read<CustomerDeviceData>().contact_no =
                          '${job_datas[index].contact_no}';
                      context.read<CustomerDeviceData>().imageUrl =
                          '${job_datas[index].imageUrl}';
                          context.read<CustomerDeviceData>().status =
                              job_datas[index].status;
      
                    
                      context.read<CustomerDeviceData>().servicereport_id =
                          '${job_datas[index].servicereport_id}';
      
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JobData_Assigned()));
                    },
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${job_datas[index].hospital}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            '${job_datas[index].device_name} :${job_datas[index].sn}'),
                        Text('date : ${job_datas[index].date.substring(0, 10)}'),
                        Text('error code ${job_datas[index].error_code}'),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<CustomerDeviceData>().date =
                            '${job_datas[index].date}';
                        context.read<CustomerDeviceData>().department =
                            '${job_datas[index].department}';
                        context.read<CustomerDeviceData>().detail =
                            '${job_datas[index].detail}';
                        context.read<CustomerDeviceData>().device_name =
                            '${job_datas[index].device_name}';
                        context.read<CustomerDeviceData>().error_code =
                            '${job_datas[index].error_code}';
                        context.read<CustomerDeviceData>().hospital =
                            '${job_datas[index].hospital}';
                        context.read<CustomerDeviceData>().sn =
                            '${job_datas[index].sn}';
                        context.read<CustomerDeviceData>().jobid =
                            '${job_datas[index].id}';
                        context.read<CustomerDeviceData>().model =
                            '${job_datas[index].model}';
                        context.read<CustomerDeviceData>().contact =
                            '${job_datas[index].contact}';
                        context.read<CustomerDeviceData>().contact_no =
                            '${job_datas[index].contact_no}';
                        context.read<CustomerDeviceData>().imageUrl =
                            '${job_datas[index].imageUrl}';
      context.read<CustomerDeviceData>().status =
                              job_datas[index].status;
                       
                        print(context.read<CustomerDeviceData>().status);
                        context.read<CustomerDeviceData>().servicereport_id =
                            '${job_datas[index].servicereport_id}';
      
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
      appBar: AppBar(
        title: Text('Found ${job_datas.length} jobs'),
      ),
      drawer: drawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                   color: Color.fromARGB(255, 192, 192, 192),
                                    blurRadius: 5,
                    blurStyle: BlurStyle.outer)
              ],
              border: Border.all(),
              borderRadius: BorderRadius.circular(10),
            ),
            child: searchJob),
      ),
    );
  }
}
