import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_record/Controller/User_Data_controller.dart';

import 'package:service_record/Model/User_Data_model.dart';

import 'package:service_record/Service/User_Data_service.dart';
import 'package:service_record/pages/HomePage_customer.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  List<UserData> userdata = List.empty();

  bool isLoading = false;

  UserDataController controller = UserDataController(UserDataService());

  void initState() {
    super.initState();
    controller.onSync.listen((bool syncState) => setState(() {
          isLoading = syncState;
        }));
     String email = context.read<ProfileModel>().username;

  }
   
  void _getUserData(String email) async {
    String email = context.read<ProfileModel>().username;
    var newuserdata = await controller.fetchUserData(email);
    setState(() {
      userdata = newuserdata;
    });
  }

  final _formkey = GlobalKey<FormState>();
  late String _username;
  late String _password;

  bool _hidePassword = true;
  bool _hideConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            //title: Text('ggg'),
            ),
        body: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //  crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    //margin: EdgeInsets.only(top: 10.0),
                    //decoration: BoxDecoration(
                    //  borderRadius: BorderRadius.circular(14.0),
                    //),
                    child: Image.asset(
                      'images/logo.png',
                      height: 250,
                      width: 400,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Service System",
                          style: TextStyle(
                            fontSize: 20,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: 'tuh_tmth@hotmail.com',
                      decoration: InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder(),
                          hintText: 'Username'),
                     validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your UserName ';
                        } else {
                          return null;
                        }
                      },
                      onSaved: ((newValue) {
                        _username = newValue!;
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: 'tuh@tmth',
                      obscureText: _hidePassword,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _hidePassword = false;
                              });
                              Timer.periodic(
                                Duration(seconds: 5),
                                (Timer) {
                                  setState(() {
                                    _hidePassword = true;
                                  });
                                },
                              );
                            },
                            icon: Icon(Icons.remove_red_eye),
                          )),
                       validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Password  ';
                        } 
                        else {
                          return null;
                        }
                      },
                      onSaved: ((newValue) {
                        _password = newValue!;
                      }),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();
                        
                         
                        var msg = "Sign in failed";

                        try {
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: _username,
                            password: _password,
                          );
                          msg = "Sign in success";
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text('$msg ')));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                            msg = 'The password provided is too weak.';
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                            msg = 'The account already exists for that email.';
                          }
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text('$msg ')));
                          return;
                        } catch (e) {
                          print(e);
                          msg = 'Error ${e.toString()} ';
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text('$msg ')));
                        }
                        
                         
                        Navigator.pushNamed(context,('/homepage'));
                        //  Navigator.pushNamed(context, '/homepage');
                        context.read<ProfileModel>()
                          ..username = _username
                          ..password = _password;

                          print(context.read<ProfileModel>().username);
                      }
                    },
                    child: Text(
                      ' เข้าสู่ระบบ / Sign in ',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class ProfileModel extends ChangeNotifier {
  String _username = '';
  String _password = '';

  get password => this._password;

  set password(value) {
    this._password = value;
    notifyListeners();
  }

  get username => this._username;

  set username(value) {
    this._username = value;
    notifyListeners();
  }
}
