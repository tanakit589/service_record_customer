import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:service_record/Controller/AddDevice_Info_controller.dart';
import 'package:service_record/Controller/Job_Data_controller.dart';
import 'package:service_record/Controller/User_Data_controller.dart';
import 'package:service_record/Model/AddDevice_Info_model.dart';
import 'package:service_record/Model/Job_Data_model.dart';
import 'package:service_record/Model/User_Data_model.dart';
import 'package:service_record/Service/AddDevice_Info_service.dart';
import 'package:service_record/Service/Job_Data_service.dart';
import 'package:service_record/Service/User_Data_service.dart';
import 'package:service_record/pages/CreateJob/Page1.dart';
import 'package:service_record/pages/History/ListJob_search.dart';
import 'package:service_record/pages/History/History.dart';
import 'package:service_record/pages/Job_Data.dart';
import 'package:service_record/pages/Loginpage.dart';

import 'package:service_record/widgets/drawer.dart';
import 'package:provider/provider.dart';

final CarouselController _controller = CarouselController();

List<AddDevice> data_device = List.empty();

int _current = 0;

class HomePage_customer extends StatefulWidget {
  @override
  State<HomePage_customer> createState() => _HomePage_customerState();
}

class _HomePage_customerState extends State<HomePage_customer> {
  AddDeviceController controller_device =
      AddDeviceController(AddDeviceService());
  Job_Data_Controller controller_jobs =
      Job_Data_Controller(AddJob_DataService());
  UserDataController controller_userdata =
      UserDataController(UserDataService());

  List<AddJob_Data> job_datas = List.empty();

  List<UserData> userdata = List.empty();
  String name = '';
  Future refresh() async {
    String email = context.read<ProfileModel>().username;
    setState(() {
      _getUserData(email);
    });
  }
  // Future refresh_datadevice() async {
  //    String name = context.read<ProfileModel>().username;
  //   setState(() {
  //     _getDevice_InforInfo_cust(name);
  //   });
  // }

  bool isLoading = false;
  void initState() {
    super.initState();
    controller_userdata.onSync.listen((bool syncState) => setState(() {
          isLoading = syncState;
        }));
    String email = context.read<ProfileModel>().username;
    _getUserData(email);
    
  }

  void _getUserData(String email) async {
    var newuserdata = await controller_userdata.fetchUserData(email);
    setState(() {
      userdata = newuserdata;
      name = '${userdata[0].name}';
      context.read<UserDataModel>().name = name;
      _getDevice_InforInfo_cust(name);
      _get_job_data_info(name);
    });
  }

  void _getDevice_InforInfo_cust(String name) async {
    var newdata_device = await controller_device.fetchDeviceInfo_cust(name);
    setState(() => data_device = newdata_device);
  }

  void _get_job_data_info(String name) async {
    var newjob_data = await controller_jobs.fetch_job_data_info(name);
    setState(() => job_datas = newjob_data);
    job_datas.sort((a, b) => b.date.compareTo(a.date));
  }
  
  Widget get body => isLoading
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
        
