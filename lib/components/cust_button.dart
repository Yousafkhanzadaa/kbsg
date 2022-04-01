import 'package:flutter/material.dart';

class CustButton extends StatelessWidget {
  final String label;
  final Color? bgColor;
  final Color? textColor;
  final Function()? onClick;

  const CustButton(
      {Key? key,
      required this.label,
      this.bgColor,
      this.textColor,
      this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 45,
      child: ElevatedButton(
        onPressed: onClick,
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: (textColor == null) ? Colors.white : textColor,
                fontWeight: FontWeight.w600,
              ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              (bgColor != null) ? bgColor : Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
