import 'package:flutter/material.dart';
import 'constants.dart';

class GenderCard extends StatelessWidget {
  final IconData icon;
  final String genderName;
  GenderCard({@required this.icon, @required this.genderName});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        icon,
        size: 81,
      ),
      SizedBox(
        height: 15,
      ),
      Text(
        genderName,
        style: kLabeltextStyle,
      ),
    ]);
  }
}
