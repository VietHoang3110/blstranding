import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:formz/formz.dart';
import 'package:quan_ly/storages/event_repository_storage.dart';

import '../../api_resfull/api.dart';
import '../../api_resfull/user_repository.dart';
import '../../src/models/model_generator/login.dart';
import '../../src/src_index.dart';
import '../../storages/share_local.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  final UserRepository userRepository;
  final EventRepositoryStorage localRepository;

  LoginBloc({required this.userRepository, required this.localRepository}) : super(InitLoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is FormSubmitted) {
      yield* _getLoginApp(event.username,event.password,event.type);
    }
  }
  Stream<LoginState> _getLoginApp(String username,String password, String type) async* {
    // LoadingApi().pushLoading();
    try {
      final response = await userRepository.getLoginApp(username,password,type);
      if(response.code == BASE_URL.SUCCESS_200){
        yield UpdateLoginState(response.data!, response.message!);
        await localRepository.saveUser(jsonEncode(response));
        await shareLocal.putString(PreferencesKey.TOKEN, response.data!.token!);
        await shareLocal.putString(PreferencesKey.Name, response.data!.fullname!);
        await shareLocal.putString(PreferencesKey.Avatar, response.data!.avatar!);
        await shareLocal.putBools(PreferencesKey.FIRST_TIME, true);
        await shareLocal.putString(dotenv.env[PreferencesKey.TOKEN]!, response.data!.token!);
        DioProvider.instance(token: response.data!.token);
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      }
      else {
        yield ErrorLoginState(response.message ?? '');
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    } catch (e) {
      yield ErrorLoginState(MESSAGES.CONNECT_ERROR);
      emit(state.copyWith(status: FormzStatus.submissionFailure));
      throw e;
    }
    // LoadingApi().popLoading();
  }


  static LoginBloc of(BuildContext context) => BlocProvider.of<LoginBloc>(context);
}