import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/frontend/widgets/AppButton.dart';
import 'package:argued/frontend/widgets/AppTextField.dart';
import 'package:argued/frontend/widgets/AppUserProfileCircle.dart';
import 'package:flutter/material.dart';

class GroupDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UserCirle(
                    profilePic: kTempImage,
                    height: 100,
                    width: 100,
                  )
                ],
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Freespeech',
                    style: listTileTitleText,
                  )
                ],
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'peoples right to free speech',
                    style: listTileSubTitleText,
                  )
                ],
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Members : ',
                        style: listTileTitleText.copyWith(fontSize: 14)),
                    TextSpan(
                        text: '4',
                        style: listTileTitleText.copyWith(
                            fontSize: 14, color: Colors.red)),
                  ])),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Since : ',
                        style: listTileTitleText.copyWith(fontSize: 14)),
                    TextSpan(
                        text: 'Apr 29 2020',
                        style: listTileTitleText.copyWith(
                            fontSize: 14, color: Colors.red)),
                  ])),
                ],
              ),
              SizedBox(
                height: 2,
              ),
              Divider(
                color: primaryTextColor,
              ),
              SizedBox(
                height: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Creator : ',
                        style: listTileTitleText.copyWith(
                            fontSize: 14, color: primaryColor)),
                    TextSpan(
                        text: 'Speaker',
                        style: listTileTitleText.copyWith(
                            fontSize: 14, color: primaryColor)),
                  ])),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Group visibility : ',
                        style: listTileTitleText.copyWith(
                            fontSize: 14, color: primaryColor)),
                    TextSpan(
                        text: 'Private',
                        style: listTileTitleText.copyWith(
                            fontSize: 14, color: primaryColor)),
                  ])),
                ],
              ),
              SizedBox(
                height: 2,
              ),
              Divider(
                color: primaryTextColor,
              ),
              SizedBox(
                height: 2,
              ),
              heading('Geographic Relevance :'),
              data('Country', 'Albania'),
              data('State', '----'),
              data('City', '----'),
              heading('Topic Relevance :'),
              data('Country', 'Albania'),
              data('State', '----'),
              data('City', '----'),
              heading('Nominations:'),
              data('Nomination', 'No'),
              heading('Group Join Requests:'),
              data('Requests', 'No'),
              SizedBox(
                height: 2,
              ),
              Divider(
                color: primaryTextColor,
              ),
              SizedBox(
                height: 4,
              ),
              Stack(
                children: [
                  AppTextField(
                    radius: 24,
                    label: 'Invite Others',
                    hintText: 'Enter Username',
                  ),
                  Positioned(
                    bottom: 2,
                    right: 1.2,
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: primaryColor,
                      child: Icon(Icons.add,color: Colors.white),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              AppButton(
                text: 'Save',
                onTap: () {},
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
          Positioned(
              right: -4,
              top: -4,
              child: IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Colors.black,
                    size: 25,
                  ),
                  onPressed: () => Navigator.pop(context)))
        ],
      ),
    );
  }

  heading(String text) {
    return Container(
      margin: EdgeInsets.only(top: 6),
      child: Row(
        children: [
          Text(
            text,
            style: listTileTitleText.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }

  data(String label, String value) {
    return Container(
      margin: EdgeInsets.only(top: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: listTileSubTitleText.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: listTileSubTitleText,
          ),
        ],
      ),
    );
  }
}
