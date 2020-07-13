import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final Address address;
  const User({this.name, this.address});

  @override
  List<Object> get props => throw UnimplementedError();

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address?.toMap(),
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      name: map['name'],
      address: Address.fromMap(map['address']),
    );
  }

  String toJson() => json.encode(toMap());

  static User fromJson(String source) => fromMap(json.decode(source));

  @override
  bool get stringify => true;
}

class Address extends Equatable {
  final String streetName;
  final String city;
  final int zipCode;
  const Address({this.streetName, this.city, this.zipCode});

  Map<String, dynamic> toMap() {
    return {
      'streetName': streetName,
      'city': city,
      'zipCode': zipCode,
    };
  }

  static Address fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Address(
      streetName: map['streetName'],
      city: map['city'],
      zipCode: map['zipCode'],
    );
  }

  String toJson() => json.encode(toMap());

  static Address fromJson(String source) => fromMap(json.decode(source));

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
