
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';


part 'read_noti_event.dart';
part 'read_noti_state.dart';

class ReadNotiBloc extends Bloc<ReadNotiEvent, ReadNotiState> {
  final UserRepository userRepository;

  ReadNotiBloc({required this.userRepository})
      : super(InProgressReadNotiState());

  @override
  void onTransition(Transition<ReadNotiEvent, ReadNotiState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<ReadNotiState> mapEventToState(ReadNotiEvent event) async* {
    if (event is ReadNotiSubmitted) {
      try{
        yield InProgressReadNotiState();
        var response = await userRepository.readNoti(id: event.id);
        if (response.code == BASE_URL.SUCCESS_200) {
          yield SuccessReadNotiState(message:  response.message!);
        } else {
          yield FailureReadNotiState(message: response.message!);
        }
      }catch(e){
        throw e;
      }
    }
  }



  static ReadNotiBloc of(BuildContext context) => BlocProvider.of<ReadNotiBloc>(context);
}
