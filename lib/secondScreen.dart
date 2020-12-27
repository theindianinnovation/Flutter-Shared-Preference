import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({Key key}) : super(key: key);
  @override
  SecondScreenState createState() => SecondScreenState();
}

class SecondScreenState extends State<SecondScreen> {
  int _count = 0;
  final datacount = GetStorage();

  @override
  void initState() {
    super.initState();
    if (datacount.read('count') != null) {
      _count = datacount.read('count');
    }
  }

  @override
  Widget build(BuildContext context) {
    datacount.writeIfNull("count", 0);
    return Scaffold(
      appBar: AppBar(title: Text('GetX shared Preference demo'),),
      body:  Center(
          child: Container(
            child: Text("Button tapped ${datacount.read('count')} times",
              style: TextStyle(fontSize: 20.0,),
          ),
        )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _count++;
            datacount.write("count", _count);

          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}