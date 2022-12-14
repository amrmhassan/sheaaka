import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/constants/models_constants.dart';
import 'package:project/models/types.dart';
import 'package:project/utils/string_to_type_utils.dart';

class UserModel {
  final String id;
  final String userName;
  final String email;
  final String? address;
  final LatLng? location;
  final String phone;
  final UserGender userGender;
  final DateTime? birthDate;
  final UserRole userRole;
  final DateTime signupAt;
  final String? userProfilePhoto;

  const UserModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.address,
    required this.birthDate,
    required this.location,
    required this.phone,
    required this.userGender,
    required this.userRole,
    required this.signupAt,
    required this.userProfilePhoto,
  });

  Map<String, dynamic> toJSON() {
    GeoPoint? userLocation = location == null
        ? null
        : GeoPoint(location!.latitude, location!.longitude);
    return {
      idString: id,
      emailString: email,
      addressString: address,
      locationString: userLocation,
      phoneString: phone,
      userGenderString: userGender.name,
      userRoleString: userRole.name,
      birthDateString: birthDate,
      singUpString: signupAt,
      userProfilePhotoString: userProfilePhoto,
      userNameString: userName,
    };
  }

  static UserModel fromJSON(Map<String, dynamic> userJSON) {
    String id = userJSON[idString];
    String userName = userJSON[userNameString];
    String email = userJSON[emailString];
    String? address = userJSON[addressString];
    DateTime? birthDate = (userJSON[birthDateString] as Timestamp?)?.toDate();
    GeoPoint? userLocation = userJSON[locationString] as GeoPoint?;
    LatLng? location = userLocation == null
        ? null
        : LatLng(userLocation.latitude, userLocation.longitude);
    String phone = userJSON[phoneString];
    UserGender userGender =
        stringToEnum(userJSON[userGenderString], UserGender.values);
    UserRole userRole = stringToEnum(userJSON[userRoleString], UserRole.values);
    DateTime signupAt = (userJSON[singUpString] as Timestamp).toDate();
    String? userProfilePhoto = userJSON[userProfilePhotoString];

    return UserModel(
      id: id,
      email: email,
      address: address,
      birthDate: birthDate,
      location: location,
      phone: phone,
      userGender: userGender,
      userRole: userRole,
      signupAt: signupAt,
      userProfilePhoto: userProfilePhoto,
      userName: userName,
    );
  }
}
