// class Employee {
//   int id;
//   String name;
//   String username;
//   String email;
//   dynamic profileImage;
//   Address address;
//   dynamic phone;
//   dynamic website;
//  // Company company;
//
//   Employee(
//       {this.id = -1,
//         this.name= "",
//         this.username= "",
//         this.email= "",
//         this.profileImage= "",
//         required this.address,
//         this.phone= "",
//         this.website= "",
//         //this.company = {} ,
//       });
//
//   factory Employee.fromJson(Map<String, dynamic> json) {
//     return Employee(
//       id :json['id'] as int,
//       name : json['name']as String,
//       username :json['username'] as String,
//       email : json['email']as String,
//       profileImage :json['profile_image']as dynamic ?? null,
//       address : Address.fromJson(json["address"]),
//       // json['address'] as Address,
//       //   address :
//       //   json['address'] != null ? new Address.fromJson(json['address']) : null,
//
//
//
//     phone : json['phone']as dynamic ?? null,
//       website :json['website'] as dynamic ?? null,
//     // company :Company.fromJson(json["company"]) as Company,
//      //    company :
//      //    json['company'] != null ? new Company.fromJson(json['company']) : null
//     );
//   }
//   // factory Employee.fromMap(Map<String, dynamic> map) {
//   //   return new Employee(
//   //     id :map['id'] as int,
//   //     name : map['name']as String,
//   //     username :map['username'] as String,
//   //     email : map['email']as String,
//   //     profileImage :map['profileImage'] as String,
//   //     address :map['address'] as Address,
//   //     phone : map['phone']as String,
//   //     website :map['website'] as String,
//   //     company :map['company'] as Company,
//   //   );
//   // }
// }
//
// class Address {
//   String street;
//   String suite;
//   String city;
//   String zipcode;
//  // Geo geo;
//
//   Address({this.street= "", this.suite= "", this.city= "", this.zipcode= "",
//    // required this.geo
//   });
//
//
// factory Address.fromJson(Map<String, dynamic> json) {
//   return new Address(
//     street :json['street'] as String,
//     suite : json['suite']as String,
//     city :json['city'] as String,
//     zipcode : json['zipcode']as String,
//    // geo :json['geo'] as Geo,
//   );
// }
//   // factory Address.fromMap(Map<String, dynamic> map) {
//   //   return new Address(
//   //     street :map['street'] as String,
//   //     suite : map['suite']as String,
//   //     city :map['city'] as String,
//   //     zipcode : map['zipcode']as String,
//   //     geo :map['geo'] as Geo,
//   //   );
//   // }
//
// }
//
// class Geo {
//   String lat;
//   String lng;
//
//   Geo({this.lat= "", this.lng= "",});
//
//   factory Geo.fromJson(Map<String, dynamic> json) {
//     return new Geo(
//       lat :json['lat'] as String,
//       lng : json['lng']as String,
//
//     );
//   }
//
//   // factory Geo.fromMap(Map<String, dynamic> map) {
//   //   return new Geo(
//   //     lat :map['lat'] as String,
//   //     lng : map['lng']as String,
//   //   );
//   // }
//
// }
//
// class Company {
//   String name;
//   String catchPhrase;
//   String bs;
//
//   Company({this.name= "", this.catchPhrase= "", this.bs= ""});
//
//   factory Company.fromJson(Map<String, dynamic> json) {
//     return new Company(
//       name :json['name'] as String,
//       catchPhrase : json['catchPhrase']as String,
//       bs : json['bs']as String,
//
//     );
//   }
//
// // factory Company.fromMap(Map<String, dynamic> map) {
//   //   return new Company(
//   //       name :map['name'] as String,
//   //       catchPhrase : map['catchPhrase']as String,
//   //       bs : map['bs']as String,
//   //   );
//   // }
//
// }


/// name : "Romaguera-Crona"
/// catchPhrase : "Multi-layered client-server neural-net"
/// bs : "harness real-time e-markets"


class Employee {
  int? _id;
  String? _name;
  String? _username;
  String? _email;
  String? _profileImage;
  Address? _address;
  dynamic? _phone;
  String? _website;
  Company? _company;

  int? get id => _id;
  String? get name => _name;
  String? get username => _username;
  String? get email => _email;
  String? get profileImage => _profileImage;
  Address? get address => _address;
  dynamic? get phone => _phone;
  String? get website => _website;
  Company? get company => _company;

  Employee({
    int? id,
    String? name,
    String? username,
    String? email,
    String? profileImage,
    Address? address,
    dynamic? phone,
    String? website,
    Company? company}){
    _id = id;
    _name = name;
    _username = username;
    _email = email;
    _profileImage = profileImage;
    _address = address;
    _phone = phone;
    _website = website;
    _company = company;
  }

  Employee.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _username = json["username"];
    _email = json["email"];
    _profileImage = json["profile_image"];
    _address = json["address"] != null ? Address.fromJson(json["address"]) : null;
    _phone = json["phone"];
    _website = json["website"];
    _company = json["company"] != null ? Company.fromJson(json["company"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["username"] = _username;
    map["email"] = _email;
    map["profile_image"] = _profileImage;
    if (_address != null) {
      map["address"] = _address?.toJson();
    }
    map["phone"] = _phone;
    map["website"] = _website;
    if (_company != null) {
      map["company"] = _company?.toJson();
    }
    return map;
  }


}

/// name : "Romaguera-Crona"
/// catchPhrase : "Multi-layered client-server neural-net"
/// bs : "harness real-time e-markets"

class Company {
  String? _name;
  String? _catchPhrase;
  String? _bs;

  String? get name => _name;
  String? get catchPhrase => _catchPhrase;
  String? get bs => _bs;

  Company({
    String? name,
    String? catchPhrase,
    String? bs}){
    _name = name;
    _catchPhrase = catchPhrase;
    _bs = bs;
  }

  Company.fromJson(dynamic json) {
    _name = json["name"];
    _catchPhrase = json["catchPhrase"];
    _bs = json["bs"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["catchPhrase"] = _catchPhrase;
    map["bs"] = _bs;
    return map;
  }

}

/// street : "Kulas Light"
/// suite : "Apt. 556"
/// city : "Gwenborough"
/// zipcode : "92998-3874"
/// geo : {"lat":"-37.3159","lng":"81.1496"}

class Address {
  String? _street;
  String? _suite;
  String? _city;
  String? _zipcode;
  Geo? _geo;

  String? get street => _street;
  String? get suite => _suite;
  String? get city => _city;
  String? get zipcode => _zipcode;
  Geo? get geo => _geo;

  Address({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    Geo? geo}){
    _street = street;
    _suite = suite;
    _city = city;
    _zipcode = zipcode;
    _geo = geo;
  }

  Address.fromJson(dynamic json) {
    _street = json["street"];
    _suite = json["suite"];
    _city = json["city"];
    _zipcode = json["zipcode"];
    _geo = json["geo"] != null ? Geo.fromJson(json["geo"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["street"] = _street;
    map["suite"] = _suite;
    map["city"] = _city;
    map["zipcode"] = _zipcode;
    if (_geo != null) {
      map["geo"] = _geo?.toJson();
    }
    return map;
  }

}

/// lat : "-37.3159"
/// lng : "81.1496"

class Geo {
  String? _lat;
  String? _lng;

  String? get lat => _lat;
  String? get lng => _lng;

  Geo({
    String? lat,
    String? lng}){
    _lat = lat;
    _lng = lng;
  }

  Geo.fromJson(dynamic json) {
    _lat = json["lat"];
    _lng = json["lng"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["lat"] = _lat;
    map["lng"] = _lng;
    return map;
  }

}