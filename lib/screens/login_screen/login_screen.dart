// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project/constants/colors.dart';
import 'package:project/global/widgets/full_loading_screen.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/types.dart';
import 'package:project/models/user_model.dart';
import 'package:project/providers/app_state_provider.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/providers/store_provider.dart';
import 'package:project/providers/user_provider.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/login_screen/widgets/custom_text_field.dart';
import 'package:project/screens/login_screen/widgets/title_subtitle.dart';
import 'package:project/screens/login_screen/widgets/form_header_with_logo.dart';
import 'package:project/screens/login_screen/widgets/form_promo_with_logo.dart';
import 'package:project/screens/login_screen/widgets/submit_form_button.dart';
import 'package:project/screens/login_screen/widgets/social_account_header.dart';
import 'package:project/screens/login_screen/widgets/social_button.dart';
import 'package:project/screens/signup_screen/signup_screen.dart';
import 'package:project/utils/auth_exception_utils.dart';
import 'package:project/utils/general_utils.dart';
import 'package:project/validation/signup_validation.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = '/login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //? logging in
  bool loggingIn = false;

  //? password credentials controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

//? for logging the user in
  Future<void> submitUserData() async {
    try {
      setState(() {
        loggingIn = true;
      });
      var fetchLikes = Provider.of<ProductsProvider>(context, listen: false)
          .fetchAndUpdateFavoriteProducts;
      var appStateProvider =
          Provider.of<AppStateProvider>(context, listen: false);
      var storeProvider = Provider.of<StoreProvider>(context, listen: false);
      await Provider.of<UserProvider>(context, listen: false)
          .loginEmailPassword(
        email: _emailController.text,
        password: _passwordController.text,
        context: context,
        fetchAndUpdateFavoriteProducts: fetchLikes,
        appStateProvider: appStateProvider,
        storeProvider: storeProvider,
      );
      showSnackBar(
        context: context,
        message: 'تم تسجيل الدخول',
        snackBarType: SnackBarType.success,
      );
      Navigator.pop(context, (route) => false);
    } on FirebaseAuthException catch (e) {
      showSnackBar(
          context: context,
          message: getReadableErrorMessage(e),
          snackBarType: SnackBarType.error);
    }
    setState(() {
      loggingIn = false;
    });
  }

//? validating the user input
  Future<void> validateLoginData() async {
    String? emailValidator = emailValidation(_emailController.text);
    String? passwordValidator = passwordValidation(_passwordController.text);
    setState(() {
      emailError = emailValidator;
      passwordError = passwordValidator;
    });
    if (emailError == null && passwordError == null) {
      submitUserData();
    }
  }

//? user validation errors
  String? emailError;
  String? passwordError;

  //? password showing
  bool showPassword = false;
  void toggleShowPassword() async {
    setState(() {
      showPassword = !showPassword;
    });
  }

  //? handle google sign in

  Future<void> handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await Provider.of<UserProvider>(context, listen: false)
              .googleSignIn();

      if (googleSignInAccount == null) {
        return showSnackBar(
          context: context,
          message: 'لم يتم التسجيل',
          snackBarType: SnackBarType.error,
        );
      }

      String email = googleSignInAccount.email;
      UserModel? userModel =
          await Provider.of<UserProvider>(context, listen: false)
              .getUserDataByEmail(email);
      if (userModel == null) {
        //* here the user isn't sign up and he must sign up first
        Provider.of<UserProvider>(context, listen: false).logOutGoogle();
        return showSnackBar(
            context: context,
            message: 'قم بتسجيل حساب جديد أولا',
            snackBarType: SnackBarType.error);
      } else {
        var appStateProvider =
            Provider.of<AppStateProvider>(context, listen: false);
        var storeProvider = Provider.of<StoreProvider>(context, listen: false);
        await Provider.of<UserProvider>(context, listen: false)
            .firebaseSignInGoogle(
          googleSignInAccount: googleSignInAccount,
          appStateProvider: appStateProvider,
          storeProvider: storeProvider,
          context: context,
        );
        Navigator.pop(context);
      }
    } catch (e) {
      showSnackBar(
          context: context,
          message: e.toString(),
          snackBarType: SnackBarType.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreensWrapper(
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (n) {
          n.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: PaddingWrapper(
            child: loggingIn
                ? FullLoadingScreen(
                    title: 'جاري تسجيل الدخول',
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      VSpace(),
                      FormHeaderWithLogo(
                        iconName: 'login',
                        title: 'شياكة',
                      ),
                      VSpace(factor: 2),
                      Column(
                        children: [
                          FormPromoWithLogo(
                            title: 'تسجيل الدخول',
                          ),
                          VSpace(factor: .5),
                          CustomTextField(
                            controller: _emailController,
                            title: 'الايميل',
                            iconName: 'mail',
                            errorText: emailError,
                            textInputType: TextInputType.emailAddress,
                            color: kSecondaryColor,
                            borderColor: kSecondaryColor,
                          ),
                          VSpace(factor: .5),
                          CustomTextField(
                            controller: _passwordController,
                            title: 'الرقم السري',
                            iconName: 'key',
                            trailingIconName: showPassword ? 'hide' : 'view',
                            errorText: passwordError,
                            handleShowPassword: toggleShowPassword,
                            password: !showPassword,
                            color: kSecondaryColor,
                            borderColor: kSecondaryColor,
                          ),
                          VSpace(),
                          SubmitFormButton(
                            title: 'تسجيل الدخول',
                            onTap: validateLoginData,
                          ),
                          VSpace(),
                          TitleSubtitle(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, SignUpScreen.routeName);
                            },
                          ),
                        ],
                      ),
                      VSpace(factor: 2),
                      Column(
                        children: [
                          SocialAccountsHeader(),
                          VSpace(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SocialButton(
                                title: 'Google',
                                iconName: 'google',
                                onTap: handleGoogleSignIn,
                              ),
                              SocialButton(
                                title: 'Facebook',
                                iconName: 'facebook',
                                onTap: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                      VSpace(factor: 3)
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
