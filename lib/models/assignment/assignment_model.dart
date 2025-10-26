import 'package:equatable/equatable.dart';
import 'package:present_unit_flutter/models/class_list/class_list_models.dart';
import 'package:present_unit_flutter/models/faculty/faculty_model.dart';
import 'package:present_unit_flutter/models/subject/subject_model.dart';

class AssignmentModel extends Equatable {
  const AssignmentModel({
    required this.documentID,
    required this.id,
    required this.faculty,
    required this.subject,
    required this.classListModel,
    required this.studentList,
    required this.submissionDate,
    required this.assignmentURL,
    required this.assignmentType,
    this.submittedAssignmentStudentList,
  });

  final String documentID;
  final num id;
  final Faculty faculty;
  final Subject subject;
  final ClassListModel classListModel;
  final List<Student> studentList;
  final String submissionDate;
  final String assignmentType;
  final String assignmentURL;
  final List<Student>? submittedAssignmentStudentList;

  @override
  List<Object?> get props => [
        documentID,
        id,
        faculty,
        subject,
        classListModel,
        studentList,
        submissionDate,
        assignmentURL,
        assignmentType,
        submittedAssignmentStudentList,
      ];

  factory AssignmentModel.fromJson(
    Map<String, dynamic> json,
    String documentID,
  ) {
    return AssignmentModel(
      documentID: documentID,
      id: json['id'] as int,
      faculty: Faculty.fromJson(
        json['faculty'] as Map<String, dynamic>,
        '',
      ),
      subject: Subject.fromJson(
        json['subject'] as Map<String, dynamic>,
        '',
      ),
      classListModel: ClassListModel.fromJson(
        json['classListModel'] as Map<String, dynamic>,
        '',
      ),
      studentList: (json['studentList'] as List)
          .map(
            (e) => Student.fromJson(
              e as Map<String, dynamic>,
              '',
            ),
          )
          .toList(),
      submissionDate: json['submissionDate'] as String,
      assignmentURL: json['assignmentURL'] as String,
      assignmentType: json['assignmentType'] as String,
      submittedAssignmentStudentList: json['submittedAssignmentStudentList'] != null
          ? (json['submittedAssignmentStudentList'] as List)
              .map(
                (e) => Student.fromJson(
                  e as Map<String, dynamic>,
                  '',
                ),
              )
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'faculty': faculty.toJson(),
        'subject': subject.toJson(),
        'classListModel': classListModel.toJson(),
        if (studentList.isNotEmpty) 'studentList': studentList.map((e) => e.toJson()).toList(),
        if (submissionDate.isNotEmpty) 'submissionDate': submissionDate,
        if (assignmentURL.isNotEmpty) 'assignmentURL': assignmentURL,
        if (assignmentType.isNotEmpty) 'assignmentType': assignmentType,
        if (submittedAssignmentStudentList != null && submittedAssignmentStudentList!.isNotEmpty) 'submittedAssignmentStudentList': submittedAssignmentStudentList?.map((e) => e.toJson()).toList(),
      };

  AssignmentModel copyWith({
    int? id,
    Faculty? faculty,
    Subject? subject,
    ClassListModel? classListModel,
    List<Student>? studentList,
    String? submissionDate,
    String? assignmentURL,
    String? assignmentType,
    List<Student>? submittedAssignmentStudentList,
  }) {
    return AssignmentModel(
      documentID: documentID,
      id: id ?? this.id,
      faculty: faculty ?? this.faculty,
      subject: subject ?? this.subject,
      classListModel: classListModel ?? this.classListModel,
      studentList: studentList ?? this.studentList,
      submissionDate: submissionDate ?? this.submissionDate,
      assignmentURL: assignmentURL ?? this.assignmentURL,
      assignmentType: assignmentType ?? this.assignmentType,
      submittedAssignmentStudentList: submittedAssignmentStudentList ?? this.submittedAssignmentStudentList,
    );
  }
}
