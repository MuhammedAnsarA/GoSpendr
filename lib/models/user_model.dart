import 'package:equatable/equatable.dart';

class Users extends Equatable {
  final String? id;
  final String fullName;
  final String email;
  final String address;
  final String city;
  final String country;
  final String zipCode;

  const Users({
    this.id,
    this.fullName = '',
    this.email = '',
    this.address = '',
    this.city = '',
    this.country = '',
    this.zipCode = '',
  });

  Users copyWith({
    String? id,
    String? fullName,
    String? email,
    String? address,
    String? city,
    String? country,
    String? zipCode,
  }) {
    return Users(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      address: address ?? this.address,
      city: city ?? this.city,
      country: country ?? this.country,
      zipCode: zipCode ?? this.zipCode,
    );
  }

  factory Users.fromJson(
    Map<String, dynamic> json, [
    String? id,
  ]) {
    return Users(
      id: id ?? json["id"],
      fullName: json['fullName'],
      email: json['email'],
      address: json['address'],
      city: json['city'],
      country: json['country'],
      zipCode: json['zipCode'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'fullName': fullName,
      'email': email,
      'address': address,
      'city': city,
      'country': country,
      'zipCode': zipCode
    };
  }

  static const empty = Users(id: "");

  @override
  List<Object?> get props =>
      [id, fullName, email, address, city, country, zipCode];
}
