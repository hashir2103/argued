import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/sizeConfig.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/controller/AuthBloc.dart';
import 'package:argued/controller/DashboadBloc.dart';
import 'package:argued/controller/LocationBloc.dart';
import 'package:argued/frontend/widgets/AppBottomSheet.dart';
import 'package:argued/frontend/widgets/AppCard.dart';
import 'package:argued/frontend/widgets/AppCarousel.dart';
import 'package:argued/model/HotTopicModel.dart';
import 'package:argued/model/opnionModel.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ViewerDashBoardScreen extends StatefulWidget {
  @override
  _ViewerDashBoardScreenState createState() => _ViewerDashBoardScreenState();
}

class _ViewerDashBoardScreenState extends State<ViewerDashBoardScreen> {
  ScrollController scrollController = ScrollController();
  int pageNo = 1;
  @override
  void initState() {
    var dashboardBloc = Provider.of<DashboardBloc>(context, listen: false);
    dashboardBloc.getHotTopicOfHour();
    dashboardBloc.getMostWatchedTopic();
    dashboardBloc.getInterestingToYou('1');
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        dashboardBloc.getInterestingToYou((pageNo + 1).toString());
        dashboardBloc.changeIsLoading(true);
      }
      // dashboardBloc.changeIsLoading(false);
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var dashboardBloc = Provider.of<DashboardBloc>(context);
    var authBloc = Provider.of<AuthBloc>(context);
    var locationBloc = Provider.of<LocationBloc>(context);
    return Scaffold(
      appBar: appBar(authBloc, locationBloc),
      bottomNavigationBar: bottomNavBar(dashboardBloc),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: kbaseHorizontalPadding),
          child: Wrap(
            children: [
              bodyHeading(heading: "Hot Topic this hour"),
              StreamBuilder<HotTopicModel>(
                  stream: dashboardBloc.hotTopicOfHour,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Container(
                        width: SizeConfig.screenWidth,
                        height: SizeConfig.screenHeight * 0.3,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    var s = snapshot.data;

                    return AppCard(
                      rating: s.rating.toString(),
                      videoURL: s.video.file,
                      thumbnail: s.video.thumbnail,
                      userPostCover: s.createdBy.profilePic,
                      stand: s.stand,
                      userName: s.details.userName,
                      topicName: s.details.topicName,
                      categoryName: s.details.categoryName,
                      subCategoryName: s.details.subCategoryName,
                      language: s.language,
                      createdAt: s.createdAt,
                      opinionID: s.video.id,
                    );
                  }),
              bodyHeading(heading: "Most watched in your selected topics"),
              AppCarousel(),
              bodyHeading(heading: "Interesting to you"),
              VerticalList(),
              StreamBuilder<bool>(
                  stream: dashboardBloc.isLoading,
                  builder: (context, snapshot) {
                    if (snapshot.hasData & snapshot.data == true) {
                      return Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return Container();
                  })
            ],
          ),
        ),
      ),
    );
  }

  bodyHeading({String heading = ''}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kbaseVerticalPadding + 4),
      child: Text(heading,
          style: GoogleFonts.lato(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
    );
  }

  bottomNavBar(DashboardBloc dashboardBloc) {
    return StreamBuilder<int>(
        stream: dashboardBloc.index,
        builder: (context, snapshot) {
          return CurvedNavigationBar(
            height: 60,
            animationDuration: Duration(milliseconds: 200),
            index: snapshot.data,
            backgroundColor: Colors.white,
            buttonBackgroundColor: Colors.grey.withOpacity(0.2),
            items: [
              Icon(
                Icons.group,
                size: 30,
                color: primaryColor,
              ),
              Icon(
                Icons.add,
                size: 30,
                color: primaryColor,
              ),
              Icon(
                Icons.contact_page,
                size: 30,
                color: primaryColor,
              ),
            ],
            onTap: (index) {
              if (index == 0) {
                // dashboardBloc.changeIndex(1);
                Navigator.pushNamed(context, kGroupScreen);
              } else if (index == 2) {
                // dashboardBloc.changeIndex(1);
                Navigator.pushNamed(context, kContactScreen);
              }
            },
          );
        });
  }

  appBar(AuthBloc authBloc, LocationBloc locationBloc) {
    return AppBar(
      centerTitle: false,
      backgroundColor: Colors.white,
      title: Text(
        'DashBoard',
        style: appBarTitleText(),
      ),
      leading: IconButton(
        icon: Icon(Icons.menu_open),
        onPressed: () {},
      ),
      actions: [
        Icon(
          Icons.notifications,
          color: primaryColor,
          size: 30,
        ),
        SizedBox(
          width: 15,
        ),
        IconButton(
            icon: Icon(Icons.tune, color: primaryColor, size: 30),
            onPressed: () {
              locationBloc.getCountry();
              AppBottomSheet().changeMyInterest(context);
            }),
        SizedBox(
          width: 15,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, kEditProfileScreen);
          },
          child: CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage(authBloc.getLoginResponse.profilePic),
          ),
        ),
        SizedBox(
          width: 15,
        ),
      ],
    );
  }
}

class VerticalList extends StatelessWidget {
  // int pageNo = 1;
  @override
  Widget build(BuildContext context) {
    var dashboardBloc = Provider.of<DashboardBloc>(context);
    return StreamBuilder<List<OpinionModel>>(
        stream: dashboardBloc.interestingToYou,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, index) {
                var s = snapshot.data[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppCard(
                    rating: s.rating.toString(),
                    videoURL: s.video.file,
                    userPostCover: s.createdBy.profilePic,
                    thumbnail: s.video.thumbnail,
                    stand: s.stand,
                    userName: s.details.userName,
                    topicName: s.details.topicName,
                    categoryName: s.details.categoryName,
                    subCategoryName: s.details.subCategoryName,
                    language: s.language,
                    createdAt: s.createdAt,
                    opinionID: s.video.id,
                  ),
                );
              });
        });
  }
}
