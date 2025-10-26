import 'package:equatable/equatable.dart';
import 'package:present_unit_flutter/models/college_registration/college_registration_models.dart';
import 'package:present_unit_flutter/models/course/course_model.dart';
import 'package:present_unit_flutter/models/subject/subject_model.dart';

class CourseNavigation extends Equatable {
  const CourseNavigation({
    required this.documentID,
    required this.id,
    required this.name,
    required this.duration,
    this.admin,
  });

  final String documentID;
  final num id;
  final String name;
  final String duration;
  final Admin? admin;

  Map<String, dynamic> toJson() => {
        'documentID': documentID,
        'id': id,
        'name': name,
        'duration': duration,
        if (admin != null && admin!.id != -1000) 'admin': admin!.toJson(),
      };

  @override
  List<Object?> get props => [
        documentID,
        id,
        name,
        duration,
        admin,
      ];
}

class SubjectNavigation extends Equatable {
  final String documentID;
  final num id;
  final String name;
  final Course course;
  final Admin admin;
  final College? college;
  final num credit;
  final num semester;
  final String subjectCode;

  const SubjectNavigation({
    required this.documentID,
    required this.id,
    required this.name,
    required this.course,
    required this.admin,
    this.college,
    required this.credit,
    required this.semester,
    required this.subjectCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'documentID': documentID,
      'id': id,
      'name': name,
      if (course.id != -1000) 'course': course.toJson(),
      if (admin.id != -1000) 'admin': admin.toJson(),
      if (college != null && college!.id != -1000) 'college': college?.toJson(),
      'credit': credit,
      'semester': semester,
      if (subjectCode.isNotEmpty) 'subjectCode': subjectCode,
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        course,
        admin,
        college,
        credit,
        semester,
        subjectCode,
      ];
}

class FacultyNavigation extends Equatable {
  final String documentID;
  final num id;
  final String name;
  final String email;
  final String mobileNumber;
  final String password;
  final Admin admin;
  final List<Course> course;
  final List<Subject> subject;

  const FacultyNavigation({
    required this.documentID,
    required this.id,
    required this.name,
    required this.email,
    required this.mobileNumber,
    required this.password,
    required this.admin,
    required this.course,
    required this.subject,
  });

  Map<String, dynamic> toJson() {
    return {
      'documentID': documentID,
      'id': id,
      'name': name,
      'email': email,
      'mobileNumber': mobileNumber,
      'password': password,
      if (admin.id != -1000) 'admin': admin.toJson(),
      if (course.isNotEmpty) 'course': course.map((e) => e.toJson()).toList(),
      if (subject.isNotEmpty)
        'subject': subject.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        mobileNumber,
        password,
        admin,
        course,
        subject,
      ];
}
class ClassListNavigation extends Equatable {
  final String documentID;
  final num id;
  final String name;
  final String email;
  final String mobileNumber;
  final String password;
  final Admin admin;
  final List<Course> course;
  final List<Subject> subject;

  const ClassListNavigation({
    required this.documentID,
    required this.id,
    required this.name,
    required this.email,
    required this.mobileNumber,
    required this.password,
    required this.admin,
    required this.course,
    required this.subject,
  });

  Map<String, dynamic> toJson() {
    return {
      'documentID': documentID,
      'id': id,
      'name': name,
      'email': email,
      'mobileNumber': mobileNumber,
      'password': password,
      if (admin.id != -1000) 'admin': admin.toJson(),
      if (course.isNotEmpty) 'course': course.map((e) => e.toJson()).toList(),
      if (subject.isNotEmpty)
        'subject': subject.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        mobileNumber,
        password,
        admin,
        course,
        subject,
      ];
}
