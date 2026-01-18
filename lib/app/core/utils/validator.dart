class Validator {
  const Validator._();
  static String? nameValidator(value) {
    if (value == null || value.trim().isEmpty) {
      return 'من فضلك ادخل الاسم';
    }
    return null;
  }

  static String? emailValidator(value) {
    if (value == null || value.trim().isEmpty) {
      return 'من فضلك ادخل البريد الإلكتروني';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)) {
      return 'صيغة البريد الإلكتروني غير صحيحة';
    }
    return null;
  }

  static String? phoneValidator(value) {
    if (value == null || value.isEmpty) {
      return 'من فضلك ادخل رقم الهاتف';
    }

    return null;
  }

  static String? passwordValidator(value) {
    if (value == null || value.isEmpty) {
      return 'من فضلك ادخل كلمة المرور';
    } else if (value.length < 6) {
      return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
    }
    return null;
  }

  static String? confirmPasswordValidator(
    String? value, {
    required String password,
  }) {
    if (value == null || value.isEmpty) {
      return 'من فضلك أدخل تأكيد كلمة المرور';
    }
    if (value != password) {
      return 'كلمة المرور غير متطابقة';
    }
    return null;
  }

  static String? otpValidator(value) {
    if (value == null || value.isEmpty) {
      return 'من فضلك ادخل الكود';
    } else if (value.length < 4) {
      return 'الكود يجب أن يكون 4 أرقام';
    }
    return null;
  }
}
