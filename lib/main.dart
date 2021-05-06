import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatlect_admin/Component/drawerWidget.dart';
import 'package:seatlect_admin/Component/requestListWidget.dart';
import 'package:seatlect_admin/Model/requestItemDetailModel.dart';
import 'package:seatlect_admin/Networking/requestAPI.dart';
import 'package:seatlect_admin/Page/LoginPage.dart';
import 'package:seatlect_admin/Page/changeRequestPage.dart';
import 'package:seatlect_admin/Page/detailPage.dart';
import 'package:seatlect_admin/Repository/businessRepository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SEATLECT for Admin',
      theme: ThemeData(
          primarySwatch: Colors.amber,
          fontFamily: GoogleFonts.dmSans().fontFamily,
          textTheme: TextTheme(
              headline3: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              headline4: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              bodyText1: TextStyle(color: Colors.black, fontSize: 16))),
      home: MyHomePage(title: 'SEATLECT for Administrator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerComponent(),
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      // body: Center(child: RequestList()),
      body: Center(
        child: LoginPage(),
        //TODO remove policy
      ),
    );
  }
}
