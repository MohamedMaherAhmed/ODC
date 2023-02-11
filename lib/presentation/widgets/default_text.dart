import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
  final Color? color;
  final String text;
  final double? fontSize;
  final TextDecoration? textDecoration;

  const DefaultText({Key? key, this.color, required this.text, this.fontSize, this.textDecoration})
      : super(key: key);

  TextDecoration? underLineOrNot(TextDecoration? decorationForText){
    if(decorationForText == TextDecoration.underline){
      return decorationForText;
    }else{
      return decorationForText;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        decoration: underLineOrNot(textDecoration),
      ),
    );
  }
}
