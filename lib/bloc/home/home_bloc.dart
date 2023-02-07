
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';

import '../../src/models/model_generator/home.dart';
import '../../src/src_index.dart';
import '../../widgets/loading_api.dart';

part 'home_event.dart';
part 'home_state.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState>{
  final UserRepository userRepository;

  HomeBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetHomeState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is InitGetHomeEvent) {
      yield* _getHome();
    }
  }
  Stream<HomeState> _getHome() async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingHomeState();
      final response = await userRepository.getHome();
      if(response.code == BASE_URL.SUCCESS_200){
        yield UpdateGetHomeState(response.data!);
      }
      else
        yield ErrorGetHomeState(response.message ?? "");
    } catch (e) {
      yield ErrorGetHomeState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static HomeBloc of(BuildContext context) => BlocProvider.of<HomeBloc>(context);
}