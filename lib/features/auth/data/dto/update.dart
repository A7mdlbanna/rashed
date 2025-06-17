class ChangePassDTO {
  ChangePassDTO({
    this.token,
    this.newPassword,
  });

  final String? token;
  final String? newPassword;

  Map<String, dynamic> toJson() => {
    if(token != null) 'token': token,
    if(newPassword != null) 'newPassword': newPassword,
  };
}