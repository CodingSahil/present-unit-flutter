import 'package:equatable/equatable.dart';
import 'package:present_unit_flutter/models/college_registration/college_registration_models.dart';
import 'package:present_unit_flutter/models/course/course_model.dart';
import 'package:present_unit_flutter/models/subject/subject_model.dart';

class Faculty extends Equatable {
  const Faculty({
    required this.documentID,
    required this.id,
    required this.name,
    required this.email,
    required this.mobileNumber,
    required this.password,
    this.fcmToken,
    this.admin,
    this.courseList,
    this.subjectList,
  });

  final String documentID;
  final num id;
  final String name;
  final String email;
  final String mobileNumber;
  final String password;
  final String? fcmToken;
  final Admin? admin;
  final List<Course>? courseList;
  final List<Subject>? subjectList;

  factory Faculty.fromJson(Map<String, dynamic> json, String documentID) =>
      Faculty(
        documentID: documentID,
        id: json['id'] as num,
        name: json['name'] as String,
        email: json['email'] as String,
        mobileNumber: json['mobileNumber'] as String,
        password: json['password'] as String,
        fcmToken: json['fcmToken'] as String?,
        admin: json['admin'] != null
            ? Admin.fromJson(
                json['admin'] as Map<String, dynamic>,'',
              )
            : null,
        courseList: json['courseList'] != null
            ? (json['courseList'] as List<dynamic>?)
                    ?.map(
                      (course) => Course.fromJson(
                        course,
                        '',
                      ),
                    )
                    .toList() ??
                []
            : null,
        subjectList: json['subjectList'] != null
            ? (json['subjectList'] as List<dynamic>?)
                    ?.map(
                      (subject) => Subject.fromJson(
                        subject,
                        '',
                      ),
                    )
                    .toList() ??
                []
            : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'mobileNumber': mobileNumber,
        'password': password,
        if (fcmToken != null && fcmToken!.isNotEmpty) 'fcmToken': fcmToken,
        if (admin != null && admin!.id != -1000) 'admin': admin!.toJson(),
        if (courseList != null && courseList!.isNotEmpty)
          'courseList': courseList!.map((course) => course.toJson()).toList(),
        if (subjectList != null && subjectList!.isNotEmpty)
          'subjectList':
              subjectList!.map((subject) => subject.toJson()).toList(),
      };

  Faculty copyWith({
    num? id,
    String? name,
    String? email,
    String? mobileNumber,
    String? password,
    String? fcmToken,
    Admin? admin,
    List<Course>? courseList,
    List<Subject>? subjectList,
  }) =>
      Faculty(
        documentID: documentID,
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        password: password ?? this.password,
        fcmToken: fcmToken ?? this.fcmToken,
        admin: admin ?? this.admin,
        courseList: courseList ?? this.courseList,
        subjectList: subjectList ?? this.subjectList,
      );

  factory Faculty.empty() => const Faculty(
        documentID: '',
        id: -1000,
        name: '',
        email: '',
        mobileNumber: '',
        password: '',
        fcmToken: null,
        admin: null,
        courseList: [],
        subjectList: [],
      );

  @override
  List<Object?> get props => [
        documentID,
        id,
        name,
        email,
        mobileNumber,
        password,
        fcmToken,
        admin,
        courseList,
        subjectList,
      ];
}
