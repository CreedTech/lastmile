import 'package:lastmile/src/domain/entities/user_entities.dart';

class UserModel {
  String firstName;
  String lastName;
  String phoneNumber;
  String email;
  String password;
  String? imageUrl;
  UserModel(
      {required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.email,
      required this.password,
      this.imageUrl});

  UserEntities toEntity() => UserEntities(
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        email: email,
        password: password,
        imageUrl: imageUrl,
      );

  factory UserModel.fromJson(Map<dynamic, dynamic> json) => UserModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        password: json["password"],
        imageUrl: json["imageUrl"] ?? '',
      );

  Map<dynamic, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "email": email,
        "password": password,
        "imageUrl": imageUrl,
      };
}
