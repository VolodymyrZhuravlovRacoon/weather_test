import 'package:flutter/material.dart';
import 'package:test_weather/gen/assets.gen.dart';
import 'package:test_weather/shared/widgets/circular_loader.dart';
import 'package:test_weather/shared/widgets/layouts/base_state_info_layout.dart';

class SimpleLayout extends StatelessWidget {
  final Duration? duration;
  final Widget child;
  final bool? isLoading;
  final bool? isEmpty;
  final bool? isError;
  final String? retryText;
  final Widget? errorWidget;
  final Widget? emptyWidget;
  final Widget? loadingWidget;
  final Color? background;
  final VoidCallback? onRetry;

  const SimpleLayout({
    super.key,
    required this.child,
    this.duration,
    this.isLoading,
    this.isEmpty,
    this.isError,
    this.errorWidget,
    this.emptyWidget,
    this.loadingWidget,
    this.background,
    this.onRetry,
    this.retryText,
  });

  @override
  Widget build(BuildContext context) {
    Widget? infoChild;

    if (isLoading == true) {
      infoChild = loadingWidget ?? const CircularLoader();
    }

    if (infoChild == null && isError == true) {
      infoChild = errorWidget ??
          BaseStateInfoLayout(
              retryText: retryText,
              onRetry: onRetry,
              title: ('Request Error'),
              imagePath: Assets.images.smileCry.keyName);
    }

    if (infoChild == null && isEmpty == true) {
      infoChild = emptyWidget ??
          BaseStateInfoLayout(
            retryText: retryText,
            onRetry: onRetry,
            title: ('No Data'),
            imagePath: Assets.images.smileCry.keyName,
          );
    }

    return Material(
      color: background,
      child: Center(
        child: AnimatedSwitcher(
          duration: duration ?? Duration.zero,
          child: infoChild ?? child,
        ),
      ),
    );
  }
}
