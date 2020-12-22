import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/controller/AuthBloc.dart';
import 'package:argued/frontend/widgets/AppButton.dart';
import 'package:argued/frontend/widgets/AppIcon.dart';
import 'package:argued/frontend/widgets/AppTextField.dart';
import 'package:argued/frontend/widgets/PopUpMessage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
    Navigator.pushNamed(context, kLoginScreen);
  }

  @override
  Widget build(BuildContext context) {
    var authBloc = Provider.of<AuthBloc>(context);
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              AppIcon(),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: kbaseHorizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: kbaseVerticalPadding),
                      child: Text("Create Account", style: bigHeadingText()),
                    ),
                    firstlastName(authBloc),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: kbaseVerticalPadding),
                        child: StreamBuilder<String>(
                            stream: authBloc.email,
                            builder: (context, snapshot) {
                              return AppTextField(
                                onChanged: authBloc.changeEmail,
                                hintText: 'johndoe@email.com',
                                label: 'Email',
                                icon: (snapshot.error != null)
                                    ? Icons.clear
                                    : FontAwesomeIcons.check,
                              );
                            })),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: kbaseVerticalPadding),
                        child: StreamBuilder<String>(
                            stream: authBloc.password,
                            builder: (context, snapshot) {
                              return StreamBuilder<bool>(
                                  initialData: true,
                                  stream: authBloc.hideText,
                                  builder: (context, snapshot) {
                                    return AppTextField(
                                        onTap: () {
                                          authBloc
                                              .changeHideText(!snapshot.data);
                                        },
                                        obsecureText: snapshot.data == false
                                            ? false
                                            : true,
                                        onChanged: authBloc.changePassword,
                                        hintText: '**********',
                                        label: 'Password',
                                        icon: FontAwesomeIcons.eye);
                                  });
                            })),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: kbaseVerticalPadding),
                        child: StreamBuilder<String>(
                            stream: authBloc.confirmPassword,
                            builder: (context, snapshot) {
                              return StreamBuilder<bool>(
                                  initialData: true,
                                  stream: authBloc.hideText,
                                  builder: (context, snapshot) {
                                    return AppTextField(
                                        onTap: () {
                                          authBloc
                                              .changeHideText(!snapshot.data);
                                        },
                                        obsecureText: snapshot.data == false
                                            ? false
                                            : true,
                                        onChanged:
                                            authBloc.changeConfirmPassword,
                                        hintText: '**********',
                                        label: 'Confirm Password',
                                        icon: FontAwesomeIcons.eye);
                                  });
                            })),
                    SizedBox(
                      height: 18,
                    ),
                    StreamBuilder<bool>(
                        initialData: false,
                        stream: authBloc.isValidSignUp,
                        builder: (context, snapshot) {
                          return AppButton(
                            text: 'Sign Up',
                            onTap: snapshot.data == true
                                ? () {
                                    authBloc.changeLoginPress(true);
                                    authBloc.signUp();
                                  }
                                : () {
                                    print('Nothing Happens');
                                  },
                          );
                        }),
                    SizedBox(
                      height: 28,
                    ),
                    alreadyHaveAcc(),
                  ],
                ),
              )
            ],
          ),
          PopUpMessage().loginAndSignUpMsg(authBloc)
        ],
      ),
    ));
  }

  alreadyHaveAcc() {
    return Container(
      alignment: Alignment.center,
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: "Have an account? ", style: TextStyle(color: Colors.black)),
        TextSpan(text: 'Login', style: smallHeadingText(), recognizer: onTap)
      ])),
    );
  }

  firstlastName(AuthBloc authBloc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StreamBuilder<String>(
            stream: authBloc.fname,
            builder: (context, snapshot) {
              return AppSmallTextField(
                onChanged: authBloc.changefname,
                label: 'First Name',
                hintText: 'John',
              );
            }),
        StreamBuilder<String>(
            stream: authBloc.lname,
            builder: (context, snapshot) {
              return AppSmallTextField(
                onChanged: authBloc.changelname,
                label: 'Last Name',
                hintText: 'Doe',
              );
            }),
      ],
    );
  }
}
