import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/components/form_error.dart';
import 'package:ecommerce/constants/size_config.dart';
import 'package:flutter/material.dart';

import '../../../constants/validation_contants.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email = '';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue!,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(appEmailNullError)) {
                setState(() {
                  errors.remove(appEmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(appInvalidEmailError)) {
                setState(() {
                  errors.remove(appInvalidEmailError);
                });
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty && !errors.contains(appEmailNullError)) {
                setState(() {
                  errors.add(appEmailNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(appInvalidEmailError)) {
                errors.add(appInvalidEmailError);
              }
              return;
            },
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter email to reset password ",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              prefixIcon: Icon(
                Icons.email,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(30)),
          // SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                //Do what you want.
              }
            },
          ),
        ],
      ),
    );
  }
}
