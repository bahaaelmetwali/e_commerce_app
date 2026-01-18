enum AppLanguageCodeEnum {
  en(code: 'en'),
  ar(code: 'ar');

  final String code;
  const AppLanguageCodeEnum({required this.code});

  factory AppLanguageCodeEnum.fromCode(String code) {
    return AppLanguageCodeEnum.values.firstWhere(
      (e) => e.code.toLowerCase() == code.toLowerCase(),
      orElse: () => AppLanguageCodeEnum.en,
    );
  }
}
