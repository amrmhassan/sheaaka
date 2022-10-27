// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/global/widgets/full_loading_screen.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/models/types.dart';
import 'package:project/providers/store_provider.dart';
import 'package:project/screens/signup_store_screen/widgets/signup_finish_store.dart';
import 'package:project/screens/signup_store_screen/widgets/signup_store_info.dart';
import 'package:project/screens/signup_store_screen/widgets/signup_store_logo_upload.dart';
import 'package:project/utils/general_utils.dart';
import 'package:provider/provider.dart';

class SignUpStoreScreen extends StatefulWidget {
  static const String routeName = '/signup-store-screen';
  const SignUpStoreScreen({Key? key}) : super(key: key);

  @override
  State<SignUpStoreScreen> createState() => _SignUpStoreScreenState();
}

class _SignUpStoreScreenState extends State<SignUpStoreScreen> {
  //? submit store data
  Future<void> submitStoreData() async {
    setSigningUp(true);

    try {
      await Provider.of<StoreProvider>(context, listen: false).signUpStore(
        coverImagePath: storeCoverPhoto!,
        location: storeLocation,
        logoImagePath: storeLogoPhoto,
        name: storeNameController.text,
        emails: storeEmails,
        phones: storePhoneNumbers,
        addressController: storeAddressController,
      );

      showSnackBar(
        context: context,
        message: 'تم إنشاء متجرك بنجاح',
        snackBarType: SnackBarType.success,
      );

      incrementActiveIndex();
    } catch (e) {
      showSnackBar(
          context: context,
          message: e.toString(),
          snackBarType: SnackBarType.error);
    }

    setSigningUp(false);
  }

//? store location
  LatLng? storeLocation;
  void setStoreLocation(LatLng? latLng) {
    setState(() {
      storeLocation = latLng;
    });
  }

  //? store logo
  String? storeLogoPhoto;
  void setStoreLogoPhoto(String? s) {
    setState(() {
      storeLogoPhoto = s;
    });
  }

  //? store cover photo
  String? storeCoverPhoto;
  void setStoreCoverPhoto(String? s) {
    setState(() {
      storeCoverPhoto = s;
    });
  }

  //? store text editing controllers
  TextEditingController storeNameController = TextEditingController();
  TextEditingController storeAddressController = TextEditingController();

  //? store phone numbers
  List<String> storePhoneNumbers = [];
  bool addAStoreNumber(String storeNumber) {
    if (storePhoneNumbers.contains(storeNumber)) {
      return false;
    }
    setState(() {
      storePhoneNumbers.add(storeNumber);
    });
    return true;
  }

  bool removeAStoreNumber(String phone) {
    if (!storePhoneNumbers.contains(phone)) {
      return false;
    }
    setState(() {
      storePhoneNumbers.remove(phone);
    });
    return true;
  }

  //? store emails
  List<String> storeEmails = [];
  bool addStoreEmail(String email) {
    if (storeEmails.contains(email)) {
      return false;
    }
    setState(() {
      storeEmails.add(email);
    });
    return true;
  }

  bool removeStoreEmail(String email) {
    if (!storeEmails.contains(email)) {
      return false;
    }
    setState(() {
      storeEmails.remove(email);
    });
    return true;
  }

//? for signing up indicator
  bool signingUp = false;
  void setSigningUp(bool s) {
    setState(() {
      signingUp = s;
    });
  }

  Widget getSignupStep(int i) {
    if (i == 0) {
      return SignUpStoreInfo(
        incrementActiveIndex: incrementActiveIndex,
        addAStoreNumber: addAStoreNumber,
        addStoreEmail: addStoreEmail,
        removeAStoreNumber: removeAStoreNumber,
        removeStoreEmail: removeStoreEmail,
        storeEmails: storeEmails,
        storePhoneNumbers: storePhoneNumbers,
        storeAddressController: storeAddressController,
        storeNameController: storeNameController,
        setStoreLocation: setStoreLocation,
      );
    } else if (i == 1) {
      //! at this step the store will be signed up then move to the next step
      return SingUpStoreLogoUpload(
        incrementActiveIndex: incrementActiveIndex,
        decrementActiveIndex: decrementActiveIndex,
        setStoreCoverPhoto: setStoreCoverPhoto,
        setStoreLogoPhoto: setStoreLogoPhoto,
        storeCoverPhoto: storeCoverPhoto,
        storeLogoPhoto: storeLogoPhoto,
        submitStoreData: submitStoreData,
      );
    } else if (i == 2) {
      //! no back step here cause the store will have been signed up
      return SignUpFinishStore(
        decrementActiveIndex: decrementActiveIndex,
      );
    }
    return SizedBox();
  }

  int activeStepIndex = 0;
  void incrementActiveIndex() {
    setState(() {
      activeStepIndex++;
    });
  }

  void decrementActiveIndex() {
    setState(() {
      activeStepIndex--;
    });
  }

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      String? userLogo = ModalRoute.of(context)!.settings.arguments as String?;
      setStoreLogoPhoto(userLogo);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreensWrapper(
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (n) {
          n.disallowIndicator();
          return true;
        },
        child: signingUp
            ? FullLoadingScreen(title: 'جاري التسجيل')
            : SingleChildScrollView(
                child: getSignupStep(activeStepIndex),
              ),
      ),
    );
  }
}
