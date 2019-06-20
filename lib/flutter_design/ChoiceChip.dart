import 'package:flutter/material.dart';

class CustomChoiceChip extends StatefulWidget {
  final IconData iconData;
  final String stringText;
  final bool isSelected;

  CustomChoiceChip(this.iconData, this.stringText, this.isSelected);

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}
class _ChoiceChipState extends State<CustomChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: widget.isSelected
          ? BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.all(Radius.circular(20.0)))
          : null,
      child: Row(
        children: <Widget>[
          Icon(
            widget.iconData,
            size: 20,
            color: Colors.white,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            widget.stringText,
            style: TextStyle(color: Colors.white, fontSize: 16),
          )
        ],
      ),
    );
  }
}
