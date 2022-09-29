//? validating user name
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

//? validating email
String? emailValidation(String? v) {
  bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(v.toString());

  if (v == null) {
    return 'لا يمكن أن يكون فارغا';
  }
  if (v.isEmpty) {
    return 'لا يمكن أن يكون فارغا';
  } else if (v.length < 3) {
    return 'لا يقل عن 3 أحرف';
  } else if (!emailValid) {
    return 'صيغة الايميل غير صالحة';
  }
  return null;
}

//? password
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

//? password confirmation
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

//? phone number
String? phoneValidation(String? v) {
  if (v == null) {
    return 'لا يمكن أن يكون فارغا';
  }
  if (v.isEmpty) {
    return 'لا يمكن أن يكون فارغا';
  } else if (v.length < 11) {
    return 'لا يقل عن 11 رقم';
  } else if ((!v.startsWith('01')) ||
      (!v.startsWith('012')) ||
      (!v.startsWith('010')) ||
      (!v.startsWith('015'))) {
    return 'صيغة الرقم غير صحيحة';
  }
  return null;
}
