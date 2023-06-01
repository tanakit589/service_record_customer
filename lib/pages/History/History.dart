import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:service_record/Controller/Device_Info_controller.dart';
import 'package:service_record/Controller/Job_Data_controller.dart';
import 'package:service_record/Controller/User_Data_controller.dart';
import 'package:service_record/Model/Job_Data_model.dart';
import 'package:service_record/Model/User_Data_model.dart';
import 'package:service_record/Service/AddDevice_Info_service.dart';
import 'package:service_record/Service/Job_Data_service.dart';
import 'package:service_record/Service/User_Data_service.dart';
import 'package:service_record/pages/History/CompletedJob.dart';
import 'package:service_record/pages/History/ListJob_search.dart';
import 'package:service_record/pages/History/QuotationJob.dart';
import 'package:service_record/pages/History/inprogressJob.dart';
import 'package:service_record/pages/HomePage_customer.dart';
import 'package:service_record/pages/Job_Data_assigned.dart';
import 'package:service_record/pages/Loginpage.dart';

import 'package:service_record/widgets/drawer.dart';
import 'package:provider/provider.dart';

class History extends StatefulWidget {
  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  AddDeviceController controller_device =
      AddDeviceController(AddDeviceService());
  Job_Data_Controller controller_jobs =
      Job_Data_Controller(AddJob_DataService());
  Job_Data_Controller controller_jobsLatest =
      Job_Data_Controller(AddJob_DataService());

  List<AddJob_Data> job_datas = List.empty();
  List<AddJob_Data> job_dataslatest = List.empty();
  List<AddJob_Data> job_datas_completed = List.empty();
  List<AddJob_Data> job_datas_quotation = List.empty();
  List<AddJob_Data> job_datas_inprogress = List.empty();

  String name = '';

  Future refreshLatest() async {
    setState(() {
      _get_job_data_latest(name);
      _get_job_data_Completed(name);
      _get_job_data_Quotation(name);
      _get_job_data_Inprogress(name);
    });
  }

  bool isLoading = false;

  void initState() {
    super.initState();
    controller_device.onSync.listen((bool syncState) => setState(() {
          isLoading = syncState;
        }));
    name = context.read<UserDataModel>().name;
    // print(name);

    _get_job_data_latest(name);
    _get_job_data_Completed(name);
    _get_job_data_Quotation(name);
    _get_job_data_Inprogress(name);
  }

  void _get_job_data_latest(String name) async {
    var newjob_data = await controller_jobsLatest.fetch_job_data_latest(name);
    setState(() {
      job_dataslatest = newjob_data;
      job_dataslatest.sort((a, b) => b.date.compareTo(a.date));
    });
  }

  void _get_job_data_Completed(String name) async {
    var newjob_data = await controller_jobs.fetch_job_data_Completed(name);
    setState(() {
      job_datas_completed = newjob_data;
      // job_datas_completed.sort();
    });
  }

  void _get_job_data_Quotation(String name) async {
    var newjob_data = await controller_jobs.fetch_job_data_Quotation(name);
    setState(() {
      job_datas_quotation = newjob_data;
       print(job_datas_quotation[0].status);
    });
  }

  void _get_job_data_Inprogress(String name) async {
    var newjob_data = await controller_jobs.fetch_job_data_Inprogress(name);
    setState(() {
      job_datas_inprogress = newjob_data;
      print(job_datas_inprogress[0].status);
    });
  }

