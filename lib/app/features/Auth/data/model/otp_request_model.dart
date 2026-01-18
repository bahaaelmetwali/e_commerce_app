class OtpRequestModel {
  final String otp;
  OtpRequestModel({required this.otp});

  Map<String, dynamic> toJson() {
    return {'code': otp};
  }
}
