import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';


part 'change_pass_event.dart';
part 'change_pass_state.dart';

class ChangePassBloc extends Bloc<ChangePassEvent, ChangePassState> {
  final UserRepository userRepository;

  ChangePassBloc({required this.userRepository})
      : super(InProgressChangePassState());

  @override
  void onTransition(Transition<ChangePassEvent, ChangePassState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<ChangePassState> mapEventToState(ChangePassEvent event) async* {
    if (event is ChangePassSubmitted) {
      try{
        yield InProgressChangePassState();
        var response = await userRepository.changePass(oldPassword: event.oldPassword, newPassword: event.newPassword, confirmPassword: event.confirmPassword);
        if (response.code == BASE_URL.SUCCESS_200) {
          yield SuccessChangePassState(message:  response.message!);
        } else {
          yield FailureChangePassState(message: response.message!);
        }
      }catch(e){
        throw e;
      }
    }
  }
  static ChangePassBloc of(BuildContext context) => BlocProvider.of<ChangePassBloc>(context);
}
