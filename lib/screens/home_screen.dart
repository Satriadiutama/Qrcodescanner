import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import './webview_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String kode = "";
  var getKode;
  Future scanBarcode() async {
    getKode = await BarcodeScanner.scan();
    setState(() {
      kode = getKode.rawContent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(" Aplikasi QR Code Scanner"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15.0,
          ),
          Image.network(
              "https://image.freepik.com/free-vector/smartphone-scanning-qr-code_23-2148624249.jpg"),
          SizedBox(
            height: 15.0,
          ),
          FlatButton(
            onPressed: () {
              scanBarcode();
            },
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(30.00),
                child: Center(
                  child: Text(
                    "Scan QR Code Disini !",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 19,
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(30.00)),
              ),
            ),
          ),

          Text(""),

          FlatButton(
            onPressed: kode == ""
                ? () {}
                : () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebScreen(kode),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: kode == ""
                      ? Text(
                    "QR Code Akan Muncul Disini !",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  )
                      : Text(
                    kode,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
