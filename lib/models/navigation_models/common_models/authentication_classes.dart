import 'package:present_unit_flutter/helpers/enum/common_enums.dart';
import 'package:present_unit_flutter/models/class_list/class_list_models.dart';
import 'package:present_unit_flutter/models/college_registration/college_registration_models.dart';
import 'package:present_unit_flutter/models/faculty/faculty_model.dart';

class UserDetails {
  UserDetails({
    required this.admin,
    required this.faculty,
    required this.student,
    required this.userType,
  });

  UserDetails copyWith({
    Admin? admin,
    Faculty? faculty,
    Student? student,
    UserType? userType,
  }) {
    return UserDetails(
      admin: admin ?? this.admin,
      faculty: faculty ?? this.faculty,
      student: student ?? this.student,
      userType: userType ?? this.userType,
    );
  }

  factory UserDetails.clean() => UserDetails(
        admin: null,
        faculty: null,
        student: null,
        userType: UserType.none,
      );

  final Admin? admin;
  final Faculty? faculty;
  final Student? student;
  final UserType? userType;
}

UserType fetchUserType({
  required String userTypeString,
}) {
  if (userTypeString == UserType.admin.toString()) {
    return UserType.admin;
  }
  if (userTypeString == UserType.faculty.toString()) {
    return UserType.faculty;
  }
  if (userTypeString == UserType.student.toString()) {
    return UserType.student;
  }
  return UserType.none;
}
