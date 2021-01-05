import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/controller/watchListBloc.dart';
import 'package:argued/frontend/widgets/AppTextField.dart';
import 'package:argued/frontend/widgets/AppappBar.dart';
import 'package:argued/model/WatchListModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WatchListScreen extends StatefulWidget {
  @override
  _WatchListScreenState createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  @override
  void initState() {
    var watchListBloc = Provider.of<WatchListBloc>(context,listen: false);
    watchListBloc.getWatchList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var watchListBloc = Provider.of<WatchListBloc>(context);

    return Scaffold(
        appBar: AppAppBar(title: 'Watch List'),
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: kbaseHorizontalPadding),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              AppTextField(
                onChanged: watchListBloc.changeSearchQuery,
                hintText: 'Find my hosts',
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
                    child: StreamBuilder<WatchListModel>(
                        stream: watchListBloc.watchList,
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: Text(
                                "No Host to Show",
                                style: listTileSubTitleText,
                              ),
                            );
                          }
                          var data = snapshot.data.data.following;

                          return StreamBuilder<String>(
                              stream: watchListBloc.searchQuery,
                              builder: (context, snapshot) {
                                if (snapshot.hasData && snapshot.data != "") {
                                  return ListView.builder(
                                    itemCount: data.length,
                                    itemBuilder: (context, index) {
                                      var d = data[index];

                                      if (d.username.contains(snapshot.data)) {
                                        return hostViewContainer(
                                            d.profilePic, d.username, d.id);
                                      }
                                      return Container(
                                        child: Center(
                                          child: Text(
                                            'No Host found!',
                                            style: listTileSubTitleText,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                                return ListView.builder(
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    var d = data[index];
                                    return hostViewContainer(
                                        d.profilePic, d.username, d.id);
                                  },
                                );
                              });
                        })),
              ),
            ],
          ),
        ));
  }

  hostViewContainer(String profilePic, String username, String email) {
    return ListTile(
      leading: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: profilePic,
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              Center(child: Icon(Icons.error)),
        ),
      ),
      title: Text(
        username,
        style: listTileTitleText,
      ),
      subtitle: Text(
        email,
        style: listTileSubTitleText,
      ),
    );
  }
}
