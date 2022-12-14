// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/shimmer_loaders/locating_shimmer_loader/locating_shimmer_loader.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/login_screen/widgets/custom_text_field.dart';
import 'package:project/screens/login_screen/widgets/form_header_with_logo.dart';
import 'package:project/screens/login_screen/widgets/submit_form_button.dart';
import 'package:project/screens/signup_store_screen/widgets/store_contact_element.dart';
import 'package:project/utils/location_utils.dart';
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
  final Function(LatLng? location) setStoreLocation;

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
    required this.setStoreLocation,
  }) : super(key: key);

  @override
  State<SignUpStoreInfo> createState() => _SignUpStoreInfoState();
}

class _SignUpStoreInfoState extends State<SignUpStoreInfo> {
  String? storeNameError;
  String? storeAddressError;
  String? phoneNumberError;

  bool _loadingLocation = false;
  void setLoadingLocation(bool b) {
    setState(() {
      _loadingLocation = b;
    });
  }

//? for locating the store
  Future<void> locating() => handleLocating(
        setLocation: widget.setStoreLocation,
        context: context,
        callback: (userPlace) {
          widget.storeAddressController.text = userPlace.replaceAll('/', ', ');
        },
        setStartLoading: () => setLoadingLocation(true),
        setEndLoading: () => setLoadingLocation(false),
      );
  @override
  Widget build(BuildContext context) {
    return PaddingWrapper(
      child: Column(
        children: [
          VSpace(factor: 3),
          FormHeaderWithLogo(
            iconName: 'clothing-shop',
            title: '?????????????? ????????????',
          ),
          VSpace(factor: 2),
          CustomTextField(
            errorText: storeNameError,
            controller: widget.storeNameController,
            iconName: 'shop',
            title: '?????? ??????????',
            autoFocus: true,
            padding: EdgeInsets.zero,
          ),
          VSpace(),
          GestureDetector(
            onTap: locating,
            child: CustomTextField(
              maxLines: 3,
              padding: EdgeInsets.zero,
              errorText: storeAddressError,
              controller: widget.storeAddressController,
              iconName: 'shop',
              title: '?????????? ??????????',
              trailingIcon: _loadingLocation
                  ? LocatingShimmerLoader()
                  : GestureDetector(
                      onTap: locating,
                      child: Image.asset(
                        'assets/icons/pin.png',
                        width: mediumIconSize,
                        color: kPrimaryColor,
                      ),
                    ),
              trailingIconColor: kPrimaryColor,
            ),
          ),
          VSpace(),
          StoreContactsElement(
            errorText: phoneNumberError,
            textInputType: TextInputType.phone,
            iconName: 'telephone',
            title: '?????????? ?????????? ??????????',
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
            title: '?????????? ?????????????? ??????????',
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
                    ? '???????? ???? ?????????? ?????? ???????? ?????? ??????????'
                    : null;
              });
              if (storeNameError == null &&
                  storeAddressError == null &&
                  phoneNumberError == null) {
                widget.incrementActiveIndex();
              }
            },
            title: '????????????',
            padding: EdgeInsets.zero,
          ),
          VSpace(),
        ],
      ),
    );
  }
}
