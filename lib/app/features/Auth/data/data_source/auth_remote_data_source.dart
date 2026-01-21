import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/helper/api_helper.dart';
import '../../domain/use_cases/change_password_use_case.dart';
import '../../domain/use_cases/forget_password_use_case.dart';
import '../../domain/use_cases/login_use_case.dart';
import '../../domain/use_cases/register_use_case.dart';
import '../../domain/use_cases/reset_password_use_case.dart';
import '../../domain/use_cases/update_email_use_case.dart';
import '../../domain/use_cases/update_profile_use_case.dart';
import '../../domain/use_cases/verify_email_update_use_case.dart';
import '../../domain/use_cases/verify_email_use_case.dart';
import '../../domain/use_cases/verify_pass_code_use_case.dart';
import '../model/auth_response_model.dart';
import '../model/profile_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> register(RegisterParams params);
  Future<AuthResponseModel> login(LoginParams params);

  Future<Unit> verifyEmail(VerifyEmailOtpRequestParams params);
  Future<Unit> resendVerificationCode();

  Future<Unit> forgetPassword(ForgetPasswordParams params);
  Future<Unit> verifyPassCode(VerifyPassCodeParams params);
  Future<Unit> resetPassword(ResetPasswordParams params);
  Future<Unit> resendResetPassCode();

  Future<Unit> logout();

  Future<ProfileModel> getProfile();
  Future<ProfileModel> updateProfile(UpdateUserProfileParams params);

  Future<Unit> changePassword(ChangePasswordParams params);
  Future<Unit> updateEmail(UpdateEmailParams params);
  Future<Unit> resendEmailUpdate();
  Future<Unit> verifyEmailUpdated(OtpRequestParams params);
}

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiHelper apiHelper;
  AuthRemoteDataSourceImpl(this.apiHelper);

  @override
  Future<AuthResponseModel> register(RegisterParams params) async {
    final response = await apiHelper.post(
      endPoint: Constants.registerEndPoint,
      json: params.toMap(),
    );
    return AuthResponseModel.fromJson(response['data']);
  }

  @override
  Future<AuthResponseModel> login(LoginParams params) async {
    final response = await apiHelper.post(
      endPoint: Constants.loginEndPoint,
      json: params.toMap(),
    );
    return AuthResponseModel.fromJson(response['data']);
  }

  @override
  Future<Unit> verifyEmail(VerifyEmailOtpRequestParams params) async {
    await apiHelper.post(
      endPoint: Constants.verifyEmailEndPoint,
      json: params.toMap(),
    );
    return unit;
  }

  @override
  Future<Unit> resendVerificationCode() async {
    await apiHelper.post(endPoint: Constants.resendVerificationCodeEndPoint);
    return unit;
  }

  @override
  Future<Unit> forgetPassword(ForgetPasswordParams params) async {
    await apiHelper.post(
      endPoint: Constants.forgetPasswordEndPoint,
      json: params.toMap(),
    );
    return unit;
  }

  @override
  Future<Unit> verifyPassCode(VerifyPassCodeParams params) async {
    await apiHelper.post(
      endPoint: Constants.verifyPassCodeEndPoint,
      json: params.toMap(),
    );
    return unit;
  }

  @override
  Future<Unit> resetPassword(ResetPasswordParams params) async {
    await apiHelper.post(
      endPoint: Constants.resetPasswordEndPoint,
      json: params.toMap(),
    );
    return unit;
  }

  @override
  Future<Unit> resendResetPassCode() async {
    await apiHelper.post(endPoint: Constants.resendResetPassCodeEndPoint);
    return unit;
  }

  @override
  Future<Unit> logout() async {
    await apiHelper.post(endPoint: Constants.logoutEndPoint);
    return unit;
  }

  @override
  Future<ProfileModel> getProfile() async {
    final response = await apiHelper.get(
      endPoint: Constants.getProfileEndPoint,
    );
    return ProfileModel.fromJson(response);
  }

  @override
  Future<ProfileModel> updateProfile(UpdateUserProfileParams params) async {
    final response = await apiHelper.put(
      endPoint: Constants.getProfileEndPoint,
      formData: params.toMap(),
    );
    return ProfileModel.fromJson(response);
  }

  @override
  Future<Unit> changePassword(ChangePasswordParams params) async {
    await apiHelper.put(
      endPoint: Constants.updatePasswordEndPoint,
      json: params.toMap(),
    );
    return unit;
  }

  @override
  Future<Unit> updateEmail(UpdateEmailParams params) async {
    await apiHelper.post(
      endPoint: Constants.updateEmailEndPoint,
      json: params.toMap(),
    );
    return unit;
  }

  @override
  Future<Unit> resendEmailUpdate() async {
    await apiHelper.post(endPoint: Constants.resentUpdateEmailEndPoint);
    return unit;
  }

  @override
  Future<Unit> verifyEmailUpdated(OtpRequestParams params) async {
    await apiHelper.post(
      endPoint: Constants.verifyUpdateEmailEndPoint,
      json: params.toMap(),
    );
    return unit;
  }
}
