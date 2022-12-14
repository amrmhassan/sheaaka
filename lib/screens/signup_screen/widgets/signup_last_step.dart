// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/shimmer_loaders/locating_shimmer_loader/locating_shimmer_loader.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/types.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_checkbox.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/login_screen/widgets/custom_text_field.dart';
import 'package:project/screens/login_screen/widgets/submit_form_button.dart';
import 'package:project/screens/login_screen/widgets/title_subtitle.dart';
import 'package:project/screens/login_screen/widgets/form_header_with_logo.dart';
import 'package:project/screens/signup_screen/widgets/back_step_form_button.dart';
import 'package:project/screens/signup_screen/widgets/user_gender_element.dart';
import 'package:project/utils/general_utils.dart';
import 'package:project/utils/location_utils.dart';

class SignUpLastStep extends StatefulWidget {
  final VoidCallback incrementActiveIndex;
  final TextEditingController address;
  final DateTime? birthDate;
  final Function(DateTime d) setBirthDate;
  final UserGender userGender;
  final Function(UserGender g) setUserGender;
  final bool userAgree;
  final VoidCallback toggleUserAgree;
  final VoidCallback decrementActiveIndex;
  final Future<void> Function() signUserUp;
  final LatLng? userLocation;
  final void Function(LatLng? location) setUserLocation;

  const SignUpLastStep({
    Key? key,
    required this.incrementActiveIndex,
    required this.address,
    required this.birthDate,
    required this.setUserGender,
    required this.userGender,
    required this.userAgree,
    required this.toggleUserAgree,
    required this.decrementActiveIndex,
    required this.signUserUp,
    required this.setBirthDate,
    required this.userLocation,
    required this.setUserLocation,
  }) : super(key: key);

  @override
  State<SignUpLastStep> createState() => _SignUpLastStepState();
}

class _SignUpLastStepState extends State<SignUpLastStep> {
  final TextEditingController birthDateController = TextEditingController();
  bool _loadingLocation = false;
  void setLoadingLocation(bool b) {
    setState(() {
      _loadingLocation = b;
    });
  }

//? to locate the user
  Future<void> locating() => handleLocating(
        setLocation: widget.setUserLocation,
        context: context,
        callback: (userPlace) {
          widget.address.text = userPlace.replaceAll('/', ', ');
        },
        setStartLoading: () => setLoadingLocation(true),
        setEndLoading: () => setLoadingLocation(false),
      );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSpace(factor: 3),
        FormHeaderWithLogo(
          iconName: 'patience',
          title: '?????? ????????',
        ),
        VSpace(factor: 2),
        PaddingWrapper(
          child: Row(
            children: [
              Text(
                '?????????? ?????????? ?????????? ?????????????? ???? ??????',
                style: h5InactiveTextStyle,
              ),
              Image.asset(
                'assets/icons/pin.png',
                width: ultraSmallIconSize,
                color: kPrimaryColor,
              )
            ],
          ),
        ),
        VSpace(factor: .2),
        GestureDetector(
          onTap: locating,
          child: CustomTextField(
            autoFocus: true,
            controller: widget.address,
            iconName: 'home2',
            title: '?????????? ????????????',
            color: kSecondaryColor,
            borderColor: kSecondaryColor,
            // trailingIconName: 'pin',
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
        PaddingWrapper(
          child: Row(
            children: [
              Text(
                '???? ?????????????? ???????? ???????????? ???? ??????',
                style: h5InactiveTextStyle,
              ),
              HSpace(factor: .2),
              Image.asset(
                'assets/icons/calendar.png',
                width: ultraSmallIconSize,
                color: kPrimaryColor,
              ),
            ],
          ),
        ),
        VSpace(factor: .2),
        GestureDetector(
          onTap: () async {
            DateTime? pickedBirthDate = await showDatePicker(
              context: context,
              initialDate: widget.birthDate ??
                  DateTime.now().subtract(Duration(days: 10 * 365)),
              firstDate: DateTime.now().subtract(Duration(days: 80 * 365)),
              lastDate: DateTime.now().subtract(Duration(days: 365)),
            );
            if (pickedBirthDate != null) {
              widget.setBirthDate(pickedBirthDate);
              birthDateController.text = dateToString(pickedBirthDate);
            }
          },
          child: CustomTextField(
            enabled: false,
            controller: birthDateController,
            iconName: 'birthday-cake',
            title: '?????????? ??????????????',
            color: kSecondaryColor,
            borderColor: kSecondaryColor,
            trailingIconName: 'calendar',
            trailingIconColor: kPrimaryColor,
          ),
        ),
        VSpace(),
        PaddingWrapper(
          child: Row(
            children: [
              UserGenderElement(
                active: widget.userGender == UserGender.male,
                title: '??????',
                onTap: () => widget.setUserGender(UserGender.male),
              ),
              HSpace(),
              UserGenderElement(
                title: '????????',
                active: widget.userGender == UserGender.female,
                onTap: () => widget.setUserGender(UserGender.female),
              ),
            ],
          ),
        ),
        VSpace(),
        PaddingWrapper(
          child: Row(
            children: [
              ProductCartCheckBox(
                checked: widget.userAgree,
                onTap: widget.toggleUserAgree,
              ),
              HSpace(factor: .3),
              Expanded(
                child: TitleSubtitle(
                  onTap: widget.toggleUserAgree,
                  title: '?????????? ??????',
                  subTitle: '???????????? ????????????????',
                  padding: EdgeInsets.zero,
                ),
              )
            ],
          ),
        ),
        VSpace(),
        GestureDetector(
          onTap: widget.userAgree
              ? () {}
              : () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                    '???????? ???? ???????????????? ?????? ?????????????? ???????????????? ????????',
                    style: h4LiteTextStyle,
                  )));
                },
          child: SubmitFormButton(
            onTap: () async {
              try {
                await widget.signUserUp();
                widget.incrementActiveIndex();
              } on Exception catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(e.toString()),
                  ),
                );
              }
            },
            title: '??????????',
            active: widget.userAgree,
          ),
        ),
        BackStepFormButton(onTap: widget.decrementActiveIndex),
      ],
    );
  }
}
