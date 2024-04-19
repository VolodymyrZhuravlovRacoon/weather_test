import 'package:flutter/material.dart';
import 'package:test_weather/shared/res/dimens.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: AppSize.k25,
        height: AppSize.k25,
        child: CircularProgressIndicator(
          strokeWidth: AppSize.k3,
        ),
      ),
    );
  }
}
