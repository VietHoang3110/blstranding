
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../src/src_index.dart';

class WidgetHistory extends StatelessWidget {
  const WidgetHistory(
      {Key? key,
      required this.icon,
        this.colorText,
      required this.title,
      required this.value,
      required this.color})
      : super(key: key);

  final String icon, title, value;
  final Color color;
  final Color? colorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16,left: 16),
      child: Container(
        width: AppValue.widths*0.5,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(5)),
              padding: const EdgeInsets.all(8),
              child: SvgPicture.asset(
                icon,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyle.DEFAULT_14
                      .copyWith(color: AppColors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  value,
                  style: AppStyle.DEFAULT_14
                      .copyWith(
                      fontWeight: FontWeight.w500,
                      color: colorText ?? AppColors.black
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
