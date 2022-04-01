import 'package:flutter/material.dart';

class NotifyCard extends StatelessWidget {
  final String notifyImage;
  final String notifyText;
  final String notifyTime;
  const NotifyCard(
      {Key? key,
      required this.notifyImage,
      required this.notifyText,
      required this.notifyTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: _notify(context),
    );
  }

  Widget _notify(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _image(),
        const SizedBox(
          width: 10,
        ),
        _textData(context),
      ],
    );
  }

  Widget _textData(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            notifyText,
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            notifyTime,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }

  Widget _image() {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 0),
          ),
        ],
        image: DecorationImage(
          image: NetworkImage(notifyImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
