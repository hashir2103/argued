import 'package:argued/backend/localFiles.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  var data;
  @override
  void initState() {
    load();
    super.initState();
  }

  load() async {
    var d = await LocalFiles.readFile('hotTopic.json');
    setState(() {
      data = d;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [Text(data)],
      ),
    );
  }
}
