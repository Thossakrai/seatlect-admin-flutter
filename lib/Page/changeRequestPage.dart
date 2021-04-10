import 'package:flutter/material.dart';
import 'package:seatlect_admin/Component/mapChangeRequestWidget.dart';
import 'package:seatlect_admin/Component/simpleChangeRequestWidget.dart';
import 'package:seatlect_admin/Component/RejectAndApproveButtonWidget.dart';
import 'package:seatlect_admin/Model/requestItemDetailModel.dart';

class ChangeRequestPage extends StatefulWidget {
  @override
  _ChangeRequestPageState createState() => _ChangeRequestPageState();
}

class _ChangeRequestPageState extends State<ChangeRequestPage> {
  //TODO Integrate with API
  void _handleApproveButton() {}
  void _handleRejectButton() {}

  RequestItemDetail oldBusinessRequest = new RequestItemDetail(
      "1234",
      "Sawasdee Restaurant",
      ["Thai"],
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      "13.726598091354633",
      "100.77516286412559",
      "1 Chalongkrung Rd. ",
      "https://d2eohwa6gpdg50.cloudfront.net/wp-content/uploads/sites/8/2020/09/02181648/IMAGE-Interior-1-Caption-WORKSHOP-RESTAURANT-_-GALLERY-interior-1024x683.jpg",
      [
        "https://www.remotelands.com/travelogues/app/uploads/2018/08/shutterstock_761494024.jpg",
        "https://www.eatingthaifood.com/wp-content/uploads/2018/12/best-thai-restaurants-in-bangkok.jpg"
      ]);

  RequestItemDetail newBusinessRequest = new RequestItemDetail(
      "1234",
      "Narai Pizzaria",
      ["Thai"],
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      "13.726598091354633",
      "100.77516286412559",
      "88, Tripetch Road, Wang Burapha Bhirom, Phra Nakorn, Bangkok, Thailand",
      "https://d2eohwa6gpdg50.cloudfront.net/wp-content/uploads/sites/8/2020/09/02181648/IMAGE-Interior-1-Caption-WORKSHOP-RESTAURANT-_-GALLERY-interior-1024x683.jpg",
      [
        "https://www.remotelands.com/travelogues/app/uploads/2018/08/shutterstock_761494024.jpg",
        "https://www.eatingthaifood.com/wp-content/uploads/2018/12/best-thai-restaurants-in-bangkok.jpg"
      ]);

  @override
  Widget build(BuildContext context) {
    var customTextTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text("Change Request Page")),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(right: 10, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RejectAndApproveButtonWidget(
                    _handleRejectButton, _handleApproveButton)
              ],
            ),
          ),
          SimpleChangeRequestWidget("Business Name",
              oldBusinessRequest.businessName, newBusinessRequest.businessName),
          SimpleChangeRequestWidget("Description",
              oldBusinessRequest.description, newBusinessRequest.description),
          SimpleChangeRequestWidget("Address", oldBusinessRequest.address,
              newBusinessRequest.address),
          MapChangeRequestWidget(
              oldBusinessRequest.latitude,
              oldBusinessRequest.longtitude,
              newBusinessRequest.latitude,
              newBusinessRequest.longtitude),
        ],
      ),
    );
  }
}
