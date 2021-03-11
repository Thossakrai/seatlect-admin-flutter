import 'package:flutter/services.dart';
import 'package:seatlect_admin/Model/requestItemDetailModel.dart';
import 'dart:convert';

class BusinessRepository {
  static Future<RequestItemDetail> getBusiness() async {
    final String response =
        await rootBundle.loadString("../Data/businessInfoMock.json");

    final data = await json.decode(response);
    var latitude = data["location"]["latitude"];
    var longtitude = data["location"]["longtitude"];
    var id = data["_id"];
    var businessName = data["businessName"];
    var type = data["type"];
    var description = data["decription"];
    var address = data["address"];
    var displayImage = data["display_image"];
    var images = data["images"];
    Location location = new Location(latitude, longtitude);
    RequestItemDetail business = new RequestItemDetail(id, businessName, type,
        description, latitude, longtitude, address, displayImage, images);
    return business;
  }
}
