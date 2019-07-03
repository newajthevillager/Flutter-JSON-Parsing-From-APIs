class CityBikeNetworkList {
  List<Networks> networks;

  CityBikeNetworkList({this.networks});

  CityBikeNetworkList.fromJson(Map<String, dynamic> json) {
    if (json['networks'] != null) {
      networks = new List<Networks>();
      json['networks'].forEach((v) {
        networks.add(new Networks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.networks != null) {
      data['networks'] = this.networks.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

/*
 * Variable 'company' has a problem in API
 * its a list of string
 * but at one place it is just a string
 */
class Networks {
  // List<String> company;
  String href;
  String id;
  Location location;
  String name;

  Networks({this.href, this.id, this.location, this.name});

  Networks.fromJson(Map<String, dynamic> json) {
    // company = json['company']?.cast<String>();
    href = json['href'];
    id = json['id'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['company'] = this.company;
    data['href'] = this.href;
    data['id'] = this.id;
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    data['name'] = this.name;
    return data;
  }
}

class Location {
  String city;
  String country;
  double latitude;
  double longitude;

  Location({this.city, this.country, this.latitude, this.longitude});

  Location.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    country = json['country'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['country'] = this.country;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
