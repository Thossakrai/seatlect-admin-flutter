import 'dart:html';

import 'package:flutter/material.dart';
import 'package:seatlect_admin/Component/RejectAndApproveButtonWidget.dart';
import 'package:seatlect_admin/Component/drawerWidget.dart';
import 'package:seatlect_admin/Model/requestItemDetailModel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailPage extends StatefulWidget {
  //load mock data and map to the business detail class

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // RequestItemDetail business;
  // @override //FIX
  // Future<void> setState(fn) async {
  //   await BusinessRepository.getBusiness().then((value) => {print(value)});
  // }

  // Future<RequestItemDetail> getBusiness() async {
  //   var business = await BusinessRepository.getBusiness();
  // }
  bool _readOnlyMode;

  @override
  void initState() {
    super.initState();
    _readOnlyMode = true;
  }

  RequestItemDetail business = new RequestItemDetail(
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

  //calling google maps api
  GoogleMapController mapController;
  final LatLng _center = const LatLng(13.726598091354633, 100.77516286412559);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  CarouselController buttonCarouselController = CarouselController();
  // TextEditingController _textEditingController = TextEditingController();

  void _handleApprovedButton() => {};
  void _handleRejectedButton() => {};
  void _handleEditButton() {
    setState(() {
      _readOnlyMode = false;
    });
  }

  void _handleSaveButton() {
    setState(() {
      _readOnlyMode = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var customTextTheme = Theme.of(context).textTheme;
    return Scaffold(
      drawer: DrawerComponent(),
      appBar: AppBar(
        title: Text("Business Detail"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 14, bottom: 5, left: 10, right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: _readOnlyMode ? 2 : 2,
                          color: _readOnlyMode ? Colors.white : Colors.grey)),
                  child: EditableText(
                    readOnly: _readOnlyMode,
                    expands: true,
                    controller:
                        TextEditingController(text: business.businessName),
                    focusNode: FocusNode(),
                    style: customTextTheme.headline3,
                    cursorColor: Colors.amber,
                    backgroundCursorColor: Colors.red,
                    minLines: null,
                    maxLines: null,
                  ),
                )
                    // child: Text(business.businessName,
                    //     style: customTextTheme.headline3)
                    ),
                Row(
                    children: _readOnlyMode
                        ? [
                            Container(
                              padding: EdgeInsets.only(right: 5),
                              child: OutlinedButton(
                                onPressed: _handleEditButton,
                                child: Text("Edit Information"),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.grey),
                                    foregroundColor: MaterialStateProperty.all(
                                        Colors.white)),
                              ),
                            ),
                            Container(
                                child: RejectAndApproveButtonWidget(
                                    _handleRejectedButton,
                                    _handleApprovedButton))
                          ]
                        : [
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: OutlinedButton(
                                onPressed: _handleSaveButton,
                                child: Text("Save"),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.amber),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black)),
                              ),
                            )
                          ]),
              ],
            ),
          ),
          Divider(),
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Description", style: customTextTheme.headline4),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: _readOnlyMode ? 2 : 2,
                                    color: _readOnlyMode
                                        ? Colors.white
                                        : Colors.grey)),
                            child: EditableText(
                              readOnly: _readOnlyMode,
                              expands: true,
                              controller: TextEditingController(
                                  text: business.description),
                              focusNode: FocusNode(),
                              style: customTextTheme.bodyText1,
                              cursorColor: Colors.amber,
                              backgroundCursorColor: Colors.red,
                              minLines: null,
                              maxLines: null,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Type",
                            style: customTextTheme.headline4,
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text(business.type[0]),
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Colors.amberAccent,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Location", style: customTextTheme.headline4),
                          Container(
                            width: (MediaQuery.of(context).size.width / 2) - 50,
                            height: 200,
                            child: GoogleMap(
                                onMapCreated: _onMapCreated,
                                initialCameraPosition: CameraPosition(
                                    target: _center, zoom: 11.0)),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: _readOnlyMode ? 2 : 2,
                                    color: _readOnlyMode
                                        ? Colors.white
                                        : Colors.grey)),
                            child: EditableText(
                              controller:
                                  TextEditingController(text: business.address),
                              readOnly: _readOnlyMode,
                              expands: true,
                              minLines: null,
                              maxLines: null,
                              backgroundCursorColor: Colors.amber,
                              cursorColor: Colors.amber,
                              focusNode: FocusNode(),
                              style: customTextTheme.bodyText1,
                            ),
                          ),
                          // Text(business.address,
                          //     style: customTextTheme.bodyText1),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Policy", style: customTextTheme.headline4),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: _readOnlyMode ? 2 : 2,
                                    color: _readOnlyMode
                                        ? Colors.white
                                        : Colors.grey)),
                            child: EditableText(
                              controller:
                                  TextEditingController(text: "No minimum age"),
                              readOnly: _readOnlyMode,
                              expands: true,
                              minLines: null,
                              maxLines: null,
                              backgroundCursorColor: Colors.amber,
                              cursorColor: Colors.amber,
                              focusNode: FocusNode(),
                              style: customTextTheme.bodyText1,
                            ),
                          ),
                          // Text("No minimum age",
                          //     style: customTextTheme.bodyText1)
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Display Images",
                      style: customTextTheme.headline4,
                    ),
                    CarouselSlider(
                      carouselController: buttonCarouselController,
                      options: CarouselOptions(
                          height: MediaQuery.of(context).size.height / 4,
                          enableInfiniteScroll: false,
                          aspectRatio: 16 / 9,
                          enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          viewportFraction: 0.2,
                          enlargeCenterPage: true),
                      items: business.images.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(color: Colors.amber),
                                child: Image.network(i));
                          },
                        );
                      }).toList(),
                    ),
                    // RaisedButton(
                    //   onPressed: () => buttonCarouselController.previousPage(
                    //       duration: Duration(milliseconds: 300),
                    //       curve: Curves.linear),
                    //   child: Text('<-'),
                    // ),
                    // RaisedButton(
                    //   onPressed: () => buttonCarouselController.nextPage(
                    //       duration: Duration(milliseconds: 300),
                    //       curve: Curves.linear),
                    //   child: Text('→'),
                    // )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
