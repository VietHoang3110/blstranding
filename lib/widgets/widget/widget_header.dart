import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quan_ly/src/src_index.dart';

class WidgetHeader extends StatefulWidget {
  const WidgetHeader({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<WidgetHeader> createState() => _WidgetHeaderState();
}

class _WidgetHeaderState extends State<WidgetHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      color: Colors.white,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              // Navigator.of(context).pop();
              Scaffold.of(context).openDrawer();
            },
            child: SvgPicture.asset(
              'assets/icons/Menu left.svg',
              color: Colors.black,
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: AppStyle.DEFAULT_16
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            width: 20,
            height: 20,
          )
        ],
      ),
    );
  }
}




class WidgetHeader2 extends StatefulWidget {
  const WidgetHeader2({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<WidgetHeader2> createState() => _WidgetHeader2State();
}

class _WidgetHeader2State extends State<WidgetHeader2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      color: Colors.white,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SvgPicture.asset(
              'assets/icons/back.svg',
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: AppStyle.DEFAULT_16
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            width: 20,
            height: 20,
          )
        ],
      ),
    );
  }
}
