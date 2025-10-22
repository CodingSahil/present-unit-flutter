import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:present_unit_flutter/helper-widgets/text-field/labled_textform_field.dart';
import 'package:present_unit_flutter/helpers/colors/app_color.dart';
import 'package:present_unit_flutter/helpers/extension/double_widget.dart';
import 'package:present_unit_flutter/helpers/extension/string_print.dart';
import 'package:present_unit_flutter/helpers/extension/string_widget.dart';
import 'package:present_unit_flutter/helpers/labels/label_strings.dart';
import 'package:present_unit_flutter/main.dart';
import 'package:present_unit_flutter/model/class_list/class_list_models.dart';
import 'package:present_unit_flutter/model/college_registration/college_registration_models.dart';
import 'package:present_unit_flutter/model/course/course_model.dart';
import 'package:present_unit_flutter/model/navigation_models/common_models/bottomsheet_selection_model.dart';

Future<dynamic> showCommonBottomSheet({
  required BuildContext context,
  required String title,
  required List<BottomSheetSelectionModel> listOfItems,
  required BottomSheetSelectionModel? selectValue,
  required void Function(BottomSheetSelectionModel selectValue) onSubmit,
}) async {
  BottomSheetSelectionModel? selectValueLocal =
      listOfItems.any(
        (element) =>
            element.id == selectValue?.id && element.name.trim().toLowerCase() == selectValue?.name.trim().toLowerCase(),
      )
      ? listOfItems.firstWhere(
          (element) =>
              element.id == selectValue?.id && element.name.trim().toLowerCase() == selectValue?.name.trim().toLowerCase(),
        )
      : null;
  listOfItems.length.toString().logOnString('list => ');
  await showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.white,
    scrollControlDisabledMaxHeightRatio: 0.8,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) => listOfItems.isEmpty
            ? Center(child: LabelStrings.noData.textWidget(fontSize: 16, color: AppColors.black))
            : Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.sizeOf(context).width,
                    padding: EdgeInsets.symmetric(vertical: 28),
                    child: title.textWidget(fontSize: 16, color: AppColors.primaryColor),
                  ),
                  Divider(color: AppColors.black.withAlpha((255 * 0.5).toInt()), thickness: 0.5, height: 1),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.symmetric(vertical: 28, horizontal: 20),
                      children: listOfItems
                          .map(
                            (item) => Column(
                              children: [
                                RadioListTile<String>(
                                  value: item.name,
                                  groupValue: selectValueLocal?.name,
                                  activeColor: AppColors.primaryColor,
                                  title: item.name.textWidget(
                                    fontSize: 12,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                  controlAffinity: ListTileControlAffinity.leading,
                                  selected: selectValueLocal?.id == item.id,
                                  onChanged: (value) {
                                    setState(() {
                                      selectValueLocal = item;
                                    });
                                  },
                                ),
                                6.height,
                                // Divider(
                                //   height: 1,
                                //   thickness: 0.5,
                                //   color: AppColors.black.withAlpha(
                                //     (255 * 0.5).toInt(),
                                //   ),
                                // ),
                                // SizedBox(height: Dimens.height6),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  if (selectValueLocal != null)
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        if (selectValueLocal != null) {
                          onSubmit(selectValueLocal!);
                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(15)),
                        width: MediaQuery.sizeOf(context).width,
                        margin: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: 'Submit'.textWidget(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.white),
                      ),
                    ),
                  if (Platform.isIOS) 24.height,
                ],
              ),
      );
    },
  );
  return await Future.value(selectValueLocal);
}

