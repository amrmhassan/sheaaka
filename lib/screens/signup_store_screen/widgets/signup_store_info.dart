// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/login_screen/widgets/custom_text_field.dart';
import 'package:project/screens/login_screen/widgets/form_header_with_logo.dart';
import 'package:project/screens/login_screen/widgets/submit_form_button.dart';
import 'package:project/screens/signup_store_screen/widgets/store_contact_element.dart';
import 'package:project/validation/signup_validation.dart';

class SignUpStoreInfo extends StatefulWidget {
  final VoidCallback incrementActiveIndex;
  final List<String> storePhoneNumbers;
  final List<String> storeEmails;
  final bool Function(String storeNumber) addAStoreNumber;
  final bool Function(String storeNumber) removeAStoreNumber;
  final bool Function(String email) addStoreEmail;
  final bool Function(String email) removeStoreEmail;
  final TextEditingController storeNameController;
  final TextEditingController storeAddressController;

  const SignUpStoreInfo({
    Key? key,
    required this.incrementActiveIndex,
    required this.addAStoreNumber,
    required this.addStoreEmail,
    required this.removeAStoreNumber,
    required this.removeStoreEmail,
    required this.storeEmails,
    required this.storePhoneNumbers,
    required this.storeAddressController,
    required this.storeNameController,
  }) : super(key: key);

  @override
  State<SignUpStoreInfo> createState() => _SignUpStoreInfoState();
}

class _SignUpStoreInfoState extends State<SignUpStoreInfo> {
  String? storeNameError;
  String? storeAddressError;
  String? phoneNumberError;

  @override
  Widget build(BuildContext context) {
    return PaddingWrapper(
      child: Column(
        children: [
          VSpace(factor: 3),
          FormHeaderWithLogo(
            iconName: 'clothing-shop',
            title: 'معلومات المتجر',
          ),
          VSpace(factor: 2),
          CustomTextField(
            errorText: storeNameError,
            controller: widget.storeNameController,
            iconName: 'shop',
            title: 'اسم المحل',
            padding: EdgeInsets.zero,
          ),
          VSpace(),
          CustomTextField(
            errorText: storeAddressError,
            controller: widget.storeAddressController,
            padding: EdgeInsets.zero,
            iconName: 'shop',
            title: 'عنوان المحل',
            trailingIconColor: kPrimaryColor,
            trailingIconName: 'pin',
          ),
          VSpace(),
          StoreContactsElement(
            errorText: phoneNumberError,
            textInputType: TextInputType.phone,
            iconName: 'telephone',
            title: 'إضافة أرقام المحل',
            data: widget.storePhoneNumbers,
            addData: (String phone) {
              bool res = widget.addAStoreNumber(phone);
              if (res && phoneNumberError != null) {
                setState(() {
                  phoneNumberError = null;
                });
              }
              return res;
            },
            removeData: widget.removeAStoreNumber,
            dataValidator: phoneValidation,
          ),
          VSpace(),
          StoreContactsElement(
            textInputType: TextInputType.emailAddress,
            iconName: 'email',
            title: 'إضافة إيميلات المحل',
            addData: widget.addStoreEmail,
            data: widget.storeEmails,
            removeData: widget.removeStoreEmail,
            dataValidator: emailValidation,
          ),
          VSpace(),
          SubmitFormButton(
            onTap: () {
              String sN = widget.storeNameController.text;
              String? nameValidator = storeNameValidation(sN);
              String sA = widget.storeAddressController.text;
              String? addressValidation = storeAddressValidation(sA);

              setState(() {
                storeNameError = nameValidator;
                storeAddressError = addressValidation;
                phoneNumberError = widget.storePhoneNumbers.isEmpty
                    ? 'لابد من إضافة رقم هاتف علي الأقل'
                    : null;
              });
              if (storeNameError == null &&
                  storeAddressError == null &&
                  phoneNumberError == null) {
                widget.incrementActiveIndex();
              }
            },
            title: 'التالي',
            padding: EdgeInsets.zero,
          ),
          VSpace(),
        ],
      ),
    );
  }
}
