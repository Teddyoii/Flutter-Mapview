class LocationResponse {
  int? status;
  List<Data>? data;

  LocationResponse({this.status, this.data});

  LocationResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? description;
  String? address;
  String? postcode;
  String? phoneNumber;
  String? latitude;
  String? longitude;

  Data(
      {this.id,
      this.title,
      this.description,
      this.address,
      this.postcode,
      this.phoneNumber,
      this.latitude,
      this.longitude});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    address = json['address'];
    postcode = json['postcode'];
    phoneNumber = json['phoneNumber'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['address'] = this.address;
    data['postcode'] = this.postcode;
    data['phoneNumber'] = this.phoneNumber;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

