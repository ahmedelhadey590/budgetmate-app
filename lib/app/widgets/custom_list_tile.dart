import 'package:budgetmate/app/shared/Constatnts.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final VoidCallback onTap;
  final IconData? icon;
  final Color? iconColor;
  final String title;
  final FontWeight? fontWeight;
  final double? fontSize;
  const CustomListTile(
      {required this.onTap,
      required this.title,
      this.fontSize,
      this.fontWeight,
      this.icon,
      this.iconColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? maincolor),
      title: Text(
        title,
        style: TextStyle(
            fontWeight: fontWeight ?? FontWeight.normal,
            fontSize: fontSize ?? 16),
      ),
      // trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      focusColor: Colors.grey.shade100,
      onTap: () => onTap(),
    );
  }
}
