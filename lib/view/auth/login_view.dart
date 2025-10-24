import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:present_unit_flutter/bloc/login/login_bloc.dart';
import 'package:present_unit_flutter/bloc/theme_mode/theme_mode_bloc.dart';
import 'package:present_unit_flutter/helper-widgets/buttons/common_button.dart';
import 'package:present_unit_flutter/helper-widgets/text-field/labeled_app_text_field.dart';
import 'package:present_unit_flutter/helpers/extension/string_widget.dart';
import 'package:present_unit_flutter/main.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getColorScheme(context).surfaceDim,
      body: BlocBuilder<LoginCubit, LoginState>(
        bloc: LoginCubit(),
        builder: (context, state) {
          return Center(
            child: SingleChildScrollView(
              hitTestBehavior: HitTestBehavior.translucent,
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                spacing: 24,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 12),
                    alignment: AlignmentGeometry.centerLeft,
                    child: "Login".textWidget(
                      fontSize: 35,
                      color: getColorScheme(context).primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  LabeledAppTextField(
                    label: "Email",
                    controller: state.fields.emailController,
                    textInputType: TextInputType.emailAddress,
                    isError:
                        state.validation != null &&
                        state.validation!.emailValidation != null &&
                        state.validation!.emailValidation!.isError,
                    errorText: state.validation?.emailValidation?.message,
                  ),
                  LabeledAppTextField(
                    label: "Password",
                    controller: state.fields.passwordController,
                    isPassword: true,
                    isError:
                        state.validation != null &&
                        state.validation!.emailValidation != null &&
                        state.validation!.emailValidation!.isError,
                    errorText: state.validation?.emailValidation?.message,
                  ),
                  ClickablePrimaryButton(
                    label: "Login",
                    height: 50,
                    fontColor: getColorScheme(context).surface,
                    buttonColor: getColorScheme(context).primary,
                    width: MediaQuery.sizeOf(context).width,
                    onTap: () {
                      context.read<ThemeModeBloc>().add(ToggleThemeModeEvent());
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
