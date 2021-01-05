import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/controller/AuthBloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const AppAppBar({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var authBloc = Provider.of<AuthBloc>(context);
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: appBarTitleText(),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, kEditProfileScreen);
          },
          child: CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(authBloc.getLoginResponse.profilePic),
          ),
        ),
        SizedBox(
          width: 15,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
