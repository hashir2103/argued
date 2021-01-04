import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/sizeConfig.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/controller/DashboadBloc.dart';
import 'package:flutter/material.dart';

class MyAppDailog {
  loginDailog(msg, context) {
    var dailog = Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
          width: SizeConfig.screenWidth,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Argued.com",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                msg,
                style: normalText(),
              ),
            ],
          )),
    );
    return dailog;
  }
  responseDailog(msg, context) {
    var dailog = Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
          width: SizeConfig.screenWidth,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Argued.com",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                msg,
                style: normalText(),
              ),
            ],
          )),
    );
    showDialog(context: context, builder: (context) => dailog);
  }

  ratingDailog(rating,DashboardBloc dashboardBloc, topicName, userName, context,onTap,) {
    var dailog = Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
          width: SizeConfig.screenWidth,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () => Navigator.pop(context)),
                ],
              ),
              Text(
                topicName ?? '',
                style: listTileTitleText2,
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  emojiContainer('sad'),
                  SizedBox(
                    width: 8,
                  ),
                  emojiContainer('ok'),
                  SizedBox(
                    width: 8,
                  ),
                  emojiContainer('happy'),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    children: [
                      SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.grade,
                        color: Colors.red.shade800,
                        size: 16,
                      ),
                      Text(
                        '$rating% avg',
                        style: listTileTrailingText.copyWith(fontSize: 16),
                      )
                    ],
                  ),
                  Wrap(
                    children: [
                      Text(
                        'Add host to Watchlist +',
                        style: listTileTrailingText,
                      ),
                      SizedBox(
                        width: 4,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                indent: 16,
                endIndent: 16,
                height: 4,
                thickness: 1,
              ),
              SizedBox(
                height: 12,
              ),
              Row(children: [
                Container(
                  width: SizeConfig.screenWidth * 0.1,
                  child: Icon(
                    Icons.grade,
                    color: Colors.red.shade800,
                  ),
                ),
                Container(
                  width: SizeConfig.screenWidth * 0.1,
                  child: Text(
                    'Rate :',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // fontSize: 14,
                        color: Colors.black),
                  ),
                ),
                Container(
                  width: SizeConfig.screenWidth * 0.4,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.red[700],
                      inactiveTrackColor: Colors.red[100],
                      trackShape: RectangularSliderTrackShape(),
                      trackHeight: 4.0,
                      thumbColor: Colors.redAccent,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 6.0),
                      overlayColor: Colors.red.withAlpha(32),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 28.0),
                    ),
                    child: StreamBuilder<double>(
                        stream: dashboardBloc.rating,
                        builder: (context, snapshot) {
                          return Slider(
                            label: '${snapshot.data}%',
                            value: snapshot.data,
                            onChanged: (newRating) {
                              dashboardBloc.changeRating(newRating);
                            },
                            min: 0,
                            max: 100,
                          );
                        }),
                  ),
                ),
                StreamBuilder<double>(
                    stream: dashboardBloc.rating,
                    builder: (context, snapshot) {
                      String val = snapshot.data.toString().split('.')[0] + '%';
                      return Container(
                        width: SizeConfig.screenWidth * 0.1,
                        child: Text(
                          val,
                          style: listTileTrailingText.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      );
                    })
              ]),
              Divider(
                indent: 16,
                endIndent: 16,
                height: 4,
                thickness: 1,
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  margin: EdgeInsets.only(top: 8),
                  padding: EdgeInsets.all(8),
                  width: SizeConfig.screenWidth * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: primaryColor),
                  child: Center(
                    child: Text('save',
                        style: listTileTrailingText.copyWith(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              )
            ],
          )),
    );
    showDialog(context: context, builder: (context) => dailog);
  }
}

emojiContainer(String name) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    height: 40,
    width: 40,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: AssetImage('assets/$name.png'), fit: BoxFit.contain)),
  );
}
