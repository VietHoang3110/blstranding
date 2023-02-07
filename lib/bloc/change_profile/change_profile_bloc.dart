
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';


part 'change_profile_event.dart';
part 'change_profile_state.dart';

class ChangeProfileBloc extends Bloc<ChangeProfileEvent, ChangeProfileState> {
  final UserRepository userRepository;

  ChangeProfileBloc({required this.userRepository})
      : super(InProgressChangeProfileState());

  @override
  void onTransition(Transition<ChangeProfileEvent, ChangeProfileState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<ChangeProfileState> mapEventToState(ChangeProfileEvent event) async* {
    if (event is ChangeFileSubmitted) {
      try{
        yield InProgressChangeProfileState();
        var response = await userRepository.changeProfile(
            sendimage: event.sendimage,
            email: event.email,
            phoneNumber: event.phoneNumber,
            dateOfBirth: event.dateOfBirth,
            gender: event.gender,
            address: event.address,
        );
        if (response.code == BASE_URL.SUCCESS_200) {
          yield SuccessChangeProfileState(message:  response.message!, avatar: response.avatar!);
        } else {
          yield FailureChangeProfileState(message: response.message!);
        }
      }catch(e){
        throw e;
      }
    }
  }



  static ChangeProfileBloc of(BuildContext context) => BlocProvider.of<ChangeProfileBloc>(context);
}
