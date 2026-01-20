import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mega/app/core/constants/constants.dart';
import 'package:mega/app/core/helper/api_helper.dart';
import 'package:mega/app/features/menu/data/models/about_app_model.dart';
import 'package:mega/app/features/menu/data/models/terms_model.dart';
import 'package:mega/app/features/menu/domain/use_cases/rate_app_use_case.dart';

import '../models/privacy_model.dart';

abstract class StaticRemoteDataSource {
  Future<AboutAppModel> getAboutApp();
  Future<TermsModel> getTermsAndConditions();
  Future<PrivacyModel> getPrivacyPolicy();
  Future<Unit> rateApp(RateAppParams params);
}

@Injectable(as: StaticRemoteDataSource)
class StaticRemoteDataSourceImp extends StaticRemoteDataSource {
  final ApiHelper apiHelper;
  StaticRemoteDataSourceImp({required this.apiHelper});
  @override
  Future<AboutAppModel> getAboutApp() async {
    final response = await apiHelper.get(endPoint: Constants.aboutAppEndPoint);
    return AboutAppModel.fromJson(response['data']);
  }

  @override
  Future<PrivacyModel> getPrivacyPolicy() async {
    final response = await apiHelper.get(
      endPoint: Constants.privacyPolicyEndPoint,
    );
    return PrivacyModel.fromJson(response['data']);
  }

  @override
  Future<TermsModel> getTermsAndConditions() async {
    final response = await apiHelper.get(
      endPoint: Constants.termsAndConditionsEndPoint,
    );
    return TermsModel.fromJson(response['data']);
  }

  @override
  Future<Unit> rateApp(RateAppParams params) {
    apiHelper.post(endPoint: Constants.rateAppEndPoint, body: params.toMap());
    return Future.value(unit);
  }
}
