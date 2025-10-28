import 'package:flutter/material.dart';
import 'package:reckit_task/core/config/theme/custom_colors.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final FontWeight fontWeight;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,

    this.borderRadius = 30,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
    this.fontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: Theme.of(
        context,
      ).extension<CustomColors>()?.warningColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: padding,
      elevation: 0,
    );

    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: Colors.black),
            SizedBox(width: 8),
          ],
          Text(
            label,
            style: TextStyle(color: Colors.black, fontWeight: fontWeight),
          ),
        ],
      ),
    );
  }
}
