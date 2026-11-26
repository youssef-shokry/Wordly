import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String textButton;
  final TextStyle font;
  final Color backGroundColor;

  const CustomButton({
    super.key,
    required this.textButton,
    required this.backGroundColor,
    required this.font
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backGroundColor,
        padding: EdgeInsets.only(
          top: 15,
          bottom: 15,
          left: 135.7,
          right: 135.7,
        ),
        minimumSize: Size(double.infinity, 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),

      onPressed: () {},
      child: Text(textButton , style: font,),
    );
  }
}
