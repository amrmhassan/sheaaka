String errorMessage(ErrorsTypes errorType) {
  return errorsMapping[errorType]!;
}

const Map<ErrorsTypes, String> errorsMapping = {
  ErrorsTypes.locationNotEnabled: 'لم يتم تحديد موقعك',
  ErrorsTypes.locationPermissionNotGranted: 'من فضلك قم بالسماح بخدمة الموقع',
  ErrorsTypes.noUserLoggedIn: 'لم يتم تسجيل الدخول',
  ErrorsTypes.loveError: 'حدث خطأ',
  ErrorsTypes.unknownError: 'خطأ غير معروف',
  ErrorsTypes.uploadPhoto: 'خطأ أثناء رفع الصورة',
  ErrorsTypes.fetchingUserPhoto: 'خطأ في تحميل صورة المستخدم',
  ErrorsTypes.errorGettingLocation: 'خطأ في تحديد الموقع',
  ErrorsTypes.errorPlacingOrder: 'خطأ في إضافة الطلبية',
  ErrorsTypes.errorGettingOrders: 'خطأ في تحميل الطلبيات',
  ErrorsTypes.errorLoadingProducts: 'خطأ في تحميل المنتجات',
  ErrorsTypes.errorGettingNextHomeProducts: 'خطأ في تحميل مزيد من المنتجات',
  ErrorsTypes.errorGettingLikedProducts: 'خطأ في معرفة اللايكات',
  ErrorsTypes.errorUpdatingState: 'خطأ في تحديث ال state',
  ErrorsTypes.errorUpdateLovesNumber: 'خطأ في تعديل عدد اللايكات',
  ErrorsTypes.errorFetchingStores: 'خطأ في تحميل المحلات',
  ErrorsTypes.errorSignUpStore: 'خطأ في تسجيل محل جديد',
  ErrorsTypes.errorGettingUserData: 'خطأ في تحميل معلومات المسخدم'
};

enum ErrorsTypes {
  locationNotEnabled,
  locationPermissionNotGranted,
  noUserLoggedIn,
  loveError,
  unknownError,
  uploadPhoto,
  fetchingUserPhoto,
  errorGettingLocation,
  errorPlacingOrder,
  errorGettingOrders,
  errorLoadingProducts,
  errorGettingNextHomeProducts,
  errorGettingLikedProducts,
  errorUpdatingState,
  errorUpdateLovesNumber,
  errorFetchingStores,
  errorSignUpStore,
  errorGettingUserData
}
