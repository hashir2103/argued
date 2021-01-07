import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/controller/groupBloc.dart';
import 'package:argued/frontend/screens/contactScreen.dart';
import 'package:argued/frontend/widgets/AppTextField.dart';
import 'package:argued/frontend/widgets/AppUserProfileCircle.dart';
import 'package:argued/frontend/widgets/AppappBar.dart';
import 'package:argued/model/groupModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroupScreen extends StatefulWidget {
  @override
  _GroupScreenState createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  @override
  void initState() {
    var groupBloc = Provider.of<GroupBloc>(context, listen: false);
    groupBloc.getGroups();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var groupBloc = Provider.of<GroupBloc>(context);
    groupBloc.getGroups();
    return Scaffold(
        appBar: AppAppBar(title: 'My Groups'),
        floatingActionButton: FloatingActionButton(
            backgroundColor: primaryColor,
            child: Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 40,
              ),
            ),
            onPressed: () => null),
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: kbaseHorizontalPadding),
          child: Column(
            children: [
              AppTextField(
                showLabel: false,
                onChanged: groupBloc.changeSearchQuery,
                hintText: 'Find a group',
                icon: Icons.search,
                iconColor: primaryTextColor,
                size: 30,
                onTap: () {
                  print("search");
                },
              ),
              Expanded(
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: kbaseVerticalPadding),
                    child: StreamBuilder<GroupModel>(
                        stream: groupBloc.groups,
                        builder: (context, snapshot) {
                          if (!snapshot.hasError) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (!snapshot.hasData) {
                            return Center(
                              child: Text(
                                "No Group to show.",
                                style: listTileSubTitleText,
                              ),
                            );
                          }
                          var data = snapshot.data.data;
                          return StreamBuilder<String>(
                              stream: groupBloc.searchQuery,
                              builder: (context, snapshot) {
                                if (snapshot.hasData && snapshot.data != "") {
                                  return ListView.builder(
                                    itemCount: 1,
                                    itemBuilder: (context, index) {
                                      var c = data[index];
                                      if (c.name.contains(snapshot.data)) {
                                        return GestureDetector(
                                            onTap: () {},
                                            child: groupTile(
                                                unreadCount:
                                                    c.unreadCount ?? "",
                                                groupPic: kTempImage,
                                                name: c.name ?? "",
                                                description:
                                                    c.description ?? "",
                                                membersCount: c.members.length
                                                        .toString() ??
                                                    "",
                                                countryName:
                                                    c.countryName ?? "",
                                                lastMessageTime:
                                                    c.lastMessageMobile ??
                                                        DateTime.now(),
                                                createdAt: c.createdAt ??
                                                    DateTime.now()));
                                      }
                                      return Container();
                                    },
                                  );
                                }
                                return ListView.builder(
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    var c = data[index];
                                    return GestureDetector(
                                        onTap: () {},
                                        child: groupTile(
                                            unreadCount: c.unreadCount ?? "",
                                            groupPic: kTempImage,
                                            name: c.name ?? "",
                                            description: c.description ?? "",
                                            membersCount:
                                                c.members.length.toString() ??
                                                    "",
                                            countryName: c.countryName ?? "",
                                            lastMessageTime:
                                                c.lastMessageMobile ??
                                                    DateTime.now(),
                                            createdAt:
                                                c.createdAt ?? DateTime.now()));
                                  },
                                );
                              });
                        })),
              ),
            ],
          ),
        ));
  }

  groupTile({
    @required int unreadCount,
    @required String groupPic,
    @required String name,
    @required String description,
    @required String membersCount,
    @required String countryName,
    @required DateTime lastMessageTime,
    @required DateTime createdAt,
  }) {
    String m = getMonth(createdAt.month);
    return Card(
      child: Container(
        padding: EdgeInsets.only(right: 4, top: 2),
        margin: EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(8),
                child: Column(
                  children: [
                    UserCirle(
                      profilePic: groupPic,
                      height: 60,
                      width: 60,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: listTileTitleText,
                      ),
                      Text(
                        getFormatedTime(lastMessageTime),
                        style: listTileTrailingText,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              description,
                              style: listTileSubTitleText,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      (unreadCount > 0)
                          ? Row(
                              children: [
                                CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.red,
                                  child: Center(
                                    child: Text(
                                      "$unreadCount",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                              ],
                            )
                          : SizedBox(
                              height: 0,
                              width: 0,
                            )
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Divider(
                    height: 2,
                    color: primaryTextColor,
                    indent: 4,
                    endIndent: 4,
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
                            text: 'Members:',
                            style: listTileTitleText.copyWith(fontSize: 14)),
                        TextSpan(
                            text: membersCount,
                            style: listTileTitleText.copyWith(
                                fontSize: 14, color: Colors.red)),
                      ])),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Country:',
                            style: listTileTitleText.copyWith(fontSize: 14)),
                        TextSpan(
                            text: countryName,
                            style: listTileTitleText.copyWith(
                                fontSize: 14, color: Colors.red)),
                      ])),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Text(
                        "Since: $m ${createdAt.day},${createdAt.year}",
                        style: listTileSubTitleText,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

getMonth(int month) {
  var m;
  if (month == 1) {
    m = 'Jan';
  } else if (month == 2) {
    m = 'Feb';
  } else if (month == 3) {
    m = 'Mar';
  } else if (month == 4) {
    m = 'Apr';
  } else if (month == 5) {
    m = 'May';
  } else if (month == 6) {
    m = 'Jun';
  } else if (month == 7) {
    m = 'Jul';
  } else if (month == 8) {
    m = 'Aug';
  } else if (month == 9) {
    m = 'Sept';
  } else if (month == 10) {
    m = 'Oct';
  } else if (month == 11) {
    m = 'Nov';
  } else if (month == 12) {
    m = 'Dec';
  }
  return m;
}
