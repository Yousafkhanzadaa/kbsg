import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RecommendedCard extends StatelessWidget {
  final String title;
  final String desc;
  const RecommendedCard({Key? key, required this.title, required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          _textData(context),
          const SizedBox(
            height: 20,
          ),
          _downloadBtn(context),
        ],
      ),
    );
  }

  Widget _textData(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: const Color(0xFF374151)),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }

  Widget _downloadBtn(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 45,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(
          FontAwesomeIcons.download,
          color: Colors.white,
          size: 13,
        ),
        label: Text(
          "Download",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
        ),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).primaryColor)),
      ),
    );
  }
}
