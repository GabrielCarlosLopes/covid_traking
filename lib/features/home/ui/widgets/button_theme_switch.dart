import 'package:flutter/material.dart';

class ButtonThemeSwitch extends StatelessWidget {
  final bool left;
  final Color bgColor;
  final Icon icon;
  final Function onPressed;
  const ButtonThemeSwitch({
    super.key,
    required this.left,
    required this.bgColor,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.only(
          topLeft: left ? const Radius.circular(50) : const Radius.circular(0),
          bottomLeft:
              left ? const Radius.circular(50) : const Radius.circular(0),
          topRight:
              !left ? const Radius.circular(50) : const Radius.circular(0),
          bottomRight:
              !left ? const Radius.circular(50) : const Radius.circular(0),
        ),
      ),
      child: IconButton(
        onPressed: () {
          onPressed();
        },
        icon: icon,
      ),
    );
  }
}
