import 'package:flutter/cupertino.dart';

bool validateTextInput({
  required List<String> formErrors,
  required Function(List<String> v) setFormErrors,
  required TextEditingController controller,
  required Function(String? error) onError,
  String? lengthError,
  String? emptyError,
  int? minLength,
  bool canBeEmpty = false,
}) {
  if (!canBeEmpty && controller.text.isEmpty) {
    String eLength = 'لا يمكن أن يكون فارغا';
    onError(eLength);
    List<String> formErrorsHelper = [];
    formErrorsHelper.add(eLength);
    setFormErrors(formErrorsHelper);
    return false;
  } else if (controller.text.length < (minLength ?? 3)) {
    String eEmpty = 'لا يقل عن $minLengthأحرف';
    List<String> formErrorsHelper = [];
    formErrorsHelper.add(eEmpty);
    setFormErrors(formErrorsHelper);
    onError(eEmpty);
    return false;
  }
  onError(null);
  return true;
}

String? userNameValidation(String? v) {
  if (v == null) {
    return 'لا يمكن أن يكون فارغا';
  }
  if (v.isEmpty) {
    return 'لا يمكن أن يكون فارغا';
  } else if (v.length < 3) {
    return 'لا يقل عن 3 أحرف';
  }
  return null;
}

String? emailValidation(String? v) {
  if (v == null) {
    return 'لا يمكن أن يكون فارغا';
  }
  if (v.isEmpty) {
    return 'لا يمكن أن يكون فارغا';
  } else if (v.length < 3) {
    return 'لا يقل عن 3 أحرف';
  }
  return null;
}

String? passwordValidation(String? v) {
  if (v == null) {
    return 'لا يمكن أن يكون فارغا';
  }
  if (v.isEmpty) {
    return 'لا يمكن أن يكون فارغا';
  } else if (v.length < 8) {
    return 'لا يقل عن 8 أحرف';
  }
  return null;
}

String? passConfirmValidation(String? v, String equalsTo) {
  if (v == null) {
    return 'لا يمكن أن يكون فارغا';
  }
  if (v.isEmpty) {
    return 'لا يمكن أن يكون فارغا';
  } else if (v.length < 8) {
    return 'لا يقل عن 8 أحرف';
  } else if (v != equalsTo) {
    return 'لا تطابق كلمة السر';
  }
  return null;
}

String? phoneValidation(String? v) {
  if (v == null) {
    return 'لا يمكن أن يكون فارغا';
  }
  if (v.isEmpty) {
    return 'لا يمكن أن يكون فارغا';
  } else if (v.length < 11) {
    return 'لا يقل عن 11 أحرف';
  }
  return null;
}
