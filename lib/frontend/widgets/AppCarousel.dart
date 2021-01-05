import 'package:argued/ArguedConfigs/sizeConfig.dart';
import 'package:argued/controller/DashboadBloc.dart';
import 'package:argued/frontend/widgets/AppCard.dart';
import 'package:argued/model/opnionModel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dashboardBloc = Provider.of<DashboardBloc>(context);
    return StreamBuilder<OpinionModel>(
        stream: dashboardBloc.mostWatched,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              height: SizeConfig.screenHeight * 0.3,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          var s = snapshot.data.data;
          return CarouselSlider(
            options: CarouselOptions(
              height: 430,
              aspectRatio: 16 / 9,
              viewportFraction: 0.9,
              initialPage: 0,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              // onPageChanged: callbackFunction,
              scrollDirection: Axis.horizontal,
            ),
            items: s.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: AppCard2(
                        rating: i.rating.toString(),
                        videoURL: i.video.file,
                        thumbnail: i.video.thumbnail,
                          stand: i.stand.toString().split(".")[1]??"",
                          userName: i.details.userName.toString().split(".")[1]??"",
                          topicName: i.details.topicName??"",
                          categoryName: i.details.categoryName??'',
                          subCategoryName: i.details.subCategoryName??'',
                          language: i.language.toString().split(".")[1]??'',
                          createdAt: i.createdAt,
                          opinionID: i.id??'',
                          userPostCover: i.createdBy.profilePic));
                },
              );
            }).toList(),
          );
        });
  }
}
