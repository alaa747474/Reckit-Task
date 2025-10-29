import 'package:flutter/material.dart';
import 'package:reckit_task/core/config/theme/custom_colors.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).extension<CustomColors>()?.warningColor,
      ),
    );
  }
}
