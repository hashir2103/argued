import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/frontend/widgets/AppCard.dart';
import 'package:argued/frontend/widgets/AppCarousel.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewerDashBoardScreen extends StatefulWidget {
  @override
  _ViewerDashBoardScreenState createState() => _ViewerDashBoardScreenState();
}

class _ViewerDashBoardScreenState extends State<ViewerDashBoardScreen> {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: bottomNavBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: kbaseHorizontalPadding),
          child: Wrap(
            children: [
              bodyHeading(heading: "Hot Topic this hour"),
              AppCard(),
              bodyHeading(heading: "Most watched in your selected topics"),
              AppCarousel(),
              bodyHeading(heading: "Interesting to you"),
              VerticalList(),
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

  bottomNavBar() {
    return CurvedNavigationBar(
      height: 60,
      animationDuration: Duration(milliseconds: 200),
      index: 1,
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
      onTap: (index) {},
    );
  }

  appBar() {
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
        Icon(Icons.tune, color: primaryColor, size: 30),
        SizedBox(
          width: 15,
        ),
        CircleAvatar(
          radius: 15,
        ),
        SizedBox(
          width: 15,
        ),
      ],
    );
  }
}

class VerticalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 8,
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppCard(),
          );
        });
  }
}
