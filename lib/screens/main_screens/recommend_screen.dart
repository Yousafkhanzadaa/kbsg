import 'package:flutter/material.dart';
import 'package:kbsg/components/notify_card.dart';
import 'package:kbsg/components/recommended_card.dart';

class RecommandedScreen extends StatefulWidget {
  const RecommandedScreen({
    Key? key,
  }) : super(key: key);

  @override
  _RecommandedScreenState createState() => _RecommandedScreenState();
}

class _RecommandedScreenState extends State<RecommandedScreen> {
  List books = [
    [
      "Think and Grow Rich",
      "Think and Grow Rich is a book written by Napoleon Hill in 1937 and promoted as a personal development and self-improvement book. He claimed to be inspired by a suggestion from business magnate and later-philanthropist Andrew Carnegie",
    ],
    [
      "Them Monk who sold his farrari",
      "The Monk Who Sold His Ferrari is a self-help book by Robin Sharma, a writer and motivational speaker. The book is a business fable derived from Sharma's personal experiences after leaving his career as a litigation lawyer at the age of 25.",
    ],
    [
      "The history of philosophy",
      "Philosophy has been around since the dawn of western civilization. The golden age of Greek philosophy took place in Athens in the 5th century BC. ... Today philosophical thought is applied to almost every component of life, from science to warfare, politics to artificial intelligence.",
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return RecommendedCard(title: books[index][0], desc: books[index][1]);
        },
      ),
    );
  }
}
