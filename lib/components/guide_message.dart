import 'package:flutter/material.dart';

class GuideMessage extends StatefulWidget {
  const GuideMessage(
      {Key? key,
      required this.title,
      required this.description,
      required this.imageUrl})
      : super(key: key);
  final String title;
  final String description;
  final String imageUrl;

  @override
  State<GuideMessage> createState() => _GuideMessageState();
}

class _GuideMessageState extends State<GuideMessage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _guideImage(context),
        const SizedBox(
          height: 30,
        ),
        _guideText(context),
        // _bottomBar(),
      ],
    );
  }

  Widget _guideImage(BuildContext context) {
    // Screen size
    var screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: screenSize.height * 0.3,
      child: Image(
        image: AssetImage(
          widget.imageUrl,
        ),
      ),
    );
  }

  Widget _guideText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline1,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          widget.description,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
