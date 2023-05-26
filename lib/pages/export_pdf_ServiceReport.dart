import 'dart:typed_data';

import 'package:hand_signature/signature.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:flutter/services.dart';
import 'package:service_record/Model/service_report_model.dart';
import 'package:service_record/pages/History/ListReport.dart';
import 'package:service_record/pages/History/history.dart';
import 'package:service_record/pages/HomePage_customer.dart';


Future<Uint8List> makePdf(ServiceReportPDF servicemodel) async {
  //  print(servicemodel);
  // final pdf = Document();
  var myTheme = ThemeData.withFont(
    base: Font.ttf(await rootBundle.load("assets/Sarabun-Regular.ttf")),
    bold: Font.ttf(await rootBundle.load("assets/Sarabun-Bold.ttf")),
    italic: Font.ttf(await rootBundle.load("assets/Sarabun-Italic.ttf")),
    boldItalic:
        Font.ttf(await rootBundle.load("assets/Sarabun-BoldItalic.ttf")),
  );
  String svgRaw = servicemodel.cussignUrl;
  final svgImage = pw.SvgImage(svg: svgRaw);

// final PdfCheckBoxField test =
  var pdf = pw.Document(
    theme: myTheme,
  );

  pdf.addPage(Page(
    pageFormat: PdfPageFormat.a4,
    build: (pw.Context context) {
      String Installation = (servicemodel.Installation == true ? " / " : "   ");
      String ServiceCall = (servicemodel.ServiceCall == true ? " / " : "   ");
      String Workshop = (servicemodel.Workshop == true ? " / " : "   ");
      String Commissioning =
          (servicemodel.Commissioning == true ? " / " : "   ");
      String PM = (servicemodel.PM == true ? " / " : "   ");
      String Internal = (servicemodel.Internal == true ? " / " : "   ");
      String ServiceContract =
          (servicemodel.ServiceContract == true ? " / " : "   ");
      String Warranty = (servicemodel.Warranty == true ? " / " : "   ");

      return Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: -40, left: 10, right: 10),
            child: Table(
              // border: TableBorder.all(),
              columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(150),
                1: FlexColumnWidth(),
                2: FixedColumnWidth(64),
              },
              children: <TableRow>[
                TableRow(
                  children: <Widget>[
                    Text(
                      'transmedic',
                      style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Transmedic (Thailand) Co., Ltd.'),
                        Text(
                          '888/87-89 (8th FL.), 888/209 (2nd FL.), Mahatun ',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Text(
                      'advancing medical technologies',
                      style: TextStyle(fontSize: 8.5),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Plaza Building,Lumpini, Patumwan, Bangkok 10330',
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(
                          'TEL: 022550405-8 FAX: 02-2550409',
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Text(
                      'SERVICE REPORT CUM DELIVERY ORDER',
                      // style: TextStyle(fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'No. 1 00974',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Container(
                height: 18,
                width: 500,
                decoration: BoxDecoration(border: Border.all()),
                child: Text(
                  'Customer Information',
                  style: TextStyle(fontSize: 14,
                  fontWeight: FontWeight.bold),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Table(
              border: TableBorder.all(),
              columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(200),
              },
              children: <TableRow>[
                TableRow(
                  children: <Widget>[
                    Text(
                      '  Customer   ${servicemodel.customer_name}',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      '  Dept.   ${servicemodel.department} ',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Text(
                      '  Contact      ${servicemodel.contract} ',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      '  Contact No.   ${servicemodel.contract_no} ',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Text(
                      '  Serial Number   ${servicemodel.sn} ',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      '  Model    ${servicemodel.model}',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
                height: 15,
                width: 500,
                decoration: BoxDecoration(border: Border.all()),
                child: Text(
                  '  Manufracturer   ${servicemodel.manufacturer} ',
                  style: TextStyle(fontSize: 12),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Container(
                height: 18,
                width: 500,
                decoration: BoxDecoration(border: Border.all()),
                child: Text(
                  '  Type of Service',
                  style: TextStyle(fontSize: 14,
                  fontWeight: FontWeight.bold),
                )),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Table(
                border: TableBorder.all(),
                columnWidths: const <int, TableColumnWidth>{
                  //  0: FixedColumnWidth(30),
                },
                children: <TableRow>[
                  TableRow(
                    children: <Widget>[
                      Container(
                        height: 25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                              ),
                               child: Container(
                                width: 13,
                                height: 13,
                       decoration:  BoxDecoration(border: Border.all()) ,
                        child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 19,
                                ),
                                 child:Text(Installation,
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 16,
                      
                        
                        ),),),
                              ),
                            ),
                            Text('   Installation'),
                          ],
                        ),
                      ),
                      Container(
                        height: 25,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                           
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                ),
                                 child: Container(
                                  
                                width: 13,
                                height: 13,
                        decoration:  BoxDecoration(border: Border.all()) ,
                        child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 19,
                                ),
                                 child:Text(ServiceCall,
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 16,
                      
                        
                        ),),),
                              ),
                            ),
                            Text('   Service Call'),
                          ],
                        ),
                      ),
                      Container(
                        height: 25,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                ),
                                 child: Container(
                                  
                                width: 14,
                                height: 14,
                        decoration:  BoxDecoration(border: Border.all()) ,
                        child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 19,
                                ),
                                 child:Text(Workshop,
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 16,
                      
                        
                        ),),),
                              ),
                            ),
                              Text('   Workshop')
                            ]),
                      ),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      Container(
                        height: 25,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                ),
                                child: Container(
                                  
                                width: 14,
                                height: 14,
                        decoration:  BoxDecoration(border: Border.all()) ,
                        child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 19,
                                ),
                                 child:Text(Commissioning,
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 16,
                      
                        
                        ),),),
                              ),
                            ),
                              Text('   Commissioning')
                            ]),
                      ),
                      Container(
                        height: 25,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                ),
                                 child: Container(
                                  
                                width: 14,
                                height: 14,
                        decoration:  BoxDecoration(border: Border.all()) ,
                        child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 19,
                                ),
                                 child:Text(PM,
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 16,
                      
                        
                        ),),),
                              ),
                            ),
                              Text('   PM')
                            ]),
                      ),
                      Container(
                        height: 25,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                ),
                                 child: Container(
                                  
                                width: 14,
                                height: 14,
                        decoration:  BoxDecoration(border: Border.all()) ,
                        child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 19,
                                ),
                                 child:Text(Internal,
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 16,
                      
                        
                        ),),),
                              ),
                            ),
                              Text('   Internal')
                            ]),
                      ),
                    ],
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Table(
              border: TableBorder.all(),
              columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(130),
              },
              children: <TableRow>[
                TableRow(
                  children: <Widget>[
                    Container(
                      height: 25,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                              ),
                               child: Container(
                                  
                                width: 14,
                                height: 14,
                        decoration:  BoxDecoration(border: Border.all()) ,
                        child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 19,
                                ),
                                 child:Text(ServiceContract,
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 16,
                      
                        
                        ),),),
                              ),
                            ),
                            Text('   Service Contract')
                          ]),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Container(
                      height: 25,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                              ),
                              child: Container(
                                  
                                width: 14,
                                height: 14,
                        decoration:  BoxDecoration(border: Border.all()) ,
                        child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 19,
                                ),
                                 child:Text(Warranty,
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 16,
                      
                        
                        ),),),
                              ),
                            ),
                            Text('   Warranty')
                          ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Container(
                height: 18,
                width: 500,
                decoration: BoxDecoration(border: Border.all()),
                child: Text(
                  '  Status',
                  style: TextStyle(fontSize: 14,
                  fontWeight: FontWeight.bold),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              decoration: BoxDecoration(border: Border.all()),
              child: Column(
                children: List.generate(servicemodel.status.length, (index) {
                  return Container(
                      height: 20,
                      decoration: BoxDecoration(border: Border.all()),
                      child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                 if (index == 0) ...[
                                  Container(
                                  
                                width: 14,
                                height: 14,
                        decoration:  BoxDecoration(border: Border.all()) ,
                        child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 19,
                                ),
                                 child: Text(servicemodel.status[index]['value'] ==
                                          true
                                      ? " /"
                                      : "  ", style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 16,
                      
                        
                        ),),
                        )),
                                  Text('   Completed')
                                ] else if (index == 1) ...[
                                  Container(
                                  
                                width: 14,
                                height: 14,
                        decoration:  BoxDecoration(border: Border.all()) ,
                        child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 19,
                                ),
                                 child: Text(servicemodel.status[index]['value'] ==
                                          true
                                      ? " /"
                                      : "  ", style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 16,
                      
                        
                        ),),
                        )),
                                  Text('   In Progress')
                                ] else if (index == 2) ...[
                                  Container(
                                  
                                width: 14,
                                height: 14,
                        decoration:  BoxDecoration(border: Border.all()) ,
                        child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 19,
                                ),
                                 child: Text(servicemodel.status[index]['value'] ==
                                          true
                                      ? " /"
                                      : "  ", style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 16,
                      
                        
                        ),),
                        )),
                                  Text('   Quotation')
                                ] 
                              ])));
                }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Container(
                height: 25,
                width: 400,
                //decoration: BoxDecoration(border: Border.all()),
                child: Text(
                  'Detailed Report',
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
                decoration: BoxDecoration(border: Border.all()),
                width: 500,
                //decoration: BoxDecoration(border: Border.all()),
                child: Text(
                  '   Fault',
                  style: TextStyle(fontSize: 14),
                )),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
              child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  height: 50,
                  width: 500,
                  child:Padding(
              padding: const EdgeInsets.only( left: 10,right: 10, ),
              child: Text(
                    '${servicemodel.fault}',
                    style: TextStyle(fontSize: 14),
                  )))),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Container(
                decoration: BoxDecoration(border: Border.all()),
                width: 500,
                //decoration: BoxDecoration(border: Border.all()),
                child: Text(
                  '   Work done',
                  style: TextStyle(fontSize: 14),
                )),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
              child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  height: 120,
                  width: 500,
                  child:  Padding(
              padding: const EdgeInsets.only( left: 10,right: 10, ),
              child:
                  Text(
                    '${servicemodel.workdone}',
                    style: TextStyle(fontSize: 14),
                  )))),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Container(
                decoration: BoxDecoration(border: Border.all()),
                width: 500,
                //decoration: BoxDecoration(border: Border.all()),
                child: Text(
                  '   Remarks',
                  style: TextStyle(fontSize: 14),
                )),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
              child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  height: 60,
                  width: 500,
                  child: Padding(
              padding: const EdgeInsets.only( left: 10,right: 10, ),
              child:Text(
                    '${servicemodel.remark}',
                    style: TextStyle(fontSize: 14),
                  )))),
        ],
      );
    },
  ));

  pdf.addPage(Page(build: (context) {
    return Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
                height: 25,
                width: 400,
                //decoration: BoxDecoration(border: Border.all()),
                child: Text(
                  'Spare Parts',
                  style: TextStyle(fontSize: 14,
                  fontWeight: FontWeight.bold),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
            child: Container(
                height: 25,
                width: 400,
                //decoration: BoxDecoration(border: Border.all()),
                child: Text(
                  '1.',
                  style: TextStyle(fontSize: 14),
                )),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  height: 20,
                  width: 500,
                  child: Text(
                    '   ${servicemodel.partnumber1}',
                    style: TextStyle(fontSize: 14),
                  ))),
          Padding(
              padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
              child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  height: 20,
                  width: 500,
                  child: Text(
                    '   ${servicemodel.partname1}',
                    style: TextStyle(fontSize: 14),
                  ))),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
            child: Container(
                height: 25,
                width: 400,
                //decoration: BoxDecoration(border: Border.all()),
                child: Text(
                  '2.',
                  style: TextStyle(fontSize: 14),
                )),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  height: 20,
                  width: 500,
                  child: Text(
                    '   ${servicemodel.partnumber2}',
                    style: TextStyle(fontSize: 14),
                  ))),
          Padding(
              padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
              child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  height: 20,
                  width: 500,
                  child: Text(
                    '   ${servicemodel.partname2}',
                    style: TextStyle(fontSize: 14),
                  ))),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
            child: Container(
                height: 25,
                width: 400,
                //decoration: BoxDecoration(border: Border.all()),
                child: Text(
                  '3.',
                  style: TextStyle(fontSize: 14),
                )),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  height: 20,
                  width: 500,
                  child: Text(
                    '   ${servicemodel.partnumber3}',
                    style: TextStyle(fontSize: 12),
                  ))),
          Padding(
              padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
              child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  height: 20,
                  width: 500,
                  child: Text(
                    '   ${servicemodel.partname3}',
                    style: TextStyle(fontSize: 12),
                  ))),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
            child: Container(
                height: 25,
                width: 400,
                //decoration: BoxDecoration(border: Border.all()),
                child: Text(
                  '4.',
                  style: TextStyle(fontSize: 12),
                )),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  height: 20,
                  width: 500,
                  child: Text(
                    '   ${servicemodel.partnumber4}',
                    style: TextStyle(fontSize: 12),
                  ))),
          Padding(
              padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
              child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  height: 20,
                  width: 500,
                  child: Text(
                    '   ${servicemodel.partname4}',
                    style: TextStyle(fontSize: 12),
                  ))),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 10,
              right: 10,
            ),
            child: Container(
              height: 200,
              width: 500,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('The above service was done to my satisfaction.'),
                    Text('Materials delivered as described above.'),
                    Padding(
                      padding: const EdgeInsets.only(left: 120.0),
                      child: Container(
                        width: 300.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                            //  border: Border.all(),
                            //color: Colors.white30,
                            ),
                        child: svgImage,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Name and Signature',
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            'Designation / Department',
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            'Company Stamp',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 10,
              right: 10,
            ),
            child: Table(
              border: TableBorder.all(),
              columnWidths: const <int, TableColumnWidth>{
                //0: FixedColumnWidth(130),
              },
              children: <TableRow>[
                TableRow(
                  children: <Widget>[
                    Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Date Attended '),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  servicemodel.date),
                            )
                          ],
                        )),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Container(
                        height: 50,
                        //width: 40,
                        //alignment: AlignmentDirectional.topStart ,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Time'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(servicemodel.time),
                            )
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Container(
                decoration: BoxDecoration(border: Border.all()),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Transmedic Engineer '),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${servicemodel.servicename}'),
                    )
                  ],
                )),
          )
        ]);
  }));
  return await pdf.save();
}
