import 'package:flutter/material.dart';

import '../../../src/src_index.dart';
import '../../../widgets/widget/widget_button.dart';
import '../../../widgets/widget/widget_input.dart';


class SetCommandBuySell extends StatefulWidget {
  const SetCommandBuySell({
    Key? key,
  }) : super(key: key);

  @override
  State<SetCommandBuySell> createState() => _SetCommandBuySellState();
}

class _SetCommandBuySellState extends State<SetCommandBuySell> {
  bool switchActiveButton = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Đặt lệnh',
                style: AppStyle.DEFAULT_16
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              Wrap(
                children: [
                  SizedBox(
                    width: 70,
                    height: 30,
                    child: WidgetButton(
                      ontap: () {
                        switchActiveButton = true;
                        setState(() {});
                      },
                      isPrimaryButton: switchActiveButton,
                      backgroundColor:
                          !switchActiveButton ? AppColors.greyE6 : null,
                      widgetText: Text('Mua',
                          style: TextStyle(
                              fontSize: 12,
                              color: switchActiveButton
                                  ? AppColors.white
                                  : AppColors.black)),
                    ),
                  ),
                  const SizedBox(width: 5),
                  SizedBox(
                    width: 70,
                    height: 30,
                    child: WidgetButton(
                      ontap: (() {
                        switchActiveButton = false;
                        setState(() {});
                      }),
                      isPrimaryButton: !switchActiveButton,
                      backgroundColor:
                          switchActiveButton ? AppColors.greyE6 : null,
                      widgetText: Text('Bán',
                          style: TextStyle(
                              fontSize: 12,
                              color: !switchActiveButton
                                  ? AppColors.white
                                  : AppColors.black)),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                  child: WidgetInput(
                inputBorder: const OutlineInputBorder(),
                hintText: "Mã",
              )),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                  child: WidgetInput(
                hintText: 'Số lượng',
                inputBorder: const OutlineInputBorder(),
              )),
            ],
          ),
          WidgetInput(
            hintText: 'Giá',
            inputBorder: const OutlineInputBorder(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .27,
                height: 42,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.blue2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "69.5 ",
                      style: AppStyle.DEFAULT_12
                          .copyWith(color: AppColors.white),
                    ),
                    Text('Giá sàn',
                        style: AppStyle.DEFAULT_12
                            .copyWith(color: AppColors.white)),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .27,
                height: 42,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.blue2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("69.5",
                        style: AppStyle.DEFAULT_12
                            .copyWith(color: AppColors.white)),
                    Text('Giá tham chiếu',
                        style: AppStyle.DEFAULT_12
                            .copyWith(color: AppColors.white)),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .27,
                height: 42,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.blue2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("69.5",
                        style: AppStyle.DEFAULT_12
                            .copyWith(color: AppColors.white)),
                    Text('Giá trần',
                        style: AppStyle.DEFAULT_12
                            .copyWith(color: AppColors.white)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