                      print(context.read<CustomerDeviceData>().imageUrl);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => JobData()));
                    },
                    title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${job_datas[index].hospital}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                              '${job_datas[index].device_name} : ${job_datas[index].sn}'),
                          Text(
                              'date : ${job_datas[index].date.substring(0, 10)}'),
                          Text('error code ${job_datas[index].error_code}'),
                        ]),
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
        
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => JobData()));
                      },
                      icon: Icon(Icons.description),
                    ));
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No job now',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                );
              }
            }),
      );

  Widget get devicedata => isLoading
      ? CircularProgressIndicator()
      : Column(
          children: [
            CarouselSlider.builder(
              itemCount: data_device.length,
              carouselController: _controller,
              options: CarouselOptions(
                  height: 350,

                  //  enlargeCenterPage: true,
                  aspectRatio: 2.5,
                  onPageChanged: ((index, reason) {
                    setState(() {
                      _current = index;
                    });
                  })),
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Container(
                // decoration: BoxDecoration(border: Border.all()),
                width: 300.0,
                //  height: 5000,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        'images/${data_device[itemIndex].model}.jpg',
                        fit: BoxFit.none,
                        width: 200.0,
                        height: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 30),
                      child: Text(
                          'Device Name -   ${data_device[itemIndex].device_name} '),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 30),
                      child: Text('Model -   ${data_device[itemIndex].model} '),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 30),
                      child: Text('SN -   ${data_device[itemIndex].sn}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 30),
                      child: Text(
                          'Warranty expiration date - ${data_device[itemIndex].date}'),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 10.0, left: 30),
                    //   child: Text('Status - In use / repair /'),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: data_device.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 12.0,
                            height: 12.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.black)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                          ),
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
            ),
          ],
        );

  Widget get getname => isLoading
      ? CircularProgressIndicator()
      : Text(
          'Welcome\n$name',
          style: TextStyle(fontSize: 18),
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
                    context.read<searchModel>().searchSN = _sn;
                    Navigator.pop(context);
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
      appBar: AppBar(actions: [
        GestureDetector(
            child: IconButton(
          onPressed: () {
            _searchdialog(context);
          },
          icon: Icon(Icons.search),
          iconSize: 30,
        )),
      ], title: getname),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 20.0), child: devicedata),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 20),
              child: Text(
                'Pending Jobs',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 62, 62, 62),
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, right: 20),
                  child: Column(
                    children: [
                      Container(
                        decoration: ShapeDecoration(
                          color: Colors.greenAccent,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.history,
                          ),
                          iconSize: 40,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => History()));
                          },
                        ),
                      ),
                      Text('History')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 20),
                  child: Column(
                    children: [
                      Container(
                        decoration: ShapeDecoration(
                          color: Colors.greenAccent,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.handyman,
                          ),
                          iconSize: 40,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateJobPage1()));
                          },
                        ),
                      ),
                      Text('Find Error')
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class UserDataModel extends ChangeNotifier {
  String _name = '';
  get name => this._name;

  set name(value) => this._name = value;
}

class CustomerDeviceData extends ChangeNotifier {
  String _jobid = '';
  String _date = '';
  String _sn = '';
  String _device_name = '';
  String _hospital = '';
  String _department = '';
  String _detail = '';
  String _error_code = '';
  String _model = '';
  String _contact = '';
  String _contact_no = '';
  String _imageUrl = '';
  List _status = [];
  String _servicereport_id = '';

  get status => this._status;

  set status(value) {
    this._status = value;
    notifyListeners();
  }

  get servicereport_id => this._servicereport_id;

  set servicereport_id(value) {
    this._servicereport_id = value;
    notifyListeners();
  }

  get imageUrl => this._imageUrl;

  set imageUrl(value) {
    this._imageUrl = value;
    notifyListeners();
  }

  get contact => this._contact;

  set contact(value) => this._contact = value;

  get contact_no => this._contact_no;

  set contact_no(value) => this._contact_no = value;

  get model => this._model;

  set model(value) {
    this._model = value;
    notifyListeners();
  }

  get jobid => this._jobid;

  set jobid(value) {
    this._jobid = value;
    notifyListeners();
  }

  get date => this._date;

  set date(value) {
    this._date = value;
    notifyListeners();
  }

  get sn => this._sn;

  set sn(value) {
    this._sn = value;
    notifyListeners();
  }

  get device_name => this._device_name;

  set device_name(value) {
    this._device_name = value;
    notifyListeners();
  }

  get hospital => this._hospital;

  set hospital(value) {
    this._hospital = value;
    notifyListeners();
  }

  get department => this._department;

  set department(value) {
    this._department = value;
  }

  get detail => this._detail;

  set detail(value) {
    this._detail = value;
    notifyListeners();
  }

  get error_code => this._error_code;

  set error_code(value) {
    this._error_code = value;
    notifyListeners();
  }
}


// final List<Widget> imageSliders =>
//       SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   //  decoration: BoxDecoration(border: Border.all()),
//                   //   width: 600.0,
//                   //  height: 5000,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Image.asset(
//                         item,
//                         fit: BoxFit.fitHeight,
//                         width: 500.0,
//                         height: 200,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 20.0, left: 25),
//                         child: Text('Device Name - '),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 10.0, left: 25),
//                         child: Text('SN - '),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 10.0, left: 25),
//                         child: Text('Warranty expiration date -'),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 10.0, left: 25),
//                         child: Text('Status - In use / repair /'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ))
//       .toList();
      