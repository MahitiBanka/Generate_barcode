import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:barcode_flutter/barcode_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  String number = "1234ABCD";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Barcode Generator"),
      ),
      body: Center(
        child: SingleChildScrollView(
          //mainAxisAlignment: MainAxisAlignment.center,
          // children: <Widget>
          //[
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter number to generate barcode",
                  ),
                  onChanged: (value) {
                    number = value;
                  },
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
                child: FlatButton(
                  color: Colors.blue,
                  child: Text(
                    "Generate Bar Code",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      number;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Code39 with Text",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black45,
                  ),
                ),
              ),
              BarCodeImage(
                params: Code39BarCodeParams(
                  number,
                  lineWidth:
                      2.0, // width for a single black/white bar (default: 2.0)
                  barHeight:
                      90.0, // height for the entire widget (default: 100.0)
                  withText:
                      true, // Render with text label or not (default: false)
                ),
                onError: (error) {
                  // Error handler
                  print('error = $error');
                },
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Code128 with Text",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black45,
                  ),
                ),
              ),
              BarCodeImage(
                params: Code128BarCodeParams(
                  number,
                  withText: true,
                ),
              ),
              //),
            ],
          ),
        ),
      ),
    );
  }
}
