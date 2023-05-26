import 'dart:typed_data';

import 'package:hand_signature/signature.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:service_record/pages/ListChecklist.dart';

Future<Uint8List> makePdfChecklist(ChecklistPDF checklistmodel) async {
  //  print(servicemodel);
  // final pdf = Document();
  var myTheme = ThemeData.withFont(
    base: Font.ttf(await rootBundle.load("assets/Sarabun-Regular.ttf")),
    bold: Font.ttf(await rootBundle.load("assets/Sarabun-Bold.ttf")),
    italic: Font.ttf(await rootBundle.load("assets/Sarabun-Italic.ttf")),
    boldItalic:
        Font.ttf(await rootBundle.load("assets/Sarabun-BoldItalic.ttf")),
  );
  String svgRaw = checklistmodel.cussignUrl;
  final svgImage = pw.SvgImage(svg: svgRaw);

  final imageLogo = MemoryImage(
      (await rootBundle.load('images/logo.png')).buffer.asUint8List());

// final PdfCheckBoxField test =
  var pdf = pw.Document(
    theme: myTheme,
  );
  pdf.addPage(Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        String no1 = (checklistmodel.no1 == true ? " / " : "   ");
        String no2_Clew = (checklistmodel.no2_Clew == true ? " / " : "   ");
        String no2_Jams = (checklistmodel.no2_Jams == true ? " / " : "   ");
        String no3_a = (checklistmodel.no3_a == true ? " / " : "   ");
        String no3_b = (checklistmodel.no3_b == true ? " / " : "   ");
        String no4_a = (checklistmodel.no4_a == true ? " / " : "   ");
        String no4_b = (checklistmodel.no4_b == true ? " / " : "   ");
        String no4_c = (checklistmodel.no4_c == true ? " / " : "   ");
        String no4_d = (checklistmodel.no4_d == true ? " / " : "   ");
        String no4_e = (checklistmodel.no4_e == true ? " / " : "   ");
        String no4_f = (checklistmodel.no4_f == true ? " / " : "   ");
        String no5_a = (checklistmodel.no5_a == true ? " / " : "   ");
        String no5_b = (checklistmodel.no5_b == true ? " / " : "   ");
        String no5_c = (checklistmodel.no5_c == true ? " / " : "   ");
        String no6 = (checklistmodel.no6 == true ? " / " : "   ");
        String no7 = (checklistmodel.no7 == true ? " / " : "   ");
        String no8 = (checklistmodel.no8 == true ? " / " : "   ");

        return Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: -50, left: 10, right: 10),
                child: Center(
                  child: Container(
                    height: 50,
                    width: 500,
                    child: Image(imageLogo),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'I-Stat Analyzer',
                      style: TextStyle(fontSize: 16,
                      fontWeight:FontWeight.bold,),
                    )),
              ),
              Divider(
                thickness: 2,
                color: PdfColors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Device name',
                                style: TextStyle(fontSize: 12),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 57),
                                child: Text(
                                  'i-STAT 1 Analyzer',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ]),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Serial Number',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 46),
                                  child: Text(
                                    checklistmodel.sn,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Location',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 75),
                                  child: Text(
                                    checklistmodel.customer_name +
                                        ',  ' +
                                        checklistmodel.department,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Date',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 98),
                                  child: Text(
                                    checklistmodel.date,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Product Specialist',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Text(
                                    checklistmodel.servicename,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ]),
                        )
                      ]),
                  Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Text(
                            'Customer Signature',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Container(
                            width: 150.0,
                            height: 240.0,
                            decoration: BoxDecoration(
                                //  border: Border.all(),
                                //color: Colors.white30,
                                ),
                            child: svgImage,
                          ),
                        ),
                      ]),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 10),
                child: Table(
                  border: TableBorder.all(),
                  columnWidths: const <int, TableColumnWidth>{
                    0: FixedColumnWidth(30),
                    2: FixedColumnWidth(40),
                  },
                  children: <TableRow>[
                    TableRow(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          height: 17,
                          child: Text(
                            'No.',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Container(
                          height: 17,
                          child: Text(
                            '    Description',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 17,
                          child: Text(
                            'Passed',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          height: 17,
                          child: Text(
                            '1.',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 17,
                          child: Text(
                            '  Clean the external surface ',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          height: 20,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                width: 13,
                                height: 13,
                       decoration:  BoxDecoration(border: Border.all()) ,
                        child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 19,
                                ),
                                 child:Text(no1,
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 16,
                      
                        
                        ),),),
                              ),
                              ]),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          height: 20,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                            ),
                            child: Text(
                              '2.',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 20,
                          child: Text(
                            '  Software version -  ',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          height: 20,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                            ),
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 20,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 50,
                                  ),
                                  child: Text(
                                    '  JAMS  - ',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Text(
                                    checklistmodel.jamsVer,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ]),
                        ),
                        Container(
                          height: 20,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                width: 13,
                                height: 13,
                       decoration:  BoxDecoration(border: Border.all()) ,
                        child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 19,
                                ),
                                 child:Text(no2_Jams,
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 16,
                      
                        
                        ),),),
                              ),
                              ]),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          height: 20,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                            ),
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 20,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 50,
                                  ),
                                  child: Text(
                                    '  CLEW - ',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Text(
                                    checklistmodel.clewVer,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ]),
                        ),
                        Container(
                          height: 20,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                width: 13,
                                height: 13,
                       decoration:  BoxDecoration(border: Border.all()) ,
                        child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 19,
                                ),
                                 child:Text(no2_Clew,
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 16,
                      
                        
                        ),),),
                              ),
                              ]),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          height: 20,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                            ),
                            child: Text(
                              '3.',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 20,
                          child: Text(
                            '  Visual inspection -  ',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          height: 20,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                            ),
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 20,
                          child: Text(
                            '  a)	Verify that the display contrast is set so that the display is easily read.',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Container(
                          height: 20,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                width: 13,
                                height: 13,
                       decoration:  BoxDecoration(border: Border.all()) ,
                        child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 19,
                                ),
                                 child:Text(no3_a,
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 16,
                      
                        
                        ),),),
                              ),
                              ]),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          height: 20,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                            ),
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 20,
                          child: Text(
                            '  b)	Verify cartridge door springs back.',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Container(
                          height: 20,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                width: 13,
                                height: 13,
                       decoration:  BoxDecoration(border: Border.all()) ,
                        child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 19,
                                ),
                                 child:Text( no3_b,
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 16,
                      
                        
                        ),),),
                              ),
                              ]),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          height: 20,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                            ),
                            child: Text(
                              '4.',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 20,
                          child: Text(
                            '  Run simulator, check keys and scanner operation',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          height: 20,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                            ),
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 33,
                          child: Text(
                            '  a)	Insert Electronics Simulator. The analyzer cycle should begin upon\n  Simulator insertion.',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Container(
                          height: 33,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                width: 13,
                                height: 13,
                       decoration:  BoxDecoration(border: Border.all()) ,
                        child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 19,
                                ),
                                 child:Text(no4_a,
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 16,
                      
                        
                        ),),),
                              ),
                              ]),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          height: 20,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                            ),
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 48,
                          child: Text(
                            '  b)	Verify that keys operate properly by entering Operator # as follows:\n  Press the 123456789.0 and ABC keys and left/right arrow to change\n  the letter.',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Container(
                          height: 46,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Container(
                                width: 13,
                                height: 13,
                       decoration:  BoxDecoration(border: Border.all()) ,
                        child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 19,
                                ),
                                 child:Text(no4_b,
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 16,
                      
                        
                        ),),),
                              ),
                              ]),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          height: 20,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                            ),
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 20,
                          child: Text(
                            '  c)	Press the ABC key again, the cursor moves to the right.',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Container(
                          height: 20,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Container(
                                width: 13,
                                height: 13,
                       decoration:  BoxDecoration(border: Border.all()) ,
                        child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 19,
                                ),
                                 child:Text(no4_c,
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 16,
                      
                        
                        ),),),
                              ),
                              ]),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          height: 20,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                            ),
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 33,
                          child: Text(
                            '  d)	Verify that the left keys clears (clear back till the display reads\n  123456789 and hit the ENTER key. ).',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Container(
                          height: 33,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Container(
                                width: 13,
                                height: 13,
                       decoration:  BoxDecoration(border: Border.all()) ,
                        child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 19,
                                ),
                                 child:Text(no4_d,
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 16,
                      
                        
                        ),),),
                              ),
                              ]),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          height: 20,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                            ),
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 33,
                          child: Text(
                            '  e)	When prompted for the Simulator ID scan any bar code to verify that the\n  scan works properly.',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Container(
                          height: 33,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Container(
                                width: 13,
                                height: 13,
                       decoration:  BoxDecoration(border: Border.all()) ,
                        child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 19,
                                ),
                                 child:Text(no4_e,
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 16,
                      
                        
                        ),),),
                              ),
                              ]),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          height: 20,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                            ),
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 20,
                          child: Text(
                            '  f)	Record PASS/FAIL indication from Electronic Simulator.',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Container(
                          height: 20,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Container(
                                width: 13,
                                height: 13,
                       decoration:  BoxDecoration(border: Border.all()) ,
                        child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 19,
                                ),
                                 child:Text(no4_f,
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 16,
                      
                        
                        ),),),
                              ),
                              ]),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          height: 20,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                            ),
                            child: Text(
                              '5.',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 20,
                          child: Text(
                            '  Wake-up circuit test',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          height: 20,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                            ),
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 33,
                          child: Text(
                            '  a)	With simulator installed, press the ON/OFF key to power down\n  the analyzer.',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Container(
                          height: 33,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                width: 13,
                                height: 13,
                       decoration:  BoxDecoration(border: Border.all()) ,
                        child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 19,
                                ),
                                 child:Text(no5_a,
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 16,
                      
                        
                        ),),),
                              ),
                              ]),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          height: 20,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                            ),
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 20,
                          child: Text(
                            '  b)	Once the unit powered down, press the ON/OFF key to power up.',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Container(
                          height: 20,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                width: 13,
                                height: 13,
                       decoration:  BoxDecoration(border: Border.all()) ,
                        child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 19,
                                ),
                                 child:Text( no5_b,
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 16,
                      
                        
                        ),),),
                              ),
                              ]),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          height: 20,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                            ),
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 33,
                          child: Text(
                            '  c)	Verify that the analyzer powers up and the message,\n  REMOVE CARTRIDGE appears on the screen.',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Container(
                          height: 33,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                width: 13,
                                height: 13,
                       decoration:  BoxDecoration(border: Border.all()) ,
                        child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 19,
                                ),
                                 child:Text(no5_c,
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 16,
                      
                        
                        ),),),
                              ),
                              ]),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          height: 20,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                            ),
                            child: Text(
                              '6.',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 33,
                          child: Text(
                            '  Check time & date and verify backlight operation by pressing\n  0 (Backlight) keys for 2 seconds.',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Container(
                          height: 33,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Container(
                                width: 13,
                                height: 13,
                       decoration:  BoxDecoration(border: Border.all()) ,
                        child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 19,
                                ),
                                 child:Text(no6,
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 16,
                      
                        
                        ),),),
                              ),
                              ]),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          height: 20,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                            ),
                            child: Text(
                              '7.',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 20,
                          child: Text(
                            '  Verify Printer functionality ',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Container(
                          height: 20,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                width: 13,
                                height: 13,
                       decoration:  BoxDecoration(border: Border.all()) ,
                        child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 19,
                                ),
                                 child:Text(no7,
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 16,
                      
                        
                        ),),),
                              ),
                              ]),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          height: 20,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                            ),
                            child: Text(
                              '8.',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 20,
                          child: Text(
                            '  Test run using electronics simulator x 2 times',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Container(
                          height: 20,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                width: 13,
                                height: 13,
                       decoration:  BoxDecoration(border: Border.all()) ,
                        child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 19,
                                ),
                                 child:Text(no8,
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 16,
                      
                        
                        ),),),
                              ),
                              ]),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          height: 20,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                            ),
                            child: Text(
                              '9.',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 20,
                          child: Text(
                            '  Temperature probe',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          child: Text(
                            checklistmodel.temp + ' C',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]);
      }));
  pdf.addPage(Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: -50, left: 10, right: 10),
                child: Center(
                  child: Container(
                    height: 50,
                    width: 500,
                    child: Image(imageLogo),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    width: 500,
                    //decoration: BoxDecoration(border: Border.all()),
                    child: Text(
                      '   Remarks',
                      style: TextStyle(fontSize: 14,
                      fontWeight:FontWeight.bold,),
                    )),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                  child: Container(
                      decoration: BoxDecoration(border: Border.all()),
                      height: 100,
                      width: 600,
                      child: Text(
                        '   ${checklistmodel.remarks}',
                        style: TextStyle(fontSize: 14),
                      ))),
            ]);
      }));
  return pdf.save();
}
