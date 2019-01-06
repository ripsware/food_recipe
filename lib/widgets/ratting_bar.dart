import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class RattingBar extends StatelessWidget {
  RattingBar({
    this.value = 0,
    this.max = 5,
    this.iconSize = 18,
    Color color,
    Color emptyColor,
    IconData icon,
    IconData emptyIcon,
  }):
        this.icon = icon ?? CommunityMaterialIcons.star,
        this.emptyIcon = emptyIcon ?? icon ?? CommunityMaterialIcons.star,
        this.color = color ?? Color(0xFF7AE2AA),
        this.emptyColor = emptyColor == null ? (color ?? Color(0xFF7AE2AA)).withOpacity(.2) : emptyColor;

  final double value;
  final Color color;
  final Color emptyColor;
  final double max;
  final IconData icon;
  final IconData emptyIcon;
  final double iconSize;


  @override
  Widget build(BuildContext context) {
    final List<Widget> _icons = [];
    for(var i = 0; i < max; i++){
      _icons.add(Icon(i <= value ? icon : emptyIcon,
        size: this.iconSize,
        color: i <= value ? color : emptyColor,
      ));
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _icons,
    );
  }
}
