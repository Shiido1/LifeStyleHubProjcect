class ChangePassword {
  final String? currentPassword;
  final String? newPassword;
  final String? newConfirmationPassword;
  final String? message;

  ChangePassword(
      {this.currentPassword,
      this.newPassword,
      this.newConfirmationPassword,
      this.message});

  factory ChangePassword.fromJson(json) {
    return ChangePassword(message: json['message'] ?? '');
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _map = Map<String, dynamic>();
    _map['current_password'] = this.currentPassword;
    _map['new_password'] = this.newPassword;
    _map['new_password_confirmation'] = this.newConfirmationPassword;
    return _map;
  }
}
