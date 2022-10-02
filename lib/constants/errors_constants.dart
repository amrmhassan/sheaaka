String errorMessage(ErrorsTypes errorType) {
  return errorsMapping[errorType]!;
}

const Map<ErrorsTypes, String> errorsMapping = {
  ErrorsTypes.locationNotEnabled: 'لم يتم تحديد موقعك',
  ErrorsTypes.locationPermissionNotGranted: 'من فضلك قم بالسماح بخدمة الموقع',
  ErrorsTypes.noUserLoggedIn: 'لم يتم تسجيل الدخول',
  ErrorsTypes.loveError: 'حدث خطأ',
  ErrorsTypes.unknownError: 'خطأ غير معروف',
};

enum ErrorsTypes {
  locationNotEnabled,
  locationPermissionNotGranted,
  noUserLoggedIn,
  loveError,
  unknownError,
}
