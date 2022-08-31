import 'package:ecommerce/screens/complete_profile/complete_profile_screen.dart';
import 'package:flutter/material.dart';

import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../constants/size_config.dart';
import '../../../constants/validation_contants.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? email;
  String? password;
  String? conformPassword;
  bool hidePassword = true;

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          emailTextFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          passwordFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          confirmPasswordFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
              text: "Continue",
              press: () {
                print(_formKey.currentState!.validate());
                if (_formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, CompleteProfileScreen.routeName);
                }
              })
        ],
      ),
    );
  }

  TextFormField confirmPasswordFormField() {
    return TextFormField(
      obscureText: hidePassword,
      onSaved: (newValue) => conformPassword = newValue,
      onChanged: (value) {
        if (password == conformPassword) {
          removeError(error: appMatchPassError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "";
        } else if (password != value) {
          addError(error: appMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(
          Icons.lock,
          color: Theme.of(context).colorScheme.secondary,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              hidePassword = !hidePassword;
            });
          },
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
          icon: Icon(hidePassword ? Icons.visibility_off : Icons.visibility),
        ),
      ),
    );
  }

  TextFormField passwordFormField() {
    return TextFormField(
      obscureText: hidePassword,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: appPassNullError);
        } else if (value.length >= 8) {
          removeError(error: appShortPassError);
        }
        password = value;
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: appPassNullError);
        } else if (value.length < 8) {
          addError(error: appShortPassError);
        }
        return;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(
          Icons.lock,
          color: Theme.of(context).colorScheme.secondary,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              hidePassword = !hidePassword;
            });
          },
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
          icon: Icon(hidePassword ? Icons.visibility_off : Icons.visibility),
        ),
      ),
    );
  }

  TextFormField emailTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: appEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: appInvalidEmailError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: appEmailNullError);
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: appInvalidEmailError);
        }
        return;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(
          Icons.email,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
