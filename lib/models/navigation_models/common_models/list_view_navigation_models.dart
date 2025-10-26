import 'package:present_unit_flutter/models/assignment/assignment_model.dart';
import 'package:present_unit_flutter/models/class_list_for_attendance/class_list_for_attendance.dart';

class CommonLectureListModel {
  const CommonLectureListModel({
    required this.label,
    required this.lectureList,
  });

  final String label;
  final List<ClassesForAttendanceModel> lectureList;
}

class CommonAssignmentListModel {
  const CommonAssignmentListModel({
    required this.label,
    required this.assignmentList,
  });

  final String label;
  final List<AssignmentModel> assignmentList;
}
