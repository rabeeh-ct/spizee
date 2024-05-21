import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    super.userId,
    required super.name,
    required super.email,
    // required super.password,
    required super.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json,{String? id}) => UserModel(
    userId: id??json["user_id"],
    name: json["name"],
    email: json["email"],
    // password: json["password"],
    role: json["role"],
  );

  @override
  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "name": name,
    "email": email,
    // "password": password,
    "role": role,
  };
}
