import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final Address address;
  const User({this.name, this.address});

  @override
  List<Object> get props => [name, address];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'address': address?.toJson(),
    };
  }

  static User fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return User(
      name: json['name'] as String,
      address: Address.fromJson(
        Map<String, dynamic>.from(json['address'] as Map),
      ),
    );
  }

  @override
  bool get stringify => true;
}

class Address extends Equatable {
  final String streetName;
  final String city;
  final int zipCode;
  const Address({this.streetName, this.city, this.zipCode});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'streetName': streetName,
      'city': city,
      'zipCode': zipCode,
    };
  }

  static Address fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return Address(
      streetName: map['streetName'] as String,
      city: map['city'] as String,
      zipCode: map['zipCode'] as int,
    );
  }

  Address copyWith({
    String streetName,
    String city,
    int zipCode,
  }) {
    return Address(
      streetName: streetName ?? this.streetName,
      city: city ?? this.city,
      zipCode: zipCode ?? this.zipCode,
    );
  }

  @override
  List<Object> get props => [streetName, city, zipCode];

  @override
  bool get stringify => true;
}
