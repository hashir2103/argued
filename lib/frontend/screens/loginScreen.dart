import 'dart:ui';

import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/sizeConfig.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/controller/AuthBloc.dart';
import 'package:argued/frontend/widgets/AppButton.dart';
import 'package:argued/frontend/widgets/AppIcon.dart';
import 'package:argued/frontend/widgets/AppTextField.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TapGestureRecognizer onTap;
  @override
  void initState() {
    onTap = TapGestureRecognizer()..onTap = _handleOnTap;
    super.initState();
  }

  @override
  void dispose() {
    onTap.dispose();
    super.dispose();
  }

  void _handleOnTap() {
    Navigator.pushNamed(context, kSignUpScreen);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    var authBloc = Provider.of<AuthBloc>(context);
    return SafeArea(
        child: Scaffold(
            body: ListView(
      children: [
        AppIcon(),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: kbaseHorizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                child: Text("Welcome back", style: bigHeadingText()),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                  child: StreamBuilder<String>(
                      stream: authBloc.email,
                      builder: (context, snapshot) {
                        return AppTextField(
                          onChanged: authBloc.changeEmail,
                          hintText: 'johndoe@email.com',
                          label: 'Email',
                          icon: (snapshot.error != null)
                              ? FontAwesomeIcons.cut
                              : FontAwesomeIcons.check,
                        );
                      })),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                  child: StreamBuilder<String>(
                      stream: authBloc.password,
                      builder: (context, snapshot) {
                        return AppTextField(
                            onChanged: authBloc.changePassword,
                            hintText: '**********',
                            label: 'Password',
                            icon: FontAwesomeIcons.eye);
                      })),
              rememberMe(authBloc),
              SizedBox(
                height: 10,
              ),
              StreamBuilder<bool>(
                  initialData: false,
                  stream: authBloc.isValidSignUp,
                  builder: (context, snapshot) {
                    return AppButton(
                      text: 'Login',
                      onTap: snapshot.data ? authBloc.login() : () {},
                    );
                  }),
              SizedBox(
                height: 35,
              ),
              dontHaveAcc(),
              SizedBox(
                height: 45,
              ),
              Center(
                child: termsAndCondition(),
              )
            ],
          ),
        ),
      ],
    )));
  }

  termsAndCondition() {
    return Column(
      children: [
        Text('You are completely safe.',
            style: TextStyle(color: primaryTextColor)),
        SizedBox(
          height: 8,
        ),
        Text('Read our Terms & Conditions.',
            style: TextStyle(color: primaryTextColor)),
      ],
    );
  }

  dontHaveAcc() {
    return Container(
      alignment: Alignment.center,
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: "Don't have an account? ",
            style: TextStyle(color: Colors.black)),
        TextSpan(text: 'Signup', style: smallHeadingText(), recognizer: onTap)
      ])),
    );
  }

  rememberMe(AuthBloc authBloc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        StreamBuilder<bool>(
            stream: authBloc.rememberMe,
            builder: (context, snapshot) {
              return Checkbox(
                activeColor: primaryColor,
                value: snapshot.data,
                onChanged: (value) {
                  authBloc.changeRememberMe(value);
                });
            }),
        Text(
          'Remember me',
          style: TextStyle(color: primaryTextColor),
        ),
      ],
    );
  }
}
