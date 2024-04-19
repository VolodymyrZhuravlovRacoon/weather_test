import 'package:flutter/material.dart';
import 'package:test_weather/shared/res/dimens.dart';
import 'package:test_weather/shared/res/styles.dart';

class CityListItemWidget extends StatelessWidget {
  const CityListItemWidget(
      {super.key, this.temperature, this.onTab, this.name});

  final String? temperature;
  final String? name;
  final GestureTapCallback? onTab;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSize.k12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.k8)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: AppSize.k8,
              blurRadius: AppSize.k8,
              offset: const Offset(10, 9), // changes position of shadow
            ),
          ],
        ),
        padding: const EdgeInsets.all(AppSize.k18),
        margin: const EdgeInsets.fromLTRB(
            AppSize.k16, AppSize.k16, AppSize.k16, AppSize.k0),
        child: InkWell(
          borderRadius: BorderRadius.circular(AppSize.k8),
          onTap: onTab,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name ?? '',
                textAlign: TextAlign.left,
                style: AppStyles.nameTextStyle,
              ),
              const Expanded(child: SizedBox()),
              Visibility(
                visible: temperature != null,
                child: Text(
                  temperature ?? '',
                  textAlign: TextAlign.right,
                  style: AppStyles.nameTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
