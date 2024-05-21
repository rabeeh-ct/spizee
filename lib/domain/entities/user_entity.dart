class UserEntity {
  final String? userId;
  final String name;
  final String email;
  // final String password;
  final int role;

  UserEntity({
    required this.userId,
    required this.name,
    required this.email,
    // required this.password,
    required this.role,
  });

  Map<String,dynamic> toJson()=>{
    "user_id":userId,
    "name":name,
    "email":email,
    "role":role
  };
}