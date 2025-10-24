part of 'login_bloc.dart';

final class LoginState extends Equatable {
  final bool buttonLoader;
  final LoginStateFields fields;
  final LoginStateFieldsValidation? validation;

  const LoginState({this.buttonLoader = false, required this.fields, this.validation});

  LoginState copyWith({bool? buttonLoader, LoginStateFields? fields, LoginStateFieldsValidation? validation}) {
    return LoginState(
      buttonLoader: buttonLoader ?? this.buttonLoader,
      fields: fields ?? this.fields,
      validation: validation ?? this.validation,
    );
  }

  Map<String, dynamic> toJson() => {
    'buttonLoader': buttonLoader,
    'fields': fields.toJson(),
    'validation': validation?.toJson(),
  };

  @override
  List<Object?> get props => [buttonLoader, fields, validation];
}

final class LoginStateFields extends Equatable {
  const LoginStateFields({required this.emailController, required this.passwordController});

  final TextEditingController emailController;
  final TextEditingController passwordController;

  LoginStateFields copyWith({TextEditingController? emailController, TextEditingController? passwordController}) {
    return LoginStateFields(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
    );
  }

  Map<String, dynamic> toJson() => {'email': emailController.text, 'password': passwordController.text};

  @override
  List<Object?> get props => [emailController, passwordController];
}

final class LoginStateFieldsValidation extends Equatable {
  const LoginStateFieldsValidation({this.emailValidation, this.passwordValidation});

  final FieldValidation? emailValidation;
  final FieldValidation? passwordValidation;

  LoginStateFieldsValidation copyWith({FieldValidation? emailValidation, FieldValidation? passwordValidation}) {
    return LoginStateFieldsValidation(
      emailValidation: emailValidation ?? this.emailValidation,
      passwordValidation: passwordValidation ?? this.passwordValidation,
    );
  }

  Map<String, dynamic> toJson() => {
    'emailValidation': emailValidation?.toJson(),
    'passwordValidation': passwordValidation?.toJson(),
  };

  @override
  List<Object?> get props => [emailValidation, passwordValidation];
}
