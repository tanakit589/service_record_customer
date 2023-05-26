import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';

import 'package:provider/provider.dart';
import 'package:service_record/pages/CreateJob/Page1.dart';
import 'package:service_record/pages/History/History.dart';
import 'package:service_record/pages/HomePage_customer.dart';
import 'package:service_record/pages/Loginpage.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!'); //logout จะทำอะไรบ้าง
    } else {
      print('User is signed in!'); //login ดึง userprofile จาก firebase_auth
    }
  });
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CreateJobmodel()),
      ChangeNotifierProvider(create: (context) => ProfileModel()),
      ChangeNotifierProvider(create: (context) => UserDataModel()),
      ChangeNotifierProvider(create: (context) => CustomerDeviceData()),

      ChangeNotifierProvider(create: (context) => searchModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/homepage': (context) => HomePage_customer(),
      },
    );
  }
}
