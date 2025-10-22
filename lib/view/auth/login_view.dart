import 'package:flutter/material.dart';
import 'package:present_unit_flutter/helper-widgets/text-field/form_fields_with_label.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceDim,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AppTextFormFieldsWithLabel(textEditingController: textEditingController, hintText: hintText, isError: isError, onChanged: onChanged, onFieldSubmitted: onFieldSubmitted)
          ],
        ),
      ),
    );
  }
}
