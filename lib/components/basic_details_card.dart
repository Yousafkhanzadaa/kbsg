import 'package:flutter/material.dart';

class BasicDetails extends StatelessWidget {
  final String desc;
  final String illustratin;
  final String title;

  const BasicDetails({
    Key? key,
    required this.illustratin,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _image(),
          const SizedBox(width: 15),
          _textData(context),
        ],
      ),
    );
  }

  Widget _image() {
    return Container(
      height: 60,
      width: 60,
      // margin: const EdgeInsets.all(5),
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
          image: NetworkImage(illustratin),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _textData(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            desc,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
