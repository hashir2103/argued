import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/frontend/widgets/AppUserProfileCircle.dart';
import 'package:flutter/material.dart';

class GroupDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Freespeech',
                  style: listTileTitleText,
                )
              ],
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Members:',
                      style: listTileTitleText.copyWith(fontSize: 14)),
                  TextSpan(
                      text: '4',
                      style: listTileTitleText.copyWith(
                          fontSize: 14, color: Colors.red)),
                ])),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Since:',
                      style: listTileTitleText.copyWith(fontSize: 14)),
                  TextSpan(
                      text: 'Apr 29 2020',
                      style: listTileTitleText.copyWith(
                          fontSize: 14, color: Colors.red)),
                ])),
              ],
            ),
            Divider(
              color: primaryTextColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Creator:',
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
                      text: 'Group visibility:',
                      style: listTileTitleText.copyWith(
                          fontSize: 14, color: primaryColor)),
                  TextSpan(
                      text: 'Private',
                      style: listTileTitleText.copyWith(
                          fontSize: 14, color: primaryColor)),
                ])),
              ],
            ),
            Divider(
              color: primaryTextColor,
            ),
            heading('Geographic Relevance :'),
            data('Country', 'Global'),
            data('State', '----'),
            data('City', '----'),
            heading('Topic Relevance :'),
            data('Country', 'Global'),
            data('State', '----'),
            data('City', '----'),
          ],
        ),
      ),
    );
  }

  heading(String text) {
    return Row(
      children: [
        Text(
          text,
          style: listTileTitleText.copyWith(fontSize: 22),
        ),
      ],
    );
  }

  data(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,style: listTileSubTitleText.copyWith(fontWeight: FontWeight.bold),),
        Text(value,style: listTileSubTitleText,),
      ],
    );
  }
}