Future<dynamic> showCommonBottomSheetWithCheckBox({
  required BuildContext context,
  required String title,
  required List<BottomSheetSelectionModel> listOfItems,
  required List<BottomSheetSelectionModel>? selectValue,
  required void Function(List<BottomSheetSelectionModel> selectValue) onSubmit,
}) async {
  List<BottomSheetSelectionModel>? selectValueLocal = selectValue;
  await showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.white,
    scrollControlDisabledMaxHeightRatio: 0.8,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) => listOfItems.isEmpty
            ? Center(child: LabelStrings.noData.textWidget(fontSize: 16, color: AppColors.black))
            : Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.sizeOf(context).width,
                    padding: EdgeInsets.symmetric(vertical: 28),
                    child: title.textWidget(fontSize: 16, color: AppColors.primaryColor),
                  ),
                  Divider(color: AppColors.black.withAlpha((255 * 0.5).toInt()), thickness: 0.5, height: 1),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.symmetric(vertical: 28, horizontal: 20),
                      children: listOfItems
                          .map(
                            (item) => Column(
                              children: [
                                CheckboxListTile(
                                  value:
                                      selectValueLocal != null &&
                                      selectValueLocal!.isNotEmpty &&
                                      selectValueLocal!.any((element) => element.id == item.id),
                                  contentPadding: EdgeInsets.zero,
                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: item.name.textWidget(
                                    fontSize: 12,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  selected:
                                      selectValueLocal != null &&
                                      selectValueLocal!.isNotEmpty &&
                                      selectValueLocal!.any((element) => element.id == item.id),
                                  activeColor: AppColors.primaryColor,
                                  onChanged: (value) {
                                    if (selectValueLocal != null && selectValueLocal!.isNotEmpty) {
                                      if (selectValueLocal!.any((element) => element.id == item.id)) {
                                        selectValueLocal!.removeWhere((element) => element.id == item.id);
                                      } else {
                                        selectValueLocal!.add(item);
                                      }
                                    } else {
                                      selectValueLocal = [item];
                                    }
                                    setState(() {});
                                  },
                                ),

                                6.height,
                                // Divider(
                                //   height: 1,
                                //   thickness: 0.5,
                                //   color: AppColors.black.withAlpha(
                                //     (255 * 0.5).toInt(),
                                //   ),
                                // ),
                                // 6.height,
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  // if (selectValueLocal != null && selectValueLocal!.isNotEmpty)
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      onSubmit(selectValueLocal!);
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(15)),
                      width: MediaQuery.sizeOf(context).width,
                      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: 'Submit'.textWidget(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.white),
                    ),
                  ),
                  if (Platform.isIOS) 24.height,
                ],
              ),
      );
    },
  );
  return await Future.value(selectValueLocal);
}

