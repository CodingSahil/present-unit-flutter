import 'package:equatable/equatable.dart';
import 'package:present_unit_flutter/models/college_registration/college_registration_models.dart';
import 'package:present_unit_flutter/models/course/course_model.dart';

class Subject extends Equatable {
  const Subject({
    required this.documentID,
    required this.id,
    required this.name,
    this.course,
    this.admin,
    required this.credit,
    this.referenceBooks,
    this.materials,
    required this.semester,
    required this.subjectCode,
  });

  factory Subject.fromJson(
    Map<String, dynamic> json,
    String documentID,
  ) => Subject(
    documentID: documentID,
    id: json['id'] as num,
    name: json['name'] as String,
    course: json['course'] != null
        ? Course.fromJson(
      json['course'] as Map<String, dynamic>,
      '',
    )
        : null,
    admin: json['admin'] != null
        ? Admin.fromJson(
      json['admin'] as Map<String, dynamic>,'',
    )
        : null,
    credit: json['credit'] as num,
    referenceBooks:
    (json['referenceBooks'] as List?)?.map((e) => e as String).toList(),
    materials: (json['materials'] as List?)?.map((e) => e as String).toList(),
    semester: json['semester'] as num,
    subjectCode: json['subjectCode'] as String,
  );

  factory Subject.empty() => const Subject(
        documentID: '',
        id: -1000,
        name: '',
        course: null,
        admin: null,
        credit: 0,
        referenceBooks: null,
        materials: null,
        semester: 0,
        subjectCode: '',
      );

  Subject copyWith({
    num? id,
    String? name,
    Course? course,
    Admin? admin,
    College? college,
    num? credit,
    List<String>? referenceBooks,
    List<String>? materials,
    num? semester,
    String? subjectCode,
  }) =>
      Subject(
        documentID: documentID,
        id: id ?? this.id,
        name: name ?? this.name,
        course: course ?? this.course,
        admin: admin ?? this.admin,
        credit: credit ?? this.credit,
        referenceBooks: referenceBooks ?? this.referenceBooks,
        materials: materials ?? this.materials,
        semester: semester ?? this.semester,
        subjectCode: subjectCode ?? this.subjectCode,
      );

  final String documentID;
  final num id;
  final String name;
  final Course? course;
  final Admin? admin;
  final num credit;
  final List<String>? referenceBooks;
  final List<String>? materials;
  final num semester;
  final String subjectCode;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        if (course != null && course!.id != -1000) 'course': course!.toJson(),
        if (admin != null && admin!.id != -1000) 'admin': admin!.toJson(),
        'credit': credit,
        if (referenceBooks != null && referenceBooks!.isNotEmpty)
          'referenceBooks': referenceBooks,
        if (materials != null && materials!.isNotEmpty) 'materials': materials,
        'semester': semester,
        'subjectCode': subjectCode,
      };

  @override
  List<Object?> get props => [
        documentID,
        id,
        name,
        course,
        admin,
        credit,
        referenceBooks,
        materials,
        semester,
        subjectCode,
      ];
}
