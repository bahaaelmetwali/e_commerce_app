import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/core/constants/constants.dart';
import 'package:mega/app/features/Auth/data/data_source/push_token_data_source.dart';
import 'package:mega/app/features/Auth/data/model/auth_response_model.dart';
import 'package:mega/app/features/Auth/data/model/forget_password_response.dart';
import 'package:mega/app/features/Auth/data/model/otp_request_model.dart';
import 'package:mega/app/features/Auth/data/model/forget_password_model.dart';
import 'package:mega/app/features/Auth/data/model/reset_password_model.dart';

import '../../../../core/helper/api_helper.dart';
import '../model/login_request_model.dart';
import '../model/register_request_model.dart';
import '../model/verify_pass_code_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> register(RegisterRequestModel registerRequestModel);
  Future<AuthResponseModel> login(LoginRequestModel loginRequestModel);
  Future<Unit> verifyEmail(OtpRequestModel otpRequestModel);
  Future<Unit> resendVerificationCode();
  Future<ForgetPasswordResponse> forgetPassword(
    ForgetPasswordModel forgetPasswordModel,
  );
  Future<Unit> verifyPassCode(VerifyPassCodeModel verifyPassCodeModel);
  Future<Unit> resetPassWord(ResetPasswordModel resetPasswordModel);
  Future<Unit> resendPassCode();
}

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiHelper apiHelper;
  AuthRemoteDataSourceImpl(this.apiHelper, this.pushTokenDataSource);
  @override
  Future<AuthResponseModel> register(
    RegisterRequestModel registerRequestModel,
  ) async {
    final response = await apiHelper.post(
      endPoint: Constants.registerEndPoint,
      body: registerRequestModel.toJson(),
    );
    final data = response['data'];
    return AuthResponseModel.fromJson(data);
  }

  @override
  Future<AuthResponseModel> login(LoginRequestModel loginRequestModel) async {
    final response = await apiHelper.post(
      endPoint: Constants.loginEndPoint,
      body: loginRequestModel.toJson(),
    );

    final data = response['data'];
    return AuthResponseModel.fromJson(data);
  }

  @override
  Future<Unit> verifyEmail(OtpRequestModel otpRequestModel) async {
    await apiHelper.post(
      endPoint: Constants.verifyEmailEndPoint,
      body: otpRequestModel.toJson(),
    );
    return Future.value(unit);
  }

  @override
  Future<Unit> resendVerificationCode() async {
    await apiHelper.post(endPoint: Constants.resendVerificationCodeEndPoint);
    return Future.value(unit);
  }

  @override
  Future<ForgetPasswordResponse> forgetPassword(
    ForgetPasswordModel forgetPasswordModel,
  ) async {
    final response = await apiHelper.post(
      endPoint: Constants.forgetPasswordEndPoint,
      body: forgetPasswordModel.toJson(),
    );
    return ForgetPasswordResponse.fromJson(response);
  }

  @override
  Future<Unit> verifyPassCode(VerifyPassCodeModel verifyPassCodeModel) async {
    await apiHelper.post(
      endPoint: Constants.verifyPassCodeEndPoint,
      body: verifyPassCodeModel.toJson(),
    );
    return Future.value(unit);
  }

  @override
  Future<Unit> resetPassWord(ResetPasswordModel resetPasswordModel) async {
    await apiHelper.post(
      endPoint: Constants.resetPasswordEndPoint,
      body: resetPasswordModel.toJson(),
    );
    return Future.value(unit);
  }

  @override
  Future<Unit> resendPassCode() async {
    await apiHelper.post(endPoint: Constants.resendResetPassCodeEndPoint);
    return Future.value(unit);
  }
}
