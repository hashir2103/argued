import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/sizeConfig.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/controller/AuthBloc.dart';
import 'package:argued/controller/contactBloc.dart';
import 'package:argued/frontend/screens/contactScreen.dart';
import 'package:argued/frontend/widgets/AppTextField.dart';
import 'package:argued/frontend/widgets/AppappBar.dart';
import 'package:argued/model/chatModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  final String userName;

  const ChatScreen({Key key, @required this.userName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var contactBloc = Provider.of<ContactBloc>(context);
    var authBloc = Provider.of<AuthBloc>(context);
    return Scaffold(
        appBar: AppAppBar(title: userName),
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: kbaseHorizontalPadding),
          child: Column(
            children: [
              Expanded(
                  child: StreamBuilder<ChatModel>(
                      stream: contactBloc.chatMessages,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.data.data.isEmpty ||
                            snapshot.data.data == null) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'No messages yet.',
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Say Hi to $userName!',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          );
                        }
                        var d = snapshot.data.data;
                        return ListView.builder(
                            itemCount: d.length,
                            itemBuilder: (context, i) {
                              var m = d[i];
                              if (authBloc.getuserId == m.sentBy.id) {
                                return SenderContainer(
                                    profilePic: m.sentBy.profilePic,
                                    message: m.message,
                                    time: m.createdAt);
                              }
                              return RecieverContainer(
                                  profilePic: m.sentBy.profilePic,
                                  message: m.message,
                                  time: m.createdAt);
                            });
                      })),
              AppTextField(
                showLabel: false,
                hintText: 'Type your message..',
                icon: Icons.send,
                iconColor: primaryColor,
                size: 25,
                onTap: () {},
              ),
              SizedBox(
                height: 4,
              )
            ],
          ),
        ));
  }
}

// ignore: must_be_immutable
class SenderContainer extends StatelessWidget {
  final String profilePic;
  final String message;
  final DateTime time;
  final double radius = 15;

  const SenderContainer(
      {Key key,
      @required this.profilePic,
      @required this.message,
      @required this.time})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            constraints:
                BoxConstraints(maxWidth: SizeConfig.screenWidth * 0.65),
            child: Card(
              shadowColor: Colors.transparent,
              color: primaryColor.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(radius),
                  bottomRight: Radius.circular(radius),
                  topLeft: Radius.circular(radius),
                ),
              ),
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          message,
                          style: chatText,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      bottom: -20,
                      left: 0,
                      child: Text(
                        getFormatedTime(time),
                        style: listTileTrailingText,
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Container(
            height: 40,
            width: 40,
            child: ClipOval(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: profilePic,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Center(child: Icon(Icons.error)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class RecieverContainer extends StatelessWidget {
  final String profilePic;
  final String message;
  final DateTime time;
  final double radius = 15;

  const RecieverContainer(
      {Key key,
      @required this.profilePic,
      @required this.message,
      @required this.time})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            child: ClipOval(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: profilePic,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Center(child: Icon(Icons.error)),
              ),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Container(
            constraints:
                BoxConstraints(maxWidth: SizeConfig.screenWidth * 0.65),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius),
                topRight: Radius.circular(radius),
              )),
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          message,
                          style: chatText,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      bottom: -20,
                      right: 0,
                      child: Text(
                        getFormatedTime(time),
                        style: listTileTrailingText,
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
