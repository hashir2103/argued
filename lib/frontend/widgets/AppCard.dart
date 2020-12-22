import 'package:flutter/material.dart';
import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/sizeConfig.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';

class AppCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Wrap(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 25,
              ),
              title: Text(
                'DisplayName',
                style: listTileTitleText,
              ),
              subtitle: Text(
                '+ Add host to watch list',
                style: listTileSubTitleText,
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "12 Apirl 2019",
                    style: listTileTrailingText,
                  ),
                  SizedBox(
                    height: 8,
                  )
                ],
              ),
            ),
            Container(
              color: Colors.blue,
              height: SizeConfig.screenHeight * 0.2,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, top: 8),
              child: Text(
                'Tourist places in the world',
                style: listTileTitleText,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 8,
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Chip(
                      label: Text(
                        'Politics',
                        style: chipText,
                      ),
                      backgroundColor: primaryColor.withOpacity(0.2),
                    ),
                    Chip(
                      label: Text(
                        'Other',
                        style: chipText,
                      ),
                      backgroundColor: primaryColor.withOpacity(0.2),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 8,
                  children: [
                    Chip(
                      label: Text(
                        'English',
                        style: chipText,
                      ),
                      backgroundColor: primaryColor.withOpacity(0.2),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              indent: 16,
              endIndent: 16,
              height: 4,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey.withOpacity(0.2),
                          child: Center(
                            child: Icon(
                              Icons.grade,
                              color: Colors.red.shade800,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Rate it',
                          style: listTileSubTitleText,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey.withOpacity(0.2),
                          child: Center(
                            child: Icon(
                              Icons.reply,
                              color: primaryTextColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Reply',
                          style: listTileSubTitleText,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey.withOpacity(0.2),
                          child: Center(
                            child:
                                Icon(Icons.ios_share, color: primaryTextColor),
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Share',
                          style: listTileSubTitleText,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AppCard2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Wrap(
          children: [
            Container(
              color: Colors.blue,
              height: SizeConfig.screenHeight * 0.2,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, top: 8),
              child: Text(
                'Tourist places in the world',
                style: listTileTitleText,
              ),
            ),
            Wrap(
              // direction: Axis.vertical,
              spacing: 8,
              children: [
                SizedBox(
                  height: 8,
                ),
                Chip(
                  label: Text(
                    'Modern Technology',
                    style: chipText,
                  ),
                  backgroundColor: primaryColor.withOpacity(0.2),
                ),
                Chip(
                  label: Text(
                    'Other',
                    style: chipText,
                  ),
                  backgroundColor: primaryColor.withOpacity(0.2),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    child: Center(
                      child: Icon(
                        Icons.grade,
                        color: Colors.red.shade800,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    child: Center(
                      child: Icon(
                        Icons.reply,
                        color: primaryTextColor,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    child: Center(
                      child: Icon(
                        Icons.ios_share,
                        color: primaryTextColor,
                      ),
                    ),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text('12 april 2019',style: listTileSubTitleText,)
                ),
                
              ],
            ),
            Divider(
              indent: 16,
              endIndent: 16,
              height: 4,
              thickness: 1,
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 24,
              ),
              title: Text(
                'DisplayName',
                style: listTileTitleText2,
              ),
              subtitle: Text(
                '+ Add host to watch list',
                style: listTileTrailingText,
              ),
              
            ),
          ],
        ),
      ),
    );
  }
}
