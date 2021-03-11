import 'dart:core';

class RequestItemDetail {
  String id;
  String businessName;
  List<String> type;
  String description;
  String latitude;
  String longtitude;
  String address;
  String displayImage;
  List<String> images;

  RequestItemDetail(
      this.id,
      this.businessName,
      this.type,
      this.description,
      this.latitude,
      this.longtitude,
      this.address,
      this.displayImage,
      this.images);
}

class Location {
  String latitude;
  String longtitude;

  Location(this.latitude, this.longtitude);
}
