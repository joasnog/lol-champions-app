import 'package:flutter/material.dart';

import '../utils/colors_utils.dart';

class RefreshButtonWidget extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final void Function() onTap;

  const RefreshButtonWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 160,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.gold,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          'Recarregar',
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
