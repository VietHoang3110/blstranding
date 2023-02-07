import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/bloc/contact/contact_bloc.dart';
import 'package:quan_ly/widgets/widget_text.dart';

import '../../src/color.dart';
import '../../src/styles.dart';
import '../../src/values.dart';
import '../../widgets/widget/main_layout.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  void initState() {
    ContactBloc.of(context).add(InitGetContactEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        appbarColor: AppColors.white,
        appbarTitle: 'Liên hệ',
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: BlocBuilder<ContactBloc, ContactState>(
            builder: (context, state) {
              if(state is UpdateGetContactState){
                return Column(
                  children: [
                    // _itemContact(title: 'ID:', value: state.data[0].id.toString(),),
                    _itemContact(title: 'Tên:', value: state.data[0].name.toString(),),
                    _itemContact(title: 'Số điện thoại:', value: state.data[0].phone.toString(),),
                    _itemContact(title: 'Email:', value: state.data[0].email.toString(),),
                    _itemContact(title: 'Chức vụ:', value: state.data[0].postion.toString(),),
                    _itemContact(title: 'Ghi chú:', value: state.data[0].note.toString(),),
                    _itemContact(title: 'Facebook:', value: state.data[0].facebook.toString(),),
                    _itemContact(title: 'Zalo:', value: state.data[0].zalo.toString(),),
                  ],
                );
              }else{
                return Container();
              }
            },
          ),
        )
    );
  }
}

class _itemContact extends StatelessWidget {
  String title;
  String value;

  _itemContact({
    Key? key,
    required this.title,
    required this.value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: AppValue.widths * 0.3,
              child: WidgetText(
                title: title,
                style: AppStyle.DEFAULT_14.copyWith(height: 2),
                textAlign: TextAlign.justify,
              ),
            ),
            WidgetText(
              title: value,
              style: AppStyle.DEFAULT_14.copyWith(height: 2),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
        Container(margin: EdgeInsets.only(top: 6,bottom: 3), height: 1,width: AppValue.widths,color: AppColors.greyE1,)
      ],
    );
  }
}