Future<dynamic> showAddEditStudentBottomSheet({
  required BuildContext context,
  required String title,
  required List<Student> listOfItems,
  required Student? selectValue,
  required void Function(Student selectValue) onSubmit,
}) async {
  Student? selectValueLocal =
      listOfItems.any(
        (element) =>
            element.id == selectValue?.id && element.name.trim().toLowerCase() == selectValue?.name.trim().toLowerCase(),
      )
      ? listOfItems.firstWhere(
          (element) =>
              element.id == selectValue?.id && element.name.trim().toLowerCase() == selectValue?.name.trim().toLowerCase(),
        )
      : null;
  '${listOfItems.isNotEmpty}'.logOnString('listOfItems.isNotEmpty');
  if (selectValueLocal != null) {
    jsonEncode(selectValueLocal.toJson()).logOnString('message =>');
  }
  bool isError = false;
  TextEditingController rollNumberController = TextEditingController(
    text: "",
    // selectValueLocal?.rollNumber ??
    // (listOfItems.isNotEmpty
    //     ? getNewRollNumber(listOfItems.map((e) => num.parse(e.rollNumber)).toList()).toString()
    //     : '')
  );
  TextEditingController studentNameController = TextEditingController(text: selectValueLocal?.name);
  TextEditingController studentMobileNumberController = TextEditingController(text: selectValueLocal?.mobileNumber);
  TextEditingController studentEmailController = TextEditingController(text: selectValueLocal?.email);
  TextEditingController studentPasswordController = TextEditingController(text: selectValueLocal?.password);

  String? selectedGender =
      selectValueLocal != null &&
          selectValueLocal.gender.isNotEmpty &&
          (selectValueLocal.gender.toLowerCase().trim() == 'male' ||
              selectValueLocal.gender.toLowerCase().trim() == 'female')
      ? selectValueLocal.gender.toLowerCase().trim() == 'male'
            ? 'Male'
            : selectValueLocal.gender.toLowerCase().trim() == 'female'
            ? 'Female'
            : ''
      : '';

  bool validateFields() =>
      studentNameController.text.isNotEmpty &&
      studentMobileNumberController.text.isNotEmpty &&
      studentMobileNumberController.text.length == 10 &&
      studentEmailController.text.isNotEmpty &&
      EmailValidator.validate(studentEmailController.text) &&
      passwordRegex.hasMatch(studentPasswordController.text);

  await showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.white,
    scrollControlDisabledMaxHeightRatio: MediaQuery.sizeOf(context).height * 0.85,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) => Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 12,
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsets.symmetric(vertical: 28),
              child: title.textWidget(fontSize: 16, color: AppColors.primaryColor),
            ),
            Divider(color: AppColors.black.withAlpha((255 * 0.5).toInt()), thickness: 0.5, height: 1),
            SizedBox(height: 24),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 50),
                children: [
                  LabeledTextFormField(
                    controller: rollNumberController,
                    hintText: 'Student Roll No.',
                    isError: isError && rollNumberController.text.isEmpty,
                    textInputType: TextInputType.number,
                  ),
                  18.height,
                  LabeledTextFormField(
                    controller: studentNameController,
                    hintText: 'Student Name',
                    isError: isError && studentNameController.text.isEmpty,
                  ),
                  18.height,
                  LabeledTextFormField(
                    controller: studentMobileNumberController,
                    hintText: 'Student Mobile Number',
                    textInputType: TextInputType.phone,
                    isError:
                        isError &&
                        (studentMobileNumberController.text.isEmpty || studentMobileNumberController.text.length < 10),
                    errorMessage: studentMobileNumberController.text.length < 10 ? 'Enter Proper Mobile Number' : null,
                  ),
                  18.height,
                  LabeledTextFormField(
                    controller: studentEmailController,
                    hintText: 'Student Email',
                    textInputType: TextInputType.emailAddress,
                    isError:
                        isError &&
                        (studentEmailController.text.isEmpty ||
                            (studentEmailController.text.isNotEmpty &&
                                !EmailValidator.validate(studentEmailController.text))),
                    errorMessage:
                        (studentEmailController.text.isNotEmpty && !EmailValidator.validate(studentEmailController.text))
                        ? LabelStrings.emailIncorrect
                        : '${LabelStrings.email} ${LabelStrings.require}',
                  ),
                  18.height,
                  LabeledTextFormField(
                    controller: studentPasswordController,
                    hintText: 'Password',
                    isPasswordField: true,
                    isError:
                        isError &&
                        (studentPasswordController.text.isEmpty ||
                            studentPasswordController.text.length < 6 ||
                            !passwordRegex.hasMatch(studentPasswordController.text)),
                    errorMessage: !passwordRegex.hasMatch(studentPasswordController.text)
                        ? 'Password must contain at least:- 1 uppercase letter,\n1 lowercase letter, 1 number, 1 special character'
                        : studentPasswordController.text.length < 6
                        ? 'Password length must at least 6'
                        : '${LabelStrings.password} ${LabelStrings.require}',
                    textInputType: TextInputType.text,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio<String>(
                        value: "Male",
                        groupValue: selectedGender,
                        activeColor: AppColors.primaryColor,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                      ),
                      "Male".textWidget(fontSize: 14),
                      Radio<String>(
                        value: "Female",
                        groupValue: selectedGender,
                        activeColor: AppColors.primaryColor,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                      ),
                      "Female".textWidget(fontSize: 14),
                    ],
                  ),
                  36.height,
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      setState(() {
                        isError = !validateFields();
                      });
                      if (!isError) {
                        Student student = Student(
                          id: listOfItems.isNotEmpty ? listOfItems.length + 1 : 1,
                          rollNumber: rollNumberController.text,
                          name: studentNameController.text,
                          mobileNumber: studentMobileNumberController.text,
                          email: studentEmailController.text,
                          password: studentPasswordController.text,
                          course: selectValueLocal != null && selectValueLocal.course != null
                              ? selectValueLocal.course
                              : listOfItems.isNotEmpty
                              ? listOfItems.first.course
                              : Course.empty(),
                          gender: selectedGender != null && selectedGender!.isNotEmpty ? selectedGender! : '',
                          admin: selectValueLocal != null && selectValueLocal.admin != null
                              ? selectValueLocal.admin
                              : listOfItems.isNotEmpty
                              ? listOfItems.first.admin
                              : Admin.empty(),
                          college: selectValueLocal != null && selectValueLocal.college != null
                              ? selectValueLocal.college
                              : listOfItems.isNotEmpty
                              ? listOfItems.first.college
                              : College.empty(),
                        );
                        onSubmit(student);
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(15)),
                      width: MediaQuery.sizeOf(context).width,
                      margin: EdgeInsets.symmetric(
                        // horizontal: 50,
                        vertical: 16,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: 'Submit'.textWidget(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.white),
                    ),
                  ),
                ],
              ),
            ),
            if (Platform.isIOS) 24.height,
          ],
        ),
      );
    },
  );
  return await Future.value(selectValueLocal);
}
