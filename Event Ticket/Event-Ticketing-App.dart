import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Ticketing App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String qrData = "12345678";
  List<String> scannedCodes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Ticketing App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            QrImage(
              data: qrData,
              size: 200.0,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _recordEntry(qrData);
              },
              child: Text("Record Entry"),
            ),
            SizedBox(height: 20),
            Text("Scanned Codes:"),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: scannedCodes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(scannedCodes[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _recordEntry(String code) {
    setState(() {
      if (!scannedCodes.contains(code)) {
        scannedCodes.add(code);
        // TODO: Implement logic to record entry (e.g., send data to a server).
        print("Entry recorded for QR code: $code");
      } else {
        print("QR code already scanned");
      }
    });
  }
}
