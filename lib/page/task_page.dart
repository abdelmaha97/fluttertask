import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:taskapp/core/colors.dart';
import 'package:taskapp/core/space.dart';
import 'package:taskapp/core/text_style.dart';
import 'package:taskapp/widget/main_button.dart';
import 'package:taskapp/widget/text_fild.dart';
import 'package:taskapp/page/view.dart';
import 'package:http/http.dart' as http;

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController address = TextEditingController();

  Future<void> adddata() async {
    if (firstName.text == "" || lastName.text == "" || address.text == "") {
      String uri = "http://sql306.epizy.com/add.php";

      var res = await http.post(Uri.parse(uri), body: {
        "firstName": firstName.text,
        "lastNamel": lastName.text,
        "address": address.text
      });

      var response = jsonDecode(res.body);
      if (response["success"] == "true") {
        print("Done");
      } else {
        print("some isssue");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBG,
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SpaceVH(height: 50.0),
              const Text(
                'Add New Data',
                style: headline1,
              ),
              // ignore: prefer_const_constructors
              SpaceVH(height: 60.0),
              textFild(
                controller: firstName,
                image: 'user.svg',
                keyBordType: TextInputType.name,
                hintTxt: 'First Name',
              ),
              textFild(
                controller: lastName,
                image: 'user.svg',
                keyBordType: TextInputType.name,
                hintTxt: 'last Name',
              ),
              textFild(
                controller: address,
                image: 'user.svg',
                keyBordType: TextInputType.name,
                hintTxt: 'Address',
              ),
              // ignore: prefer_const_constructors
              SpaceVH(height: 80.0),
              Mainbutton(
                onTap: () {
                  adddata();
                },
                text: 'Add',
                btnColor: blueButton,
              ),
              // ignore: prefer_const_constructors
              SpaceVH(height: 20.0),
              Mainbutton(
                onTap: () {},
                text: 'View Data',
                btnColor: blueButton,
              ),
              const SpaceVH(height: 20.0),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => ViewData()));
                },
                child: RichText(
                  // ignore: prefer_const_constructors, prefer_const_literals_to_create_immutables
                  text: TextSpan(children: []),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
