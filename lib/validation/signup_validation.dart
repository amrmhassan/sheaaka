//? validating user name
import 'package:project/utils/general_utils.dart';

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
  } else if (v.length != 11) {
    return 'لابد أن يكون 11 رقم';
  }

  if (!isNumeric(v)) {
    return 'لابد من إدخال قيم رقمية فقط';
  }

  String start = v.substring(0, 3);
  if (start == '011' || start == '012' || start == '010' || start == '015') {
    return null;
  } else {
    return 'صيغة الرقم غير صحيحة';
  }
}

//? store address validation
String? storeAddressValidation(String? v) {
  if (v == null) {
    return 'لا يمكن أن يكون فارغا';
  }
  if (v.isEmpty) {
    return 'لا يمكن أن يكون فارغا';
  } else if (v.length < 10) {
    return 'لا يقل عن 10 أحرف';
  }
  return null;
}

//? store name validation
String? storeNameValidation(String? v) {
  if (v == null) {
    return 'لا يمكن أن يكون فارغا';
  }
  if (v.isEmpty) {
    return 'لا يمكن أن يكون فارغا';
  } else if (v.length < 5) {
    return 'لا يقل عن 5 أحرف';
  } else if (v.length > 20) {
    return 'لا يزيد عن 20 أحرف';
  }
  return null;
}
