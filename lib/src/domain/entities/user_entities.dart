import 'package:equatable/equatable.dart';

import '../../data/models/user_model.dart';

class UserEntities extends Equatable {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String password;
  final String? imageUrl;
  const UserEntities(
      {required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.email,
      required this.password,
      this.imageUrl});

  UserModel toModel() => UserModel(
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        email: email,
        password: password,
        imageUrl: imageUrl,
      );

  @override
  List<Object> get props =>
      [firstName, lastName, phoneNumber, email, password, imageUrl!];
}
