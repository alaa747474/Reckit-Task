import 'package:flutter/material.dart';
import 'package:reckit_task/core/widgets/loading_indicator.dart';

class AppNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final BorderRadius? borderRadius;

  const AppNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(8),
      child: Image.network(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        // ✅ Display a loading placeholder while image is loading
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return placeholder ??
              Container(
                width: width,
                height: height,
                color: Theme.of(context).dividerColor,
                alignment: Alignment.center,
                child: const LoadingIndicator(),
              );
        },
        // ✅ Display a fallback widget if loading fails
        errorBuilder: (context, error, stackTrace) {
          return errorWidget ??
              Container(
                width: width,
                height: height,
                color: Theme.of(context).dividerColor,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.error_outline_outlined,
                  color: Colors.grey,
                ),
              );
        },
      ),
    );
  }
}
