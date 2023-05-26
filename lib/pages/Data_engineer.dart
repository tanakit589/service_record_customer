import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_record/widgets/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class DataEngineer extends StatelessWidget{

  Future<void> _dialNumber(String phoneNumber) async {
final Uri launchUri = Uri(
scheme: 'tel',
path: phoneNumber,
);
await launchUrl(launchUri);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        title: Text('Contact',style: TextStyle(fontSize: 24),),
      ),
      body: Container(
        child: ListView(
          children: [
          
           
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                          boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 62, 62, 62),
                                    blurRadius: 5,
                                    blurStyle: BlurStyle.outer)
                              ],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 1)),
                child: ListTile(
                  title: const Text(' เขมรันต์ เหลืองเมฆษา\n Senior service engineer\n 080-000-0000 '
                  ,style: TextStyle(fontSize: 18),),
                   trailing: Icon(Icons.phone),
                  onTap: () {
                    _dialNumber('080-000-0000');
                  },
                ),
              ),
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                decoration: BoxDecoration(
                          boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 62, 62, 62),
                                    blurRadius: 5,
                                    blurStyle: BlurStyle.outer)
                              ],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 1)),
                 child: ListTile(
                  title: const Text(' ธนกฤษ จิตติชัยเวทย์\n service engineer\n 084-638-4448'
                  ,style: TextStyle(fontSize: 18),),
                  trailing: Icon(Icons.phone),
                 onTap: () {
                    _dialNumber('084-638-4448');
                  },
            ),
               ),
             ),
            
          ],
        ),
      ),
    );
  }

}