import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/constantsList.dart';
import 'package:argued/ArguedConfigs/sizeConfig.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/frontend/widgets/AppButton.dart';
import 'package:argued/frontend/widgets/AppDropDown.dart';
import 'package:argued/frontend/widgets/AppNumberField.dart';
import 'package:argued/frontend/widgets/AppTextField.dart';
import 'package:argued/main.dart';
import 'package:flutter/material.dart';

class AppBottomSheet {
  verifyCode(context, onTap) {
    showModalBottomSheet(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(35.0)),
        ),
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (context) {
          return VerificationCode(
            onTap: onTap,
          );
        });
  }

  resetUserNamePassword(context, onTap) {
    showModalBottomSheet(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(35.0)),
        ),
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (context) {
          return ResetUNamePassword(
            onTap: onTap,
          );
        });
  }

  changeMyInterest(context) {
    showModalBottomSheet(
        elevation: 0,
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (context) {
          return ChangeMyInterest();
        });
  }

  geoInterest(context) {
    showModalBottomSheet(
        elevation: 0,
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (context) {
          return GeographicalInterest();
        });
  }
}

// ignore: must_be_immutable
class GeographicalInterest extends StatelessWidget {
  List<MultiSelectDialogItem<String>> multiItem = List();

  void populateMultiselect() {
    countryList2.forEach((c) {
      multiItem.add(MultiSelectDialogItem(c['_id'], c['name']));
    });
  }

  void _showMultiSelect(BuildContext context) async {
    multiItem = [];
    populateMultiselect();

    final selectedValues = await showDialog<Set<String>>(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectDialog(
            items: multiItem,
            initialSelectedValues: dashboardBloc.getCountriesSelected());
      },
    );
    dashboardBloc.changeCountries(selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kbaseHorizontalPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    "Geograhpical Location Of Interest",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16),
                  )),
              Container(
                  child: IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: Colors.black,
                      ),
                      onPressed: () => Navigator.pop(context))),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
              child: AppTextField(
                enable: false,
                hintText: "Select",
                label: "Select Countries",
                icon: Icons.arrow_drop_down,
                size: 30,
                iconColor: primaryColor,
                onTap: () {
                  _showMultiSelect(context);
                },
              )),
          Padding(
              padding: EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
              child: StreamBuilder<Set<String>>(
                  stream: dashboardBloc.countries,
                  builder: (context, snapshot) {
                    return AppTextField(
                      enable: false,
                      hintText: snapshot.hasData
                          ? "Select"
                          : 'Select Countries first',
                      label: "Select States",
                      icon: Icons.arrow_drop_down,
                      size: 30,
                      iconColor: primaryColor,
                      onTap: () {
                        // dashboardBloc.getStates();
                        // _showMultiSelect(context);
                      },
                    );
                  })),
          Padding(
              padding: EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
              child: StreamBuilder<Set<String>>(
                  stream: dashboardBloc.states,
                  builder: (context, snapshot) {
                    return AppTextField(
                      enable: false,
                      hintText:
                          snapshot.hasData ? "Select" : 'Select State(s) first',
                      label: "Select Cities",
                      icon: Icons.arrow_drop_down,
                      size: 30,
                      iconColor: primaryColor,
                      onTap: () {
                        // _showMultiSelect(context);
                      },
                    );
                  })),
          SizedBox(
            height: 20,
          ),
          AppButton(
            height: 50,
            text: 'Apply Filter',
            onTap: () {},
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class ChangeMyInterest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kbaseHorizontalPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    "Change my Interests",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20),
                  )),
              Container(
                  child: IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: Colors.black,
                      ),
                      onPressed: () => Navigator.pop(context))),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          AppButton(
            height: 50,
            text: 'Topic Of Interest',
            onTap: () {},
          ),
          SizedBox(
            height: 20,
          ),
          AppButton(
            height: 50,
            text: 'Geographical Locations Of Interest',
            onTap: () {
              AppBottomSheet().geoInterest(context);
            },
          ),
          SizedBox(
            height: 20,
          ),
          AppButton(
            height: 50,
            text: 'Set Default Location For New Video',
            onTap: () {},
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class VerificationCode extends StatelessWidget {
  Function onTap;
  VerificationCode({this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kbaseHorizontalPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 4,
          ),
          Center(
            child: Container(
              height: 7,
              width: SizeConfig.screenWidth * 0.2,
              decoration: BoxDecoration(
                  color: primaryTextColor,
                  borderRadius: BorderRadius.circular(35)),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
            child: Text(
              'Enter 4 Digit Code',
              style: bigHeadingText(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
            child: Text(
              "Enter the 4 digit code recieved on your email",
              style: normalText(),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
            child: AppNumberField(),
          ),
          SizedBox(
            height: 25,
          ),
          AppButton(text: 'Continue', onTap: onTap),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ResetUNamePassword extends StatelessWidget {
  Function onTap;
  ResetUNamePassword({this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kbaseHorizontalPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 4,
          ),
          Center(
            child: Container(
              height: 7,
              width: SizeConfig.screenWidth * 0.2,
              decoration: BoxDecoration(
                  color: primaryTextColor,
                  borderRadius: BorderRadius.circular(35)),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
            child: Text(
              'Reset username or password',
              style: bigHeadingText(),
            ),
          ),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
              child: userNameOrPass()),
          resetUserNamePassword(),
        ],
      ),
    );
  }

  resetUserNamePassword() {
    return StreamBuilder<bool>(
        stream: authBloc.resetCredential,
        builder: (context, snapshot) {
          return Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Text(
                snapshot.data == true
                    ? 'We just need your register Email to send you your Username reset instructions'
                    : 'We just need your register Email to send you your Password reset instructions',
                style: listTileSubTitleText,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8,
              ),
              AppTextField(
                hintText: 'johndoe@email.com',
                label: 'Email',
                onChanged: authBloc.changeEmail,
              ),
              SizedBox(
                height: 16,
              ),
              AppButton(
                text: 'Reset',
                onTap: snapshot.data == true
                    ? () async {
                        await authBloc.resetUserCredential(false);
                        Navigator.pop(context);
                        authBloc.changeLoginPress(true);
                      }
                    : () async {
                        await authBloc.resetUserCredential(true);
                        Navigator.pop(context);
                        authBloc.changeLoginPress(true);
                      },
              ),
              SizedBox(
                height: 12,
              )
            ],
          );
        });
  }

  userNameOrPass() {
    return StreamBuilder<bool>(
        stream: authBloc.resetCredential,
        builder: (context, snapshot) {
          return Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: primaryColor, width: 1)),
                      child: GestureDetector(
                        onTap: () {
                          authBloc.changeResetCredential(true);
                        },
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: (snapshot.data == true)
                                ? Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: primaryColor),
                                  )
                                : Container(),
                          ),
                        ),
                      )),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      'Forgot Username',
                      style: normalText(),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: primaryColor, width: 1)),
                      child: GestureDetector(
                        onTap: () {
                          authBloc.changeResetCredential(false);
                        },
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: (snapshot.data == false)
                                ? Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: primaryColor),
                                  )
                                : Container(),
                          ),
                        ),
                      )),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      'Forgot Password',
                      style: normalText(),
                    ),
                  )
                ],
              ),
            ],
          );
        });
  }
}
