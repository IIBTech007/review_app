import 'dart:typed_data';
import 'dart:ui';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BusinessQRCode extends StatelessWidget {
  int businessId;
  GlobalKey globalKey = new GlobalKey();
  BusinessQRCode(this.businessId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Qrcode"),
        centerTitle: true,
        actions: [
          Row(
            children: [
              IconButton(
                padding: EdgeInsets.all(16),
                icon: Icon(Icons.print),
                onPressed: ()async{
                  final doc = pw.Document();
                  RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
                  var image = await boundary.toImage();
                  ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
                  Uint8List pngBytes = byteData.buffer.asUint8List();
                  final PdfImage img = PdfImage.file(doc.document, bytes: pngBytes);
                  doc.addPage(pw.Page(
                      build: (pw.Context context) {
                        return pw.Column(
                            children: [
                              pw.Padding(padding: pw.EdgeInsets.all(8.0)),
                              pw.Center(
                                  child: pw.Image(pw.ImageProxy(img),width: 200,height: 200),
                              ),
                              pw.Padding(padding: pw.EdgeInsets.all(8.0)),
                              pw.Center(
                                  child: pw.Text("Please Scan this QR Code to give Review to this Restaurant",style: pw.TextStyle(fontSize: 15))
                              ),
                            ]
                        );
                      })); // Pa
                  await Printing.layoutPdf(
                      onLayout: (PdfPageFormat format) async => doc.save());
                },
              )
            ],
          )
        ],
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: RepaintBoundary(
              key: globalKey,
              child: QrImage(
                data: businessId.toString(),
                version: QrVersions.auto,
                size: 200.0,
              ),
            ),
          ),
        ],
      )
    );
  }
}