  Widget get latestJob => isLoading
      ? CircularProgressIndicator()
      : Scrollbar(
        thumbVisibility: true,
        thickness: 8,
       
        child: ListView.separated(
            itemCount: !job_dataslatest.isEmpty ? job_dataslatest.length : 1,
            separatorBuilder: (BuildContext context, int index) => const Divider(
                   color: Color.fromARGB(255, 125, 125, 125),
                  thickness: 2,
                ),
            itemBuilder: (context, index) {
              if (!job_dataslatest.isEmpty) {
                return ListTile(
                   onTap: () {
                      context.read<CustomerDeviceData>().date =
                          '${job_dataslatest[index].date}';
                      context.read<CustomerDeviceData>().department =
                          '${job_dataslatest[index].department}';
                      context.read<CustomerDeviceData>().detail =
                          '${job_dataslatest[index].detail}';
                      context.read<CustomerDeviceData>().device_name =
                          '${job_dataslatest[index].device_name}';
                      context.read<CustomerDeviceData>().error_code =
                          '${job_dataslatest[index].error_code}';
                      context.read<CustomerDeviceData>().hospital =
                          '${job_dataslatest[index].hospital}';
                      context.read<CustomerDeviceData>().sn =
                          '${job_dataslatest[index].sn}';
                      context.read<CustomerDeviceData>().jobid =
                          '${job_dataslatest[index].id}';
                      context.read<CustomerDeviceData>().model =
                          '${job_dataslatest[index].model}';
                      context.read<CustomerDeviceData>().contact =
                          '${job_dataslatest[index].contact}';
                      context.read<CustomerDeviceData>().contact_no =
                          '${job_dataslatest[index].contact_no}';
                      context.read<CustomerDeviceData>().imageUrl =
                          '${job_dataslatest[index].imageUrl}';
                      context.read<UserDataModel>().name = name;
                      context.read<CustomerDeviceData>().status =
                          job_dataslatest[index].status;
                      context.read<CustomerDeviceData>().servicereport_id =
                          '${job_dataslatest[index].servicereport_id}';
      
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JobData_Assigned()));
                    },
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${job_dataslatest[index].hospital}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            '${job_dataslatest[index].device_name} :${job_dataslatest[index].sn}'),
                        Text(
                            'date : ${job_dataslatest[index].date.substring(0, 10)}'),
                        Text('error code ${job_dataslatest[index].error_code}'),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<CustomerDeviceData>().date =
                            '${job_dataslatest[index].date}';
                        context.read<CustomerDeviceData>().department =
                            '${job_dataslatest[index].department}';
                        context.read<CustomerDeviceData>().detail =
                            '${job_dataslatest[index].detail}';
                        context.read<CustomerDeviceData>().device_name =
                            '${job_dataslatest[index].device_name}';
                        context.read<CustomerDeviceData>().error_code =
                            '${job_dataslatest[index].error_code}';
                        context.read<CustomerDeviceData>().hospital =
                            '${job_dataslatest[index].hospital}';
                        context.read<CustomerDeviceData>().sn =
                            '${job_dataslatest[index].sn}';
                        context.read<CustomerDeviceData>().jobid =
                            '${job_dataslatest[index].id}';
                        context.read<CustomerDeviceData>().model =
                            '${job_dataslatest[index].model}';
                        context.read<CustomerDeviceData>().contact =
                            '${job_dataslatest[index].contact}';
                        context.read<CustomerDeviceData>().contact_no =
                            '${job_dataslatest[index].contact_no}';
                        context.read<CustomerDeviceData>().imageUrl =
                            '${job_dataslatest[index].imageUrl}';
                        context.read<UserDataModel>().name = name;
                        context.read<CustomerDeviceData>().status =
                            job_dataslatest[index].status;
                        context.read<CustomerDeviceData>().servicereport_id =
                            '${job_dataslatest[index].servicereport_id}';
      
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

           Future<void> _searchdialog(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    String _sn = '';
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Form(
          key: _formkey,
          child: AlertDialog(
            title: Text('Find Job'),
            content: SizedBox(
              height: 100,
              child: Column(
                children: [
                  Text('Please fill Serial number'),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Serial Number',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter serial number';
                      }
                      return null;
                    },
                    onSaved: ((newValue) {
                      _sn = newValue!;
                    }),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(),
                child: const Text(
                  'cancel',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                style: TextButton.styleFrom(),
                child: const Text(
                  'Find',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                       Navigator.pop(context);
                    context.read<searchModel>().searchSN = _sn;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListJobSearch()));
                    print(_sn);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        title: Text(
          'History',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        actions: [
         
         
          GestureDetector(
              child: IconButton(
            onPressed: () {
              _searchdialog(context);
            },
            icon: Icon(Icons.search),
            iconSize: 30,
          )),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CompletedJob()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 80,
                            width: 100,
                            decoration: BoxDecoration(
                              boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 152, 150, 150),
                                  blurRadius: 5,
                                  blurStyle: BlurStyle.outer)
                            ], border: Border.all(),
                             borderRadius: BorderRadius.circular(10),),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Completed',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color:
                                            Color.fromARGB(255, 25, 176, 5))),
                                Text('${job_datas_completed.length} Jobs')
                              ],
                            )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InprogressJob()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 80,
                            width: 100,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 152, 150, 150),
                                  blurRadius: 5,
                                  blurStyle: BlurStyle.outer),
                            ], border: Border.all(),
                             borderRadius: BorderRadius.circular(10),),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('In Progress',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color:
                                            Color.fromARGB(255, 145, 130, 3))),
                                Text('${job_datas_inprogress.length} Jobs')
                              ],
                            )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuotationJob()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 80,
                            width: 100,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 152, 150, 150),
                                  blurRadius: 5,
                                  blurStyle: BlurStyle.outer),
                            ], border: Border.all(),
                             borderRadius: BorderRadius.circular(10),),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Waiting for\n customer\n approval ',
                                    style: TextStyle(
                                      fontSize: 16,
                                    )),
                               
                                Text('${job_datas_quotation.length} Jobs'),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.white,
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('List Jobs', style: TextStyle(fontSize: 20)),
              ),
              SafeArea(
                child: Container(
                    height: 500,
                    decoration: BoxDecoration(
                        
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Color.fromARGB(255, 0, 0, 0), width: 1)),
                    child: RefreshIndicator(
                        onRefresh: refreshLatest,
                        strokeWidth: 2,
                        color: Colors.blue,
                        child: latestJob)),
              ),
            ],
          ),
        ),
      ),
     
    );
  }
}

class searchModel extends ChangeNotifier {
  String _searchSN = '';
  get searchSN => this._searchSN;

  set searchSN(value) {
    this._searchSN = value;
    notifyListeners();
  }
}