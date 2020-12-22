import 'package:argued/frontend/widgets/AppDropDown.dart';
import 'package:argued/frontend/widgets/AppPhoneNumberField.dart';
import 'package:flutter/material.dart';
import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/controller/AuthBloc.dart';
import 'package:argued/frontend/widgets/AppIcon.dart';
import 'package:argued/frontend/widgets/AppTextField.dart';
import 'package:argued/frontend/widgets/PopUpMessage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var authBloc = Provider.of<AuthBloc>(context);
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kbaseHorizontalPadding),
            child: ListView(
              children: [
                AppIcon(),
                Padding(
                  padding: const EdgeInsets.only(bottom: kbaseVerticalPadding),
                  child: Text("Edit Profile", style: bigHeadingText()),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                  child: AppDropDown().myDropDown(),
                ),
                firstlastName(authBloc),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                  child: AppTextField(
                    label: 'Username',
                    hintText: 'username',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                  child: AppTextField(
                    label: 'Date of Birth',
                    hintText: '03-15-1990',
                    icon: Icons.arrow_drop_down,
                    size: 30,
                    enable: false,
                    onTap: () {
                      print('hello');
                    },
                  ),
                ),
                AppPhoneNumberField(),
                Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                    child: StreamBuilder<String>(
                        stream: authBloc.password,
                        builder: (context, snapshot) {
                          return StreamBuilder<bool>(
                              initialData: true,
                              stream: authBloc.hideText,
                              builder: (context, snapshot) {
                                return AppTextField(
                                    onTap: () {
                                      authBloc.changeHideText(!snapshot.data);
                                    },
                                    obsecureText:
                                        snapshot.data == false ? false : true,
                                    onChanged: authBloc.changePassword,
                                    hintText: '**********',
                                    label: 'Password',
                                    icon: FontAwesomeIcons.eye);
                              });
                        })),
                Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                    child: StreamBuilder<String>(
                        stream: authBloc.confirmPassword,
                        builder: (context, snapshot) {
                          return StreamBuilder<bool>(
                              initialData: true,
                              stream: authBloc.hideText,
                              builder: (context, snapshot) {
                                return AppTextField(
                                    onTap: () {
                                      authBloc.changeHideText(!snapshot.data);
                                    },
                                    obsecureText:
                                        snapshot.data == false ? false : true,
                                    onChanged: authBloc.changeConfirmPassword,
                                    hintText: '**********',
                                    label: 'Confirm Password',
                                    icon: FontAwesomeIcons.eye);
                              });
                        })),
                SizedBox(
                  height: 18,
                ),
                
                // alreadyHaveAcc(),
              ],
            ),
          ),
          PopUpMessage().loginAndSignUpMsg(authBloc)
        ],
      ),
    ));
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
