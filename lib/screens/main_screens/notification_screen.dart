import 'package:flutter/material.dart';
import 'package:kbsg/components/notify_card.dart';

class NotifyScreen extends StatefulWidget {
  const NotifyScreen({
    Key? key,
  }) : super(key: key);

  @override
  _NotifyScreenState createState() => _NotifyScreenState();
}

class _NotifyScreenState extends State<NotifyScreen> {
  List notifyImageList = [
    "https://1.bp.blogspot.com/-0ZUMPsBahSo/X0vuBttwtWI/AAAAAAAAdwM/_0Nuxi-PWUsgTsLdAmGZqILPiJf7N2bdACLcBGAsYHQ/s1600/best%2Bdp%2Bfor%2Bwhatsapp%2B%25281%2529.jpg",
    "https://ps.w.org/profile-builder/assets/icon-256x256.png?rev=2257592",
    "http://www.goodmorningimagesdownload.com/wp-content/uploads/2021/07/1080p-New-Cool-Whatsapp-Dp-Profile-Images-pictures-hd-1-300x300.jpg",
    "https://learnenglish.britishcouncil.org/sites/podcasts/files/styles/max_325x325/public/2021-10/RS8003_GettyImages-994576028-hig.jpg?itok=m0rIP3zI",
    "https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/137106531/original/af76851be3f941132a66deb7c9e6fda6d44cae3e/create-a-cool-custom-profile-picture-of-your-photo.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return NotifyCard(
            notifyImage: notifyImageList[index],
            notifyText: "You have new email notification.",
            notifyTime: "15 min ago",
          );
        },
      ),
    );
  }
}
