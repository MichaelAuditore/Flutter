import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPress});
  final IconData icon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPress,
      elevation: 6.0,
      disabledElevation: 6.0,
      constraints: kMiniSizeConstraints,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
