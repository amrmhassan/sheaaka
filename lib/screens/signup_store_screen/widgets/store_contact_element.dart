// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/modal_wrapper/modal_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/types.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/login_screen/widgets/custom_text_field.dart';
import 'package:project/screens/signup_store_screen/widgets/phone_number_data.dart';
import 'package:project/utils/general_utils.dart';

class StoreContactsElement extends StatefulWidget {
  final String title;
  final String iconName;
  final List<String> data;
  final bool Function(String data) addData;
  final bool Function(String data) removeData;
  final Function(String? v) dataValidator;

  const StoreContactsElement({
    Key? key,
    required this.iconName,
    required this.title,
    required this.addData,
    required this.data,
    required this.removeData,
    required this.dataValidator,
  }) : super(key: key);

  @override
  State<StoreContactsElement> createState() => _StoreContactsElementState();
}

class _StoreContactsElementState extends State<StoreContactsElement> {
  bool phoneNumbersViewed = false;
  bool emailsViewed = false;
  TextEditingController dataController = TextEditingController();
  String? dataError;

  //? show all data modal
  void showDataAddedModal() {
    if (!phoneNumbersViewed) {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (ctx) {
          return ModalWrapper(
            showApplyModalButton: false,
            afterLinePaddingFactor: .5,
            applyButtonTitle: 'تم',
            onApply: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: double.infinity),
                Text(
                  widget.title,
                  style: h2TextStyle,
                ),
                VSpace(),
                PaddingWrapper(
                  child: Column(
                    children: [
                      ...widget.data.map(
                        (e) => PhoneNumberData(
                          phoneNumber: e,
                          deletePhone: () {
                            showDeleteDataModal(context, e);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
    setState(() {
      phoneNumbersViewed = !phoneNumbersViewed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            errorText: dataError,
            controller: dataController,
            padding: EdgeInsets.zero,
            iconName: widget.iconName,
            title: widget.title,
            trailingIconWidget: ButtonWrapper(
              padding: EdgeInsets.all(mediumPadding),
              onTap: () {
                String? dataValidation =
                    widget.dataValidator(dataController.text);
                setState(() {
                  dataError = dataValidation;
                });
                if (dataError == null) {
                  var res = widget.addData(dataController.text);
                  if (res) {
                    showSnackBar(context, 'تمت الإضافة', SnackBarType.info);
                    dataController.clear();
                  } else {
                    showSnackBar(context, 'موجود بالفعل', SnackBarType.error);
                  }
                }
              },
              backgroundColor: Colors.transparent,
              child: Image.asset(
                'assets/icons/plus.png',
                color: kBlackColor,
                width: smallIconSize,
              ),
            ),
          ),
        ),
        HSpace(factor: .1),
        ButtonWrapper(
          inactiveColor: Colors.transparent,
          padding: EdgeInsets.all(largePadding),
          active: widget.data.isNotEmpty,
          backgroundColor: Colors.transparent,
          onTap: showDataAddedModal,
          child: Image.asset(
            'assets/icons/up-arrow.png',
            color: widget.data.isEmpty ? kSecondaryColor : kBlackColor,
            width: mediumIconSize,
          ),
        )
      ],
    );
  }

  Future<dynamic> showDeleteDataModal(BuildContext context, String data) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (ctx) {
          return ModalWrapper(
            applyButtonColor: kDangerColor,
            onApply: () {
              bool res = widget.removeData(data);
              if (res) {
                showSnackBar(context, 'تم الحذف ', SnackBarType.info);
              } else {
                showSnackBar(context, 'لم يتم الحذف', SnackBarType.error);
              }
              Navigator.pop(context);
            },
            applyButtonTitle: 'حذف',
            child: Text(
              'حذف $data ؟',
              style: h3LiteTextStyle,
            ),
          );
        });
  }
}
