part of 'language_cubit.dart';

 class LanguageState extends Equatable {
   final AppLanguageCodeEnum? languageCode;
  const LanguageState(this.languageCode);
  @override
  List<Object?> get props => [languageCode];


}

