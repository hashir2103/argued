import 'dart:ui';

import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/sizeConfig.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/controller/AuthBloc.dart';
import 'package:argued/frontend/widgets/AppBottomSheet.dart';
import 'package:argued/frontend/widgets/AppButton.dart';
import 'package:argued/frontend/widgets/AppDialogs.dart';
import 'package:argued/frontend/widgets/AppIcon.dart';
import 'package:argued/frontend/widgets/AppTextField.dart';
import 'package:argued/frontend/widgets/PopUpMessage.dart';
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
  FocusNode node;
  TextEditingController c = TextEditingController();
  TextEditingController c1 = TextEditingController();

  @override
  void initState() {
    node = FocusNode();
    onTap = TapGestureRecognizer()..onTap = _handleOnTap;
    super.initState();
  }

  @override
  void dispose() {
    c.dispose();
    c1.dispose();
    node.dispose();
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
      body: Stack(
        children: [
          ListView(
            children: [
              AppIcon(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kbaseHorizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: kbaseVerticalPadding),
                      child: Text("Welcome back", style: bigHeadingText()),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: kbaseVerticalPadding),
                        child: StreamBuilder<String>(
                            stream: authBloc.username,
                            builder: (context, snapshot) {
                              return Focus(
                                onFocusChange: (focus) {
                                  if (!focus) {
                                    authBloc.checkUserName();
                                  }
                                },
                                child: AppTextField(
                                  controller: c1
                                    ..text =
                                        snapshot.hasData ? snapshot.data : ''
                                    ..selection = TextSelection.collapsed(
                                        offset: snapshot.hasData
                                            ? snapshot.data.length
                                            : 0),
                                  iconColor: snapshot.hasError
                                      ? Colors.red
                                      : primaryColor,
                                  icon: snapshot.hasError
                                      ? Icons.clear
                                      : Icons.check,
                                  onChanged: authBloc.changeusername,
                                  hintText: 'johndoe',
                                  label: 'Username',
                                ),
                              );
                            })),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: kbaseVerticalPadding),
                        child: StreamBuilder<bool>(
                            stream: authBloc.hideText,
                            builder: (context, snapshot) {
                              return AppTextField(
                                  controller: c
                                    ..text = authBloc.pass != null
                                        ? authBloc.pass
                                        : ''
                                    ..selection = TextSelection.collapsed(
                                        offset: authBloc.pass != null
                                            ? authBloc.pass.length
                                            : 0),
                                  onTap: () {
                                    authBloc.changeHideText(!snapshot.data);
                                  },
                                  obsecureText:
                                      snapshot.data == false ? false : true,
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
                        stream: authBloc.isValidLogin,
                        builder: (context, snapshot) {
                          return StreamBuilder<bool>(
                              stream: authBloc.button,
                              builder: (context, loginpress) {
                                return AppButton(
                                  text: 'Login',
                                  onTap: snapshot.data == true
                                      ? () async {
                                          authBloc.changeButton(true);
                                          MyAppDailog().loading(context);
                                          await authBloc.login();
                                          Navigator.pop(context);
                                          authBloc.changeLoginPress(true);
                                          authBloc.changeButton(false);
                                          var response = authBloc.responseValue;

                                          if (response['key'] ==
                                              "user.account_inactive") {
                                            AppBottomSheet().verifyCode(context,
                                                () async {
                                              await authBloc.verifyCode();
                                              Navigator.pop(context);
                                              authBloc.changeLoginPress(true);
                                            });
                                          }
                                        }
                                      : () {},
                                );
                              });
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
          ),
          PopUpMessage().loginAndSignUpMsg(authBloc)
        ],
      ),
    ));
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            StreamBuilder<bool>(
                stream: authBloc.rememberMe,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  }
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
        ),
        GestureDetector(
          onTap: () {
            AppBottomSheet().resetUserNamePassword(context, () {});
          },
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: "Forgot Credential",
              style: TextStyle(
                  decoration: TextDecoration.underline, color: primaryColor),
            ),
            TextSpan(text: '?  ', style: TextStyle(color: Colors.black))
          ])),
        )
      ],
    );
  }
}
