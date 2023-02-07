
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';


part 'change_profile_noAvt_event.dart';
part 'change_profile_noAvt_state.dart';

class ChangeProfileNoAvtBloc extends Bloc<ChangeProfileNoAvtEvent, ChangeProfileNoAvtState> {
  final UserRepository userRepository;

  ChangeProfileNoAvtBloc({required this.userRepository})
      : super(InProgressChangeProfileNoAvtState());

  @override
  void onTransition(Transition<ChangeProfileNoAvtEvent, ChangeProfileNoAvtState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<ChangeProfileNoAvtState> mapEventToState(ChangeProfileNoAvtEvent event) async* {
    if (event is ChangeFileNoAvtSubmitted) {
      try{
        yield InProgressChangeProfileNoAvtState();
        var response = await userRepository.changeProfileNoAvt(
            email: event.email,
            phoneNumber: event.phoneNumber,
            dateOfBirth: event.dateOfBirth,
            gender: event.gender,
            address: event.address,
        );
        if (response.code == BASE_URL.SUCCESS_200) {
          yield SuccessChangeProfileNoAvtState(message:  response.message!);
        } else {
          yield FailureChangeProfileNoAvtState(message: response.message!);
        }
      }catch(e){
        throw e;
      }
    }
  }



  static ChangeProfileNoAvtBloc of(BuildContext context) => BlocProvider.of<ChangeProfileNoAvtBloc>(context);
}
