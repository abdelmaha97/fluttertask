import 'package:flutter/material.dart';
import 'package:taskapp/core/style.dart';
import 'package:taskapp/page/task_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MaterialApp(
        title: 'Flutter App Task',
        debugShowCheckedModeBanner: false,
        theme: Stlyes.themeData(),
        // ignore: prefer_const_constructors
        home: TaskPage(),
      ),
    );
  }
}
