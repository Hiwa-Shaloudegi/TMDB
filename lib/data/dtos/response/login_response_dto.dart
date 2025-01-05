class LoginResponseDto {
  final String? message;
  final User? user;

  LoginResponseDto({
    this.message,
    this.user,
  });
}

class User {
  final String? name;
  final String? num;

  User({
    this.name,
    this.num,
  });
}
