import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleSignButton extends StatelessWidget {
  final String label;
  final Color? bgColor;
  final Color? textColor;

  const GoogleSignButton(
      {Key? key, required this.label, this.bgColor, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 45,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(
          FontAwesomeIcons.google,
          color: Color(0xFF1F2937),
        ),
        label: Text(
          label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color:
                    (textColor == null) ? const Color(0xFF1F2937) : textColor,
                fontWeight: FontWeight.w600,
              ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              (bgColor != null) ? bgColor : const Color(0xFFF4F4F4)),
        ),
      ),
    );
  }
}
