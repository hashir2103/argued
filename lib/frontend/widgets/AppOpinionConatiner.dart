import 'package:argued/ArguedConfigs/color.dart';
import 'package:argued/ArguedConfigs/constant.dart';
import 'package:argued/ArguedConfigs/sizeConfig.dart';
import 'package:argued/ArguedConfigs/textStyles.dart';
import 'package:argued/frontend/screens/group/groupScreen.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class OpinionContainer extends StatefulWidget {
  final String catergoryName;
  final String subCatName;
  final String country;
  final String language;
  final DateTime createdAt;
  final String videoUrl;
  final String videoName;
  final String views;
  final String rating;
  final String thumbnail;
  final String createdBy;

  OpinionContainer({
    this.catergoryName = "",
    this.views = '',
    this.subCatName = '',
    this.country = '',
    this.language = '',
    this.createdAt,
    this.rating = '',
    this.videoUrl = '',
    this.videoName = '',
    this.thumbnail = kTempImage, this.createdBy,
  });
  @override
  _OpinionContainerState createState() => _OpinionContainerState();
}

class _OpinionContainerState extends State<OpinionContainer> {
  ChewieController _chewieController;
  bool showVideo = false;
  bool playing = true;
  @override
  void initState() {
    _chewieController = ChewieController(
        deviceOrientationsAfterFullScreen: [
          DeviceOrientation.portraitUp,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
          DeviceOrientation.portraitDown,
        ],
        videoPlayerController: VideoPlayerController.network(widget.videoUrl,
            videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true)),
        aspectRatio: 2.1 / 2.7,
        showControlsOnInitialize: false,
        // fullScreenByDefault: true,
        showControls: false,
        allowFullScreen: true,
        autoInitialize: true,
        autoPlay: false,
        looping: false,
        errorBuilder: (context, errorMsg) {
          return Center(
              child: Icon(
            Icons.error,
            color: primaryTextColor,
            size: 30,
          ));
        });
    super.initState();
  }

  @override
  void dispose() {
    _chewieController.videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String m = getMonth(widget.createdAt != null
        ? widget.createdAt.month
        : DateTime.now().month);

    return Card(
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onDoubleTap: () {
                      _chewieController.pause();
                      Navigator.pushNamed(context, kSingleOpinionScreen,
                          arguments: "${widget.videoName},${widget.videoUrl},${widget.createdBy}");
                    },
                    onTap: () {
                      if (!showVideo) {
                        setState(() {
                          showVideo = true;
                        });
                      }
                      _chewieController.togglePause();
                    },
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          decoration: (showVideo)
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                )
                              : BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(widget.thumbnail),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                          height: 190,
                          width: SizeConfig.screenWidth * .35,
                          child: (showVideo)
                              ? Chewie(
                                  controller: _chewieController,
                                )
                              : Container(),
                        ),
                        (showVideo)
                            ? Container()
                            : Positioned(
                                top: 8,
                                right: 8,
                                child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Center(
                                        child: Icon(
                                      Icons.play_arrow_sharp,
                                      // size: 45,
                                      color: primaryTextColor,
                                    ))),
                              ),
                      ],
                    ),
                  ),
                ],
              )),
          SizedBox(
            width: 4,
          ),
          Expanded(
              flex: 3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      Text(
                        widget.videoName,
                        style: listTileTitleText,
                      ),
                    ],
                  ),
                  Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      Text(
                        "${widget.country} , ${widget.language}",
                        style: listTileSubTitleText.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    widget.createdAt != null
                        ? "Posted: $m ${widget.createdAt.day}, ${widget.createdAt.year}"
                        : "Posted: $m ${DateTime.now().day}, ${DateTime.now().year}",
                    style: listTileSubTitleText,
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      Chip(
                        label: Text(
                          widget.catergoryName,
                          style: chipText,
                        ),
                        backgroundColor: primaryColor.withOpacity(0.2),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Chip(
                          label: Text(
                            widget.subCatName,
                            style: chipText,
                          ),
                          backgroundColor: primaryColor.withOpacity(0.2),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            Text(
                              widget.views,
                              style: listTileTitleText,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.remove_red_eye,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: widget.rating.split('.')[0],
                                  style: listTileTitleText),
                              TextSpan(
                                  text: ' Percent',
                                  style: listTileTitleText.copyWith(
                                      color: Colors.red)),
                            ])),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
