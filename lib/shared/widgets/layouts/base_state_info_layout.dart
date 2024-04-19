import 'package:flutter/material.dart';
import 'package:test_weather/shared/res/dimens.dart';

class BaseStateInfoLayout extends StatelessWidget {
  final String? imagePath;
  final String title;
  final String? subtitle;
  final VoidCallback? onRetry;
  final String? retryText;

  const BaseStateInfoLayout({
    super.key,
    required this.title,
    this.retryText,
    this.imagePath,
    this.subtitle,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.k8),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: AppSize.k100),
            if (imagePath != null)
              Image.asset(
                imagePath!,
                width: AppSize.k80,
                height: AppSize.k80,
              ),
            const SizedBox(height: AppSize.k24),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: AppSize.k18,
              ),
              textAlign: TextAlign.center,
            ),
            if (subtitle != null)
              Padding(
                padding: const EdgeInsets.only(top: AppSize.k12),
                child: Text(
                  subtitle!,
                  textAlign: TextAlign.center,
                ),
              ),
            if (onRetry != null)
              Padding(
                padding: const EdgeInsets.only(
                  top: AppSize.k24,
                  left: AppSize.k8,
                  right: AppSize.k8,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.k50),
                    ),
                  ),
                  onPressed: onRetry,
                  child: Center(
                    child: Text(retryText ?? ''),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
