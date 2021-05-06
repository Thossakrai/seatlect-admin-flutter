import 'package:flutter/material.dart';
import 'package:seatlect_admin/Component/drawerWidget.dart';
import 'package:seatlect_admin/Component/requestListWidget.dart';

class AllRequestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AllRequestPageState();
}

class _AllRequestPageState extends State<AllRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerComponent(),
      appBar: AppBar(
        title: Text("All Business Requests"),
      ),
      body: Center(child: RequestList()),
    );
  }
}
