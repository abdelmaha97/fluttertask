import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ViewData extends StatefulWidget {
  const ViewData({Key? key}) : super(key: key);

  @override
  _ViewDataState createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  List userdata = [];

  Future<void> viewdata() async {
    String uri = "http://sql306.epizy.com/view.php";

    final response = await http.get(Uri.parse(uri));
    setState(() {
      var res;
      userdata = jsonDecode(res.body);
    });

    @override
    void initState() {
      viewdata();
      super.initState();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(title: Text("list Data")),
          body: ListView.builder(
              itemCount: userdata.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(userdata[index]['firstName']),
                    subtitle: Text(userdata[index]['address']),
                  ),
                );
              }));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
