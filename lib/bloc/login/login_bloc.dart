import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:present_unit_flutter/models/validation_model/field_validation.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
    : super(
        LoginState(
          fields: LoginStateFields(emailController: TextEditingController(), passwordController: TextEditingController()),
        ),
      );

  void checkValidation() {
    FieldValidation? emailValidation;
    FieldValidation? passwordValidation;
    LoginStateFieldsValidation validation;

    if (state.fields.emailController.text.isEmpty) {
      emailValidation = FieldValidation(message: "Email cannot be empty", isError: true);
    } else if (state.fields.emailController.text.isNotEmpty && !EmailValidator.validate(state.fields.emailController.text)) {
      emailValidation = FieldValidation(message: "Please enter a valid email", isError: true);
    } else {
      emailValidation = FieldValidation(isError: false);
    }

    if (state.fields.passwordController.text.isEmpty) {
      passwordValidation = FieldValidation(isError: true, message: "Password cannot be empty");
    } else {
      passwordValidation = FieldValidation(isError: false);
    }

    validation = (state.validation ?? LoginStateFieldsValidation()).copyWith(
      emailValidation: emailValidation,
      passwordValidation: passwordValidation,
    );

    emit(state.copyWith(validation: validation));
  }
}
